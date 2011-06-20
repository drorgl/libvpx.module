# Copyright (c) 2011 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
{
  'variables': {
    'conditions': [
      ['OS=="mac" or OS=="linux"', {
        'asm_obj_extension': 'o',
      }],
      ['OS=="win"', {
        'asm_obj_extension': 'obj',
      }],
    ],
  },
  'conditions': [
    [ '(OS=="linux" or OS=="mac" or OS=="win") and target_arch!="arm" and target_arch!="arm-neon"', {
      'targets': [
        {
          # This libvpx target contains both encoder and decoder.
          # Encoder is configured to be realtime only.
          'target_name': 'libvpx',
          'type': 'static_library',
          'variables': {
            'shared_generated_dir':
              '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',
            'yasm_path': '<(PRODUCT_DIR)/yasm',
            'conditions': [
              [ 'OS=="linux" and target_arch=="ia32"', {
                'yasm_flags': [
                  '-felf32',
                  '-m', 'x86',
                  '-I', 'source/config/linux/ia32',
                  '-I', 'source/libvpx',
                ],
              }],
              [ 'OS=="linux" and target_arch=="x64"', {
                'yasm_flags': [
                  '-felf64',
                  '-m', 'amd64',
                  '-I', 'source/config/linux/x64',
                  '-I', 'source/libvpx',
                ],
              }],
              [ 'OS=="mac" and target_arch=="ia32"', {
                'yasm_flags': [
                  '-fmacho32',
                  '-m', 'x86',
                  '-I', 'source/config/mac/ia32',
                  '-I', 'source/libvpx',
                ],
              }],
              [ 'OS=="win" and target_arch=="ia32"', {
                'yasm_flags': [
                  '-fwin32',
                  '-m', 'x86',
                  '-I', 'source/config/win/ia32',
                  '-I', 'source/libvpx',
                ],
              }],
            ],
          },
          'dependencies': [
            '../yasm/yasm.gyp:yasm#host',
          ],
          'include_dirs': [
            'source/config/<(OS)/<(target_arch)',
            'source/libvpx',
            'source/libvpx/vp8/common',
            'source/libvpx/vp8/decoder',
            'source/libvpx/vp8/encoder',
          ],
          'cflags!': [
            # Ensure the symbols are exported since this library gets wrapped by
            # ffmpeg's shared lib.  When we stop doing that (crbug.com/70687)
            # this can go away.
            '-fvisibility=hidden',
          ],
          'conditions': [
            [ 'OS=="mac"', {
              'xcode_settings': {
                'GCC_SYMBOLS_PRIVATE_EXTERN': 'NO',  # No -fvisibility=hidden
              },
            }],
          ],
          'rules': [
            {
              'rule_name': 'assemble',
              'extension': 'asm',
              'inputs': [ '<(yasm_path)', ],
              'outputs': [
                '<(shared_generated_dir)/<(RULE_INPUT_ROOT).<(asm_obj_extension)',
              ],
              'action': [
                '<(yasm_path)',
                '<@(yasm_flags)',
                '-o', '<(shared_generated_dir)/<(RULE_INPUT_ROOT).<(asm_obj_extension)',
                '<(RULE_INPUT_PATH)',
              ],
              'process_outputs_as_sources': 1,
              'message': 'Build libvpx yasm build <(RULE_INPUT_PATH).',
            },
          ],

          'sources': [
            'source/libvpx/vpx/src/vpx_decoder.c',
            'source/libvpx/vpx/src/vpx_decoder_compat.c',
            'source/libvpx/vpx/src/vpx_encoder.c',
            'source/libvpx/vpx/src/vpx_codec.c',
            'source/libvpx/vpx/src/vpx_image.c',
            'source/libvpx/vpx_mem/vpx_mem.c',
            'source/libvpx/vpx_scale/generic/vpxscale.c',
            'source/libvpx/vpx_scale/generic/yv12config.c',
            'source/libvpx/vpx_scale/generic/yv12extend.c',
            'source/libvpx/vpx_scale/generic/scalesystemdependent.c',
            'source/libvpx/vpx_scale/generic/gen_scalers.c',
            'source/libvpx/vp8/common/alloccommon.c',
            'source/libvpx/vp8/common/blockd.c',
            'source/libvpx/vp8/common/debugmodes.c',
            'source/libvpx/vp8/common/entropy.c',
            'source/libvpx/vp8/common/entropymode.c',
            'source/libvpx/vp8/common/entropymv.c',
            'source/libvpx/vp8/common/extend.c',
            'source/libvpx/vp8/common/filter.c',
            'source/libvpx/vp8/common/findnearmv.c',
            'source/libvpx/vp8/common/generic/systemdependent.c',
            'source/libvpx/vp8/common/idctllm.c',
            'source/libvpx/vp8/common/invtrans.c',
            'source/libvpx/vp8/common/loopfilter.c',
            'source/libvpx/vp8/common/loopfilter_filters.c',
            'source/libvpx/vp8/common/mbpitch.c',
            'source/libvpx/vp8/common/modecont.c',
            'source/libvpx/vp8/common/modecontext.c',
            'source/libvpx/vp8/common/quant_common.c',
            'source/libvpx/vp8/common/recon.c',
            'source/libvpx/vp8/common/reconinter.c',
            'source/libvpx/vp8/common/reconintra.c',
            'source/libvpx/vp8/common/reconintra4x4.c',
            'source/libvpx/vp8/common/setupintrarecon.c',
            'source/libvpx/vp8/common/swapyv12buffer.c',
            'source/libvpx/vp8/common/treecoder.c',
            'source/libvpx/vp8/common/x86/x86_systemdependent.c',
            'source/libvpx/vp8/common/x86/vp8_asm_stubs.c',
            'source/libvpx/vp8/common/x86/loopfilter_x86.c',
            'source/libvpx/vp8/vp8_cx_iface.c',
            'source/libvpx/vp8/encoder/bitstream.c',
            'source/libvpx/vp8/encoder/boolhuff.c',
            'source/libvpx/vp8/encoder/dct.c',
            'source/libvpx/vp8/encoder/encodeframe.c',
            'source/libvpx/vp8/encoder/encodeintra.c',
            'source/libvpx/vp8/encoder/encodemb.c',
            'source/libvpx/vp8/encoder/encodemv.c',
            'source/libvpx/vp8/encoder/ethreading.c',
            'source/libvpx/vp8/encoder/firstpass.c',
            'source/libvpx/vp8/encoder/generic/csystemdependent.c',
            'source/libvpx/vp8/encoder/mcomp.c',
            'source/libvpx/vp8/encoder/modecosts.c',
            'source/libvpx/vp8/encoder/onyx_if.c',
            'source/libvpx/vp8/encoder/pickinter.c',
            'source/libvpx/vp8/encoder/picklpf.c',
            'source/libvpx/vp8/encoder/psnr.c',
            'source/libvpx/vp8/encoder/quantize.c',
            'source/libvpx/vp8/encoder/ratectrl.c',
            'source/libvpx/vp8/encoder/rdopt.c',
            'source/libvpx/vp8/encoder/sad_c.c',
            'source/libvpx/vp8/encoder/segmentation.c',
            'source/libvpx/vp8/encoder/tokenize.c',
            'source/libvpx/vp8/encoder/treewriter.c',
            'source/libvpx/vp8/encoder/variance_c.c',
            'source/libvpx/vp8/encoder/temporal_filter.c',
            'source/libvpx/vp8/encoder/x86/x86_csystemdependent.c',
            'source/libvpx/vp8/encoder/x86/variance_mmx.c',
            'source/libvpx/vp8/encoder/x86/variance_sse2.c',
            'source/libvpx/vp8/encoder/x86/variance_ssse3.c',
            'source/libvpx/vp8/vp8_dx_iface.c',
            'source/libvpx/vp8/decoder/dboolhuff.c',
            'source/libvpx/vp8/decoder/decodemv.c',
            'source/libvpx/vp8/decoder/decodframe.c',
            'source/libvpx/vp8/decoder/dequantize.c',
            'source/libvpx/vp8/decoder/detokenize.c',
            'source/libvpx/vp8/decoder/generic/dsystemdependent.c',
            'source/libvpx/vp8/decoder/onyxd_if.c',
            'source/libvpx/vp8/decoder/threading.c',
            'source/libvpx/vp8/decoder/idct_blk.c',
            'source/libvpx/vp8/decoder/reconintra_mt.c',
            'source/libvpx/vp8/decoder/x86/x86_dsystemdependent.c',
            'source/libvpx/vp8/decoder/x86/idct_blk_mmx.c',
            'source/libvpx/vp8/decoder/x86/idct_blk_sse2.c',
            'source/libvpx/vpx_ports/x86_cpuid.c',
            # Yasm inputs.
            'source/libvpx/vpx_ports/x86_abi_support.asm',
            'source/libvpx/vpx_ports/emms.asm',
            'source/libvpx/vp8/decoder/x86/dequantize_mmx.asm',
            'source/libvpx/vp8/common/x86/subpixel_ssse3.asm',
            'source/libvpx/vp8/common/x86/iwalsh_sse2.asm',
            'source/libvpx/vp8/common/x86/loopfilter_sse2.asm',
            'source/libvpx/vp8/common/x86/subpixel_sse2.asm',
            'source/libvpx/vp8/common/x86/recon_sse2.asm',
            'source/libvpx/vp8/common/x86/idctllm_sse2.asm',
            'source/libvpx/vp8/common/x86/loopfilter_mmx.asm',
            'source/libvpx/vp8/common/x86/subpixel_mmx.asm',
            'source/libvpx/vp8/common/x86/recon_mmx.asm',
            'source/libvpx/vp8/common/x86/iwalsh_mmx.asm',
            'source/libvpx/vp8/common/x86/idctllm_mmx.asm',
            # ssim_opt.asm excluded for two reasons:
            # 1. x64 only as of libvpx hash 82315be.
            # 2. slows encode speed (when stats enabled).
            #'source/libvpx/vp8/encoder/x86/ssim_opt.asm',
            'source/libvpx/vp8/encoder/x86/encodeopt.asm',
            'source/libvpx/vp8/encoder/x86/quantize_mmx.asm',
            'source/libvpx/vp8/encoder/x86/sad_sse4.asm',
            'source/libvpx/vp8/encoder/x86/quantize_ssse3.asm',
            'source/libvpx/vp8/encoder/x86/variance_impl_ssse3.asm',
            'source/libvpx/vp8/encoder/x86/sad_ssse3.asm',
            'source/libvpx/vp8/encoder/x86/sad_sse3.asm',
            'source/libvpx/vp8/encoder/x86/temporal_filter_apply_sse2.asm',
            'source/libvpx/vp8/encoder/x86/subtract_sse2.asm',
            'source/libvpx/vp8/encoder/x86/quantize_sse2.asm',
            'source/libvpx/vp8/encoder/x86/fwalsh_sse2.asm',
            'source/libvpx/vp8/encoder/x86/sad_sse2.asm',
            'source/libvpx/vp8/encoder/x86/variance_impl_sse2.asm',
            'source/libvpx/vp8/encoder/x86/dct_sse2.asm',
            'source/libvpx/vp8/encoder/x86/subtract_mmx.asm',
            'source/libvpx/vp8/encoder/x86/dct_mmx.asm',
            'source/libvpx/vp8/encoder/x86/sad_mmx.asm',
            'source/libvpx/vp8/encoder/x86/variance_impl_mmx.asm',
            # Generated by ./source/configure and checked in.
            'source/config/<(OS)/<(target_arch)/vpx_config.c',
          ]
        }
      ]
    }
    ]
  ],
  
  'targets': [
    # libvpx_lib is currently not being used since we use libvpx inside
    # libavcodec. Keeping this just in case we need this later.
    {
      'target_name': 'libvpx_lib',
      'type': 'none',
      'variables': {
        'libvpx_lib': 'libvpx.a',
      },
      'conditions': [
        # This section specifies the folder for looking for libvpx.a.
        #
        ['OS=="linux" and target_arch=="ia32"', {
          'variables': {
            'libvpx_path': 'lib/linux/ia32',
          },
        }],
        ['OS=="linux" and target_arch=="x64"', {
          'variables': {
            'libvpx_path': 'lib/linux/x64',
          },
        }],
        ['OS=="linux" and target_arch=="arm" and arm_neon==1', {
          'variables': {
            'libvpx_path': 'lib/linux/arm-neon',
          },
        }],
        ['OS=="linux" and target_arch=="arm" and arm_neon==0', {
          'variables': {
            'libvpx_path': 'lib/linux/arm',
          },
        }],
        ['OS=="win"', {
          'variables': {
            'libvpx_path': 'lib/win/ia32',
          },
        }],
        ['OS=="mac"', {
          'variables': {
            'libvpx_path': 'lib/mac/ia32',
          },
        }],
      ],
      'actions': [
        {
          'action_name': 'copy_lib',
          'inputs': [
            '<(libvpx_path)/<(libvpx_lib)',
          ],
          'outputs': [
            '<(SHARED_INTERMEDIATE_DIR)/<(libvpx_lib)',
          ],
          'action': [
            'cp',
            '<(libvpx_path)/<(libvpx_lib)',
            '<(SHARED_INTERMEDIATE_DIR)/<(libvpx_lib)',
          ],
          'message': 'Copying libvpx.a into <(SHARED_INTERMEDIATE_DIR)',
        },
      ],
      'all_dependent_settings': {
        'link_settings': {
          'libraries': [
            '<(SHARED_INTERMEDIATE_DIR)/<(libvpx_lib)',
          ],
        },
      },
    },
    {
      'target_name': 'libvpx_include',
      'type': 'none',
      'direct_dependent_settings': {
        'include_dirs': [
          'include',
        ],
      },
    }
  ],
}

# Local Variables:
# tab-width:2
# indent-tabs-mode:nil
# End:
# vim: set expandtab tabstop=2 shiftwidth=2:
