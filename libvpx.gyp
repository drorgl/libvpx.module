# Copyright (c) 2012 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
{
  'variables': {
    'conditions': [
      ['os_posix==1', {
        'asm_obj_extension': 'o',
      }],
      ['OS=="win"', {
        'asm_obj_extension': 'obj',
      }],

      ['target_arch=="arm" and arm_neon==1', {
        'target_arch_full': 'arm-neon',
      }, {
        'target_arch_full': '<(target_arch)',
      }],

      # Conversion to libvpx arch names.
      ['target_arch=="arm" and arm_neon==1', {
        'libvpx_arch': 'armv7',
      }],
      ['target_arch=="arm" and arm_neon==0', {
        'libvpx_arch': 'armv6',
      }],
      ['target_arch=="ia32"', {
        'libvpx_arch': 'x86',
      }],
      ['target_arch=="x64"', {
        'libvpx_arch': 'x86_64',
      }],

      ['os_posix == 1 and OS != "mac"', {
        'OS_CATEGORY%': 'linux',
      }, {
        'OS_CATEGORY%': '<(OS)',
      }],
    ],

    # Location of the intermediate output.
    'shared_generated_dir': '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',
  },

  'conditions': [
    [ 'target_arch != "arm"', {
      'targets': [
        {
          # This libvpx target contains both encoder and decoder.
          # Encoder is configured to be realtime only.
          'target_name': 'libvpx',
          'type': 'static_library',
          'variables': {
            'yasm_output_path': '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',
            'OS_CATEGORY%': '<(OS_CATEGORY)',
            'yasm_flags': [
              '-D', 'CHROMIUM',
              '-I', 'source/config/<(OS_CATEGORY)/<(target_arch)',
              '-I', 'source/libvpx',
              '-I', '<(shared_generated_dir)', # Generated assembly offsets
            ],
          },
          'dependencies': [
            'gen_asm_offsets',
            'gen_rtcd_header',
          ],
          'includes': [
            '../yasm/yasm_compile.gypi'
          ],
          'include_dirs': [
            'source/config/<(OS_CATEGORY)/<(target_arch)',
            'source/libvpx',
            'source/libvpx/vp8/common',
            'source/libvpx/vp8/decoder',
            'source/libvpx/vp8/encoder',
            '<(shared_generated_dir)', # Provides vpx_rtcd.h.
          ],
          'direct_dependent_settings': {
            'include_dirs': [
              'source/libvpx',
            ],
          },
          # VS2010 does not correctly incrementally link obj files generated
          # from asm files. This flag disables UseLibraryDependencyInputs to
          # avoid this problem.
          'msvs_2010_disable_uldi_when_referenced': 1,
          'conditions': [
            [ 'target_arch=="ia32"', {
              'includes': [
                'libvpx_srcs_x86.gypi',
              ],
            }],
            [ 'target_arch=="x64"', {
              'includes': [
                'libvpx_srcs_x86_64.gypi',
              ],
            }],
            ['clang == 1', {
              'xcode_settings': {
                'WARNING_CFLAGS': [
                  # libvpx heavily relies on implicit enum casting.
                  '-Wno-conversion',
                  # libvpx does `if ((a == b))` in some places.
                  '-Wno-parentheses-equality',
                ],
              },
              'cflags': [
                '-Wno-conversion',
                '-Wno-parentheses-equality',
              ],
            }],
          ],
        },
      ],
    },
    ],
    # 'libvpx' target for ARM builds.
    [ 'target_arch=="arm" ', {
      'targets': [
        {
          # This libvpx target contains both encoder and decoder.
          # Encoder is configured to be realtime only.
          'target_name': 'libvpx',
          'type': 'static_library',

          # Copy the script to the output folder so that we can use it with
          # absolute path.
          'copies': [{
            'destination': '<(shared_generated_dir)',
            'files': [
              '<(ads2gas_script_path)',
            ],
          }],

          # Rule to convert .asm files to .S files.
          'rules': [
            {
              'rule_name': 'convert_asm',
              'extension': 'asm',
              'inputs': [ '<(shared_generated_dir)/<(ads2gas_script)', ],
              'outputs': [
                '<(shared_generated_dir)/<(RULE_INPUT_ROOT).S',
              ],
              'action': [
                'bash',
                '-c',
                'cat <(RULE_INPUT_PATH) | perl <(shared_generated_dir)/<(ads2gas_script) > <(shared_generated_dir)/<(RULE_INPUT_ROOT).S',
              ],
              'process_outputs_as_sources': 1,
              'message': 'Convert libvpx asm file for ARM <(RULE_INPUT_PATH).',
            },
          ],

          'variables': {
            # Location of the assembly conversion script.
            'ads2gas_script': 'ads2gas.pl',
            'ads2gas_script_path': 'source/libvpx/build/make/<(ads2gas_script)',
          },
          'cflags': [
            # We need to explicitly tell the GCC assembler to look for
            # .include directive files from the place where they're
            # generated to.
            '-Wa,-I,<!(pwd)/source/config/<(OS_CATEGORY)/<(target_arch_full)',
          ],
          'include_dirs': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)',
            'source/libvpx',
          ],
          'direct_dependent_settings': {
            'include_dirs': [
              'source/libvpx',
            ],
          },
          'conditions': [
            # Libvpx optimizations for ARMv6 or ARMv7 without NEON.
            ['arm_neon==0', {
              'includes': [
                'libvpx_srcs_arm.gypi',
              ],
            }],
            # Libvpx optimizations for ARMv7 with NEON.
            ['arm_neon==1', {
              'includes': [
                'libvpx_srcs_arm_neon.gypi',
              ],
            }],
            ['OS == "android"', {
              'include_dirs': [
                '<(android_ndk_include)',
                '<(android_ndk_include)/machine',
              ],
              'defines': [
                'ANDROID_CPU_ARM_FEATURE_NEON=4',
              ],
            }],
          ],
        },
      ],
    }],
  ],
  'targets': [
    {
      # A tool that runs on host to tract integers from object file.
      'target_name': 'libvpx_obj_int_extract',
      'type': 'executable',
      'toolsets': ['host'],
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch_full)',
        'source/libvpx',
      ],
      'sources': [
        'source/libvpx/build/make/obj_int_extract.c',
      ]
    },
    {
      # A target to generate vpx_rtcd.h from the current configuration.
      # This target is a hard dependency because the vpx_rtcd.h is needed by
      # multiple targets to build properly.
      'target_name': 'gen_rtcd_header',
      'type': 'none',
      'actions': [
        {
          # Take vpx_config.h and generate a build configuration file.
          'action_name': 'gen_config_options',
          'inputs': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.h',
            'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.asm',
          ],
          'outputs': [
            '<(shared_generated_dir)/libvpx.config',
          ],
          'action': [
            'bash', '-c',
            './lint_config.sh -p -h source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.h -a source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.asm > <@(_outputs)',
          ],
        },
        {
          # Take the build configuration file and output vpx_rtcd.h.
          'action_name': 'gen_rtcd_header',
          'inputs': [
            '<(shared_generated_dir)/libvpx.config',
            'source/libvpx/vp8/common/rtcd_defs.sh',
            'source/libvpx/build/make/rtcd.sh',
          ],
          'outputs': [
            '<(shared_generated_dir)/vpx_rtcd.h',
          ],
          'action': [
            'bash', '-c',
            'source/libvpx/build/make/rtcd.sh --arch=<(libvpx_arch) --sym=vpx_rtcd --config=<(shared_generated_dir)/libvpx.config source/libvpx/vp8/common/rtcd_defs.sh > <@(_outputs)',
          ],
        },
      ],
    },
    {
      # A library that contains assembly offsets needed.
      'target_name': 'libvpx_asm_offsets',
      'type': '<(library)',
      'dependencies': [
        'gen_rtcd_header',
      ],
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch_full)',
        'source/libvpx',
        '<(shared_generated_dir)',
      ],
      'sources': [
        '<(shared_generated_dir)/vpx_rtcd.h',
        'source/libvpx/vp8/common/asm_com_offsets.c',
        'source/libvpx/vp8/decoder/asm_dec_offsets.c',
        'source/libvpx/vp8/encoder/asm_enc_offsets.c',
      ],
    },
    {
      # A target that takes assembly offsets library and generate the
      # corresponding assembly files.
      # This target is a hard dependency because the generated .asm files
      # are needed all assembly optimized files in libvpx.
      'target_name': 'gen_asm_offsets',
      'type': 'none',
      'dependencies': [
        'libvpx_asm_offsets',
        'libvpx_obj_int_extract#host',
      ],
      'hard_dependency': 1,
      # TODO(hclam): This step needs to be platform specific.
      'actions': [
        {
          # Take archived .a file and unpack it unto .o files.
          'action_name': 'unpack_lib_posix',
          'inputs': [
            'unpack_lib_posix.sh',
          ],
          'outputs': [
            '<(shared_generated_dir)/asm_com_offsets.o',
            '<(shared_generated_dir)/asm_dec_offsets.o',
            '<(shared_generated_dir)/asm_enc_offsets.o',
          ],
          'action': [
            '<(DEPTH)/third_party/libvpx/unpack_lib_posix.sh',
            '-d', '<(shared_generated_dir)',
            '-a', '<(LIB_DIR)/libvpx_asm_offsets.a',
            '-a', '<(LIB_DIR)/third_party/libvpx/libvpx_asm_offsets.a',
            '-f', 'asm_com_offsets.o',
            '-f', 'asm_dec_offsets.o',
            '-f', 'asm_enc_offsets.o',
          ],
          'process_output_as_sources': 1,
        },
      ],
      'rules': [
        {
          # Rule to extract integer values for each symbol from an object file.
          'rule_name': 'obj_int_extract',
          'extension': 'o',
          'inputs': [ '<(PRODUCT_DIR)/libvpx_obj_int_extract', ],
          'outputs': [
            '<(shared_generated_dir)/<(RULE_INPUT_ROOT).asm',
          ],
          'variables': {
            'conditions': [
              ['target_arch=="arm"', {
                'asm_format': 'gas',
              }, {
                'asm_format': 'rvds',
              }],
            ],
          },
          'action': [
            'bash',
            '-c',
            '<(PRODUCT_DIR)/libvpx_obj_int_extract <(asm_format) <(RULE_INPUT_PATH) > <(shared_generated_dir)/<(RULE_INPUT_ROOT).asm',
          ],
          'message': 'Generate assembly offsets <(RULE_INPUT_PATH).',
        },
      ],
    },
    {
      'target_name': 'simple_encoder',
      'type': 'executable',
      'dependencies': [
        'libvpx',
      ],

      # Copy the script to the output folder so that we can use it with
      # absolute path.
      'copies': [{
        'destination': '<(shared_generated_dir)/simple_encoder',
        'files': [
          'source/libvpx/examples/gen_example_code.sh',
        ],
      }],

      # Rule to convert .txt files to .c files.
      'rules': [
        {
          'rule_name': 'generate_example',
          'extension': 'txt',
          'inputs': [ '<(shared_generated_dir)/simple_encoder/gen_example_code.sh', ],
          'outputs': [
            '<(shared_generated_dir)/<(RULE_INPUT_ROOT).c',
          ],
          'action': [
            'bash',
            '-c',
            '<(shared_generated_dir)/simple_encoder/gen_example_code.sh <(RULE_INPUT_PATH) > <(shared_generated_dir)/<(RULE_INPUT_ROOT).c',
          ],
          'process_outputs_as_sources': 1,
          'message': 'Generate libvpx example code <(RULE_INPUT_PATH).',
        },
      ],
      'sources': [
        'source/libvpx/examples/simple_encoder.txt',
      ]
    },
    {
      'target_name': 'simple_decoder',
      'type': 'executable',
      'dependencies': [
        'libvpx',
      ],

      # Copy the script to the output folder so that we can use it with
      # absolute path.
      'copies': [{
        'destination': '<(shared_generated_dir)/simple_decoder',
        'files': [
          'source/libvpx/examples/gen_example_code.sh',
        ],
      }],

      # Rule to convert .txt files to .c files.
      'rules': [
        {
          'rule_name': 'generate_example',
          'extension': 'txt',
          'inputs': [ '<(shared_generated_dir)/simple_decoder/gen_example_code.sh', ],
          'outputs': [
            '<(shared_generated_dir)/<(RULE_INPUT_ROOT).c',
          ],
          'action': [
            'bash',
            '-c',
            '<(shared_generated_dir)/simple_decoder/gen_example_code.sh <(RULE_INPUT_PATH) > <(shared_generated_dir)/<(RULE_INPUT_ROOT).c',
          ],
          'process_outputs_as_sources': 1,
          'message': 'Generate libvpx example code <(RULE_INPUT_PATH).',
        },
      ],
      'sources': [
        'source/libvpx/examples/simple_decoder.txt',
      ]
    },
  ],
}

# Local Variables:
# tab-width:2
# indent-tabs-mode:nil
# End:
# vim: set expandtab tabstop=2 shiftwidth=2:
