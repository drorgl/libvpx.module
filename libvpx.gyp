# Copyright (c) 2011 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
{
  'variables': {
    # Generic libvpx C sources for both x86 and ARM targets.
    'libvpx_generic_sources': [
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
      'source/libvpx/vp8/decoder/dboolhuff.c',
      'source/libvpx/vp8/decoder/decodemv.c',
      'source/libvpx/vp8/decoder/decodframe.c',
      'source/libvpx/vp8/decoder/dequantize.c',
      'source/libvpx/vp8/decoder/detokenize.c',
      'source/libvpx/vp8/decoder/generic/dsystemdependent.c',
      'source/libvpx/vp8/decoder/idct_blk.c',
      'source/libvpx/vp8/decoder/onyxd_if.c',
      'source/libvpx/vp8/decoder/reconintra_mt.c',
      'source/libvpx/vp8/decoder/threading.c',
      'source/libvpx/vp8/encoder/bitstream.c',
      'source/libvpx/vp8/encoder/dct.c',
      'source/libvpx/vp8/encoder/encodeframe.c',
      'source/libvpx/vp8/encoder/encodeintra.c',
      'source/libvpx/vp8/encoder/encodemb.c',
      'source/libvpx/vp8/encoder/encodemv.c',
      'source/libvpx/vp8/encoder/ethreading.c',
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
      'source/libvpx/vp8/vp8_cx_iface.c',
      'source/libvpx/vp8/vp8_dx_iface.c',
      'source/libvpx/vpx/src/vpx_codec.c',
      'source/libvpx/vpx/src/vpx_decoder.c',
      'source/libvpx/vpx/src/vpx_decoder_compat.c',
      'source/libvpx/vpx/src/vpx_encoder.c',
      'source/libvpx/vpx/src/vpx_image.c',
      'source/libvpx/vpx_mem/vpx_mem.c',
      'source/libvpx/vpx_scale/generic/gen_scalers.c',
      'source/libvpx/vpx_scale/generic/scalesystemdependent.c',
      'source/libvpx/vpx_scale/generic/vpxscale.c',
      'source/libvpx/vpx_scale/generic/yv12config.c',
      'source/libvpx/vpx_scale/generic/yv12extend.c',
    ],
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
    [ '(OS=="linux" or OS=="mac" or OS=="win") and target_arch!="arm"', {
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
                  '-DPREFIX',
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
            '<@(libvpx_generic_sources)',
            # x86 specific C sources.
            'source/libvpx/vp8/common/x86/x86_systemdependent.c',
            'source/libvpx/vp8/common/x86/vp8_asm_stubs.c',
            'source/libvpx/vp8/common/x86/loopfilter_x86.c',
            'source/libvpx/vp8/encoder/boolhuff.c',
            'source/libvpx/vp8/encoder/x86/x86_csystemdependent.c',
            'source/libvpx/vp8/encoder/x86/variance_mmx.c',
            'source/libvpx/vp8/encoder/x86/variance_sse2.c',
            'source/libvpx/vp8/encoder/x86/variance_ssse3.c',
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
          ],
        },
      ],
    },
    ],
    # 'libvpx' target for Chrome OS ARM builds.
    [ 'chromeos==1 and target_arch=="arm"', {
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

            # Location of the intermediate output.
            'shared_generated_dir': '<(SHARED_INTERMEDIATE_DIR)/third_party/libvpx',

            # Conditions to generate arm-neon as an target.
            'conditions': [
              ['target_arch=="arm" and arm_neon==1', {
                'target_arch_full': 'arm-neon',
              }, {
                'target_arch_full': '<(target_arch)',
              }],
            ],

            # List of assembly files.
            'armv5te_sources': [
              'source/libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm',
              'source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_armv5.asm',
              'source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_mbrow_armv5.asm',
              'source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_partitions_armv5.asm',
            ],
            'armv6_sources': [
              'source/libvpx/vp8/common/arm/armv6/bilinearfilter_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/copymem16x16_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/copymem8x4_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/copymem8x8_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/dc_only_idct_add_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/filter_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/idct_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/iwalsh_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/loopfilter_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/recon_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/simpleloopfilter_v6.asm',
              'source/libvpx/vp8/common/arm/armv6/sixtappredict8x4_v6.asm',
              'source/libvpx/vp8/decoder/arm/armv6/dequant_dc_idct_v6.asm',
              'source/libvpx/vp8/decoder/arm/armv6/dequant_idct_v6.asm',
              'source/libvpx/vp8/decoder/arm/armv6/dequantize_v6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_fast_fdct4x4_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_fast_quantize_b_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_mse16x16_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_sad16x16_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_subtract_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_variance16x16_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_variance8x8_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_variance_halfpixvar16x16_h_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_variance_halfpixvar16x16_hv_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/vp8_variance_halfpixvar16x16_v_armv6.asm',
              'source/libvpx/vp8/encoder/arm/armv6/walsh_v6.asm',
              'source/libvpx/vp8/decoder/arm/armv6/idct_blk_v6.c',
            ],
            'arm_neon_sources': [
              'source/libvpx/vp8/common/arm/neon/bilinearpredict16x16_neon.asm',
              'source/libvpx/vp8/common/arm/neon/bilinearpredict4x4_neon.asm',
              'source/libvpx/vp8/common/arm/neon/bilinearpredict8x4_neon.asm',
              'source/libvpx/vp8/common/arm/neon/bilinearpredict8x8_neon.asm',
              'source/libvpx/vp8/common/arm/neon/buildintrapredictorsmby_neon.asm',
              'source/libvpx/vp8/common/arm/neon/copymem16x16_neon.asm',
              'source/libvpx/vp8/common/arm/neon/copymem8x4_neon.asm',
              'source/libvpx/vp8/common/arm/neon/copymem8x8_neon.asm',
              'source/libvpx/vp8/common/arm/neon/dc_only_idct_add_neon.asm',
              'source/libvpx/vp8/common/arm/neon/iwalsh_neon.asm',
              'source/libvpx/vp8/common/arm/neon/loopfilter_neon.asm',
              'source/libvpx/vp8/common/arm/neon/loopfiltersimplehorizontaledge_neon.asm',
              'source/libvpx/vp8/common/arm/neon/loopfiltersimpleverticaledge_neon.asm',
              'source/libvpx/vp8/common/arm/neon/mbloopfilter_neon.asm',
              'source/libvpx/vp8/common/arm/neon/recon16x16mb_neon.asm',
              'source/libvpx/vp8/common/arm/neon/recon2b_neon.asm',
              'source/libvpx/vp8/common/arm/neon/recon4b_neon.asm',
              'source/libvpx/vp8/common/arm/neon/reconb_neon.asm',
              'source/libvpx/vp8/common/arm/neon/save_neon_reg.asm',
              'source/libvpx/vp8/common/arm/neon/shortidct4x4llm_1_neon.asm',
              'source/libvpx/vp8/common/arm/neon/shortidct4x4llm_neon.asm',
              'source/libvpx/vp8/common/arm/neon/sixtappredict16x16_neon.asm',
              'source/libvpx/vp8/common/arm/neon/sixtappredict4x4_neon.asm',
              'source/libvpx/vp8/common/arm/neon/sixtappredict8x4_neon.asm',
              'source/libvpx/vp8/common/arm/neon/sixtappredict8x8_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/dequant_idct_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/dequantizeb_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/idct_dequant_0_2x_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/idct_dequant_dc_0_2x_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/idct_dequant_dc_full_2x_neon.asm',
              'source/libvpx/vp8/decoder/arm/neon/idct_dequant_full_2x_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/fastfdct4x4_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/fastfdct8x4_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/fastquantizeb_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/sad16_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/sad8_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/shortfdct_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/subtract_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/variance_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_memcpy_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_mse16x16_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_shortwalsh4x4_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_subpixelvariance16x16_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_subpixelvariance16x16s_neon.asm',
              'source/libvpx/vp8/encoder/arm/neon/vp8_subpixelvariance8x8_neon.asm',
              'source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copyframe_func_neon.asm',
              'source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copyframeyonly_neon.asm',
              'source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copysrcframe_func_neon.asm',
              'source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_extendframeborders_neon.asm',

              # C files.
              'source/libvpx/vp8/common/arm/neon/recon_neon.c',
              'source/libvpx/vp8/decoder/arm/neon/idct_blk_neon.c',
              'source/libvpx/vpx_scale/arm/scalesystemdependent.c',
              'source/libvpx/vpx_scale/arm/yv12extend_arm.c',
            ],
          },
          'cflags': [
            # We need to explicitly tell the GCC assembler to look for
            # .include directive files from the place where they're
            # generated to.
            '-Wa,-I,third_party/libvpx/source/config/<(OS)/<(target_arch_full)',
          ],
          'cflags!': [
            # Ensure the symbols are exported since this library gets wrapped by
            # ffmpeg's shared lib.  When we stop doing that (crbug.com/70687)
            # this can go away.
            '-fvisibility=hidden',
          ],
          'include_dirs': [
            'source/config/<(OS)/<(target_arch_full)',
            'source/libvpx',
          ],
          'sources': [
            '<@(libvpx_generic_sources)',
            # Generated by ./source/configure and checked in.
            'source/config/<(OS)/<(target_arch_full)/vpx_config.c',
            'source/config/<(OS)/<(target_arch_full)/vpx_config.h',
            # ARM specific C sources.
            'source/libvpx/vp8/common/arm/arm_systemdependent.c',
            'source/libvpx/vp8/common/arm/bilinearfilter_arm.c',
            'source/libvpx/vp8/common/arm/bilinearfilter_arm.h',
            'source/libvpx/vp8/common/arm/filter_arm.c',
            'source/libvpx/vp8/common/arm/idct_arm.h',
            'source/libvpx/vp8/common/arm/loopfilter_arm.c',
            'source/libvpx/vp8/common/arm/loopfilter_arm.h',
            'source/libvpx/vp8/common/arm/recon_arm.h',
            'source/libvpx/vp8/common/arm/reconintra_arm.c',
            'source/libvpx/vp8/common/arm/subpixel_arm.h',
            'source/libvpx/vp8/decoder/arm/arm_dsystemdependent.c',
            'source/libvpx/vp8/decoder/arm/dequantize_arm.c',
            'source/libvpx/vp8/decoder/arm/dequantize_arm.h',
            'source/libvpx/vp8/encoder/arm/arm_csystemdependent.c',
            'source/libvpx/vp8/encoder/arm/boolhuff_arm.c',
            'source/libvpx/vp8/encoder/arm/dct_arm.c',
            'source/libvpx/vp8/encoder/arm/dct_arm.h',
            'source/libvpx/vp8/encoder/arm/encodemb_arm.h',
            'source/libvpx/vp8/encoder/arm/picklpf_arm.c',
            'source/libvpx/vp8/encoder/arm/quantize_arm.c',
            'source/libvpx/vp8/encoder/arm/quantize_arm.h',
            'source/libvpx/vp8/encoder/arm/variance_arm.c',
            'source/libvpx/vp8/encoder/arm/variance_arm.h',
          ],
          'conditions': [
            # Libvpx optimizations for ARMv6 or ARMv7 without NEON.
            ['arm_neon==0', {
              'sources': [
                '<@(armv5te_sources)',
                '<@(armv6_sources)',
              ],
            }],
            # Libvpx optimizations for ARMv7 with NEON.
            ['arm_neon==1', {
              'sources': [
                '<@(armv5te_sources)',
                '<@(armv6_sources)',
                '<@(arm_neon_sources)',
              ],
              'sources!': [
                'source/libvpx/vpx_scale/generic/scalesystemdependent.c',
              ],
            }],
          ],
        },
      ],
    }],
  ],
  # TODO(hclam): Remove these targets once webrtc doesn't depend on them.
  'targets': [
    {
      'target_name': 'libvpx_include',
      'type': 'none',
      'direct_dependent_settings': {
        'include_dirs': [
          'include',
        ],
      },
    },
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
  ],
}

# Local Variables:
# tab-width:2
# indent-tabs-mode:nil
# End:
# vim: set expandtab tabstop=2 shiftwidth=2:
