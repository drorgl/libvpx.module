# Copyright (c) 2012 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
{
	'variables': {
		'libvpx_build_vp9%': 1,
		'libvpx_source%': 'source/libvpx',
		'library' : 'static_library',
		#'library' : 'shared_library',
		# Disable LTO for neon targets
		# crbug.com/408997
		'use_lto%': 0,
		'os_posix' : "<!(node -e \"console.log((/^win/.test(process.platform) ? '0' : '1'))\")",
		'msan': 0,
		'use_system_yasm%' : "<!(node -e \"try{var x = require('child_process').spawnSync('yasm',[]);if (x.error){console.log(0);}else{console.log(1);}}catch(e){console.log(0)}\")",
		
		
		'conditions': [
			['os_posix==1', {
				'asm_obj_extension': 'o',
			}],
			['OS=="win"', {
				'asm_obj_extension': 'obj',
			}],

			['msan==1', {
				'target_arch_full': 'generic',
			}, {
				'conditions': [
					['(target_arch=="arm" or target_arch=="armv7") and arm_neon==1', {
						'target_arch_full': 'arm-neon',
					}, {
						'conditions': [
							['OS=="android" and ((target_arch=="arm" or target_arch=="armv7") and arm_neon==0)', {
								'target_arch_full': 'arm-neon-cpu-detect',
							}, {
								'target_arch_full': '<(target_arch)',
							}],
						],
					}],
					['target_arch=="arm64"', {
						'target_arch_full': 'arm64',
					}],
				],
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
	'target_defaults': {
		'target_conditions': [
			['<(libvpx_build_vp9)==0', {
				'sources/': [ ['exclude', '(^|/)vp9/'], ],
			}],
		],
		'variables': {
			'conditions': [
				['OS=="win" and buildtype=="Official"', {
					# Do not set to 'size', as it results in an error on win64.
					'optimize' :'speed',
				}],
			],
			'clang_warning_flags': [
				# libvpx heavily relies on implicit enum casting.
				'-Wno-conversion',
				# libvpx does `if ((a == b))` in some places.
				'-Wno-parentheses-equality',
			],
			'clang_warning_flags_unset': [
				# libvpx does assert(!"foo"); in some places.
				'-Wstring-conversion',
			],
		},
		
		'configurations':{
			'Debug':{
				'conditions': [
				  ['target_arch=="x64"', {
					'msvs_configuration_platform': 'x64',
				  }],
				],
				'defines':[
					'DEBUG',
				],
				'msvs_settings': {				
					'VCLinkerTool' : {
						'GenerateDebugInformation' : 'true',
						'conditions':[
							['target_arch=="x64"', {
								'TargetMachine' : 17 # /MACHINE:X64
							}],
						],
						
					}
				}
			},
			'Release':{
				'conditions': [
				  ['target_arch=="x64"', {
					'msvs_configuration_platform': 'x64',
				  }],
				],
				'msvs_settings': {				
					'VCLinkerTool' : {
						'conditions':[
							['target_arch=="x64"', {
								'TargetMachine' : 17 # /MACHINE:X64
							}],
						],
						
					}
				}
			},
		},
		
		'conditions': [
			['OS=="linux" and target_arch=="ia32"',{
				'cflags':[
					'-m32',
					'-msse2',
				],
				'ldflags':[
					'-m32',
					'-L/usr/lib32',
					'-L/usr/lib32/debug',
				],
			}],
			['OS=="linux" and target_arch=="x64"',{
				'cflags':[
					'-m64',
					'-fPIC',
					
				],
				'ldflags':[
					'-m64',
				],
			}],
			['target_arch == "x64" and library == "static_library"',{
				'cflags':[
					'-fvisibility=hidden',
				],
			}],
			['OS == "linux"',{
				'link_settings':{
					'libraries':[
						'-lpthread'
					],
				},
			}],
		],
	},
	
	'conditions': [

		['target_arch=="ia32"', {
			'includes': ['libvpx_srcs_x86_intrinsics.gypi', ],
		}],
		['target_arch=="x64" and msan==0', {
			'includes': ['libvpx_srcs_x86_64_intrinsics.gypi', ],
		}],
		[ '(target_arch=="arm" or target_arch=="armv7") and arm_neon==0 and OS=="android"', {
		  # When building for targets which may not have NEON (but may!), include
		  # support for neon and hide it behind Android cpu-features.
		  'includes': ['libvpx_srcs_arm_neon_cpu_detect_intrinsics.gypi', ],
		}],
		[ '(target_arch != "arm" and target_arch != "armv7") and \
			(target_arch != "mipsel" and target_arch != "mips64el")', {
			'targets': [
			{
				# This libvpx target contains both encoder and decoder.
				# Encoder is configured to be realtime only.
				'target_name': 'libvpx',
				'type': '<(library)',
				'variables': {
					'yasm_output_path': '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',
					'OS_CATEGORY%': '<(OS_CATEGORY)',
					'yasm_flags': [
						'-DCHROMIUM',
						'-I', 'source/config/<(OS_CATEGORY)/<(target_arch_full)',
						'-I', 'source/config',
						'-I', '<(libvpx_source)',
					],
					# yasm only gets the flags we define. It doesn't inherit any of the
					# really useful defines that come with a gcc invocation. In this
					# case, we rely on __ANDROID__ to set 'rand' to 'lrand48'.
					# Previously we used the builtin _rand but that's gone away.
					'conditions': [
						['OS=="android"', {
							'yasm_flags': [
								'-D__ANDROID__',
							],
						}],
					],
			  },
				'includes': [
					'yasm_compile.gypi'
				],
				'include_dirs': [
					'source/config/<(OS_CATEGORY)/<(target_arch_full)',
					'source/config',
					'<(libvpx_source)',
					'<(libvpx_source)/vp8/common',
					'<(libvpx_source)/vp8/decoder',
					'<(libvpx_source)/vp8/encoder',
					'<(shared_generated_dir)', # Provides vpx_rtcd.h.
				],
				'direct_dependent_settings': {
					'include_dirs': [
						'<(libvpx_source)',
					],
				},
				'sources': [
					'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.c',
					
				],
				
				# VS2010 does not correctly incrementally link obj files generated
				# from asm files. This flag disables UseLibraryDependencyInputs to
				# avoid this problem.
				'msvs_2010_disable_uldi_when_referenced': 1,
			  'conditions': [
				['OS == "win"',{
					'defines':[
						'WIN32',
					],
					'sources':[
						'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx.def',
						'vpx.rc',
					],
				}],
				['target_arch=="ia32"', {
				  'includes': [
					'libvpx_srcs_x86.gypi',
				  ],
				  'dependencies': [
					'libvpx_intrinsics_mmx',
					'libvpx_intrinsics_sse2',
					# Currently no sse3 intrinsic functions
					#'libvpx_intrinsics_sse3',
					'libvpx_intrinsics_ssse3',
					'libvpx_intrinsics_sse4_1',
					# Currently no avx intrinsic functions
					#'libvpx_intrinsics_avx',
					'libvpx_intrinsics_avx2',
				  ],
				  'conditions':[
					['library == "Xstatic_library"',{
						'direct_dependent_settings': {
							'dependencies':[
								'libvpx_intrinsics_mmx',
								'libvpx_intrinsics_sse2',
								# Currently no sse3 intrinsic functions
								#'libvpx_intrinsics_sse3',
								'libvpx_intrinsics_ssse3',
								'libvpx_intrinsics_sse4_1',
								# Currently no avx intrinsic functions
								#'libvpx_intrinsics_avx',
								'libvpx_intrinsics_avx2',
							],
						},
					}],
				  ],
				}],
				['target_arch=="arm64"', {
				  'includes': [ 'libvpx_srcs_arm64.gypi', ],
				}],
				['target_arch=="x64"', {
				  'conditions': [
					['msan==1', {
					  'includes': [ 'libvpx_srcs_generic.gypi', ],
					}, {
					  'includes': [
						'libvpx_srcs_x86_64.gypi',
					  ],
					  'dependencies': [
						'libvpx_intrinsics_mmx',
						'libvpx_intrinsics_sse2',
						# Currently no sse3 intrinsic functions
						#'libvpx_intrinsics_sse3',
						'libvpx_intrinsics_ssse3',
						'libvpx_intrinsics_sse4_1',
						# Currently no avx intrinsic functions
						#'libvpx_intrinsics_avx',
						'libvpx_intrinsics_avx2',
					  ],
					  
					  'conditions':[
						['library == "Xstatic_library"',{
							'direct_dependent_settings': {
								'dependencies':[
									'libvpx_intrinsics_mmx',
									'libvpx_intrinsics_sse2',
									# Currently no sse3 intrinsic functions
									#'libvpx_intrinsics_sse3',
									'libvpx_intrinsics_ssse3',
									'libvpx_intrinsics_sse4_1',
									# Currently no avx intrinsic functions
									#'libvpx_intrinsics_avx',
									'libvpx_intrinsics_avx2',
								],
							},
						}],
					  ],
					  
					}],
				  ],
				}],
			  ],
			},
      ],
    },
    ],
    # 'libvpx' target for mipsel and mips64el builds.
    [ 'target_arch=="mipsel" or target_arch=="mips64el"', {
      'targets': [
        {
          # This libvpx target contains both encoder and decoder.
          # Encoder is configured to be realtime only.
          'target_name': 'libvpx',
          'type': '<(library)',
          'variables': {
            'shared_generated_dir':
              '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',
          },
          'includes': [
            'libvpx_srcs_mips.gypi',
          ],
          'include_dirs': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)',
            'source/config',
            '<(libvpx_source)',
            '<(libvpx_source)/vp8/common',
            '<(libvpx_source)/vp8/decoder',
            '<(libvpx_source)/vp8/encoder',
          ],
          'direct_dependent_settings': {
            'include_dirs': [
              '<(libvpx_source)',
            ],
          },
          'sources': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.c',
          ],
        },
      ],
    },
    ],
    # 'libvpx' target for ARM builds.
    [ '(target_arch=="arm" or target_arch=="armv7") ', {
      'targets': [
        {
          # This libvpx target contains both encoder and decoder.
          # Encoder is configured to be realtime only.
          'target_name': 'libvpx',
          'type': '<(library)',

          # Copy the script to the output folder so that we can use it with
          # absolute path.
          'copies': [{
            'destination': '<(shared_generated_dir)',
            'files': [
              '<(ads2gas_script_path)',
              '<(ads2gas_script_include)',
            ],
          }],

          # Rule to convert .asm files to .S files.
          'rules': [
            {
              'rule_name': 'convert_asm',
              'extension': 'asm',
              'inputs': [
                '<(shared_generated_dir)/<(ads2gas_script)',
                '<(shared_generated_dir)/thumb.pm',
              ],
              'outputs': [
                '<(shared_generated_dir)/<(RULE_INPUT_ROOT).S',
              ],
              'action': [
                'bash',
                '-c',
                'cat <(RULE_INPUT_PATH) | perl <(shared_generated_dir)/<(ads2gas_script) -chromium > <(shared_generated_dir)/<(RULE_INPUT_ROOT).S',
              ],
              'process_outputs_as_sources': 1,
              'message': 'Convert libvpx asm file for ARM <(RULE_INPUT_PATH)',
            },
          ],

          'variables': {
            'variables': {
              'conditions': [
                ['OS=="ios"', {
                  'ads2gas_script%': 'ads2gas_apple.pl',
                }, {
                  'ads2gas_script%': 'ads2gas.pl',
                }],
              ],
            },
            'ads2gas_script%': '<(ads2gas_script)',
            # Location of the assembly conversion script.
            'ads2gas_script_path': '<(libvpx_source)/build/make/<(ads2gas_script)',
            'ads2gas_script_include': '<(libvpx_source)/build/make/thumb.pm',
          },
          'xcode_settings': {
            'OTHER_CFLAGS': [
              '-I<!(pwd)/source/config/<(OS_CATEGORY)/<(target_arch_full)',
              '-I<!(pwd)/source/config',
              '-I<(shared_generated_dir)',
            ],
          },
          'include_dirs': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)',
            'source/config',
            '<(libvpx_source)',
          ],
          'direct_dependent_settings': {
            'include_dirs': [
              '<(libvpx_source)',
            ],
          },
		  'sources': [
            'source/config/<(OS_CATEGORY)/<(target_arch_full)/vpx_config.c',
          ],
          'conditions': [
            # Libvpx optimizations for ARMv6 or ARMv7 without NEON.
            ['arm_neon==0', {
              'conditions': [
                ['OS=="android"', {
                  'includes': [
                    'libvpx_srcs_arm_neon_cpu_detect.gypi',
                  ],
                  'dependencies': [
                    'libvpx_intrinsics_neon',
		  ],
                  'cflags': [
                    '-Wa,-mfpu=neon',
                  ],
                }, {
                  'includes': [
                    'libvpx_srcs_arm.gypi',
                  ],
                }],
              ],
            }],
            # Libvpx optimizations for ARMv7 with NEON.
            ['arm_neon==1', {
              'includes': [
                'libvpx_srcs_arm_neon.gypi',
              ],
            }],
            ['OS == "android"', {
              'includes': [
                 'cpufeatures.gypi',
              ],
            }],
            ['OS == "ios"', {
              'xcode_settings': {
                'OTHER_CFLAGS!': [
                  # Breaks at least boolhuff_armv5te:token_high_bit_not_set_ev.
                  '-fstack-protector-all',  # Implies -fstack-protector
                ],
              },
            }],
          ],
        },
      ],
    }],
  ],
}
