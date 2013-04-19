# This file is generated. Do not edit.
# Copyright (c) 2013 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

{
  'targets': [
    {
      'target_name': 'libvpx_intrinsics_mmx',
      'type': 'static_library',
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch)',
        '<(libvpx_source)',
      ],
      'sources': [
        '<(libvpx_source)/vp8/common/x86/idct_blk_mmx.c',
        '<(libvpx_source)/vp8/common/x86/variance_mmx.c',
        '<(libvpx_source)/vp8/encoder/x86/vp8_enc_stubs_mmx.c',
        '<(libvpx_source)/vp9/common/x86/vp9_loopfilter_intrin_mmx.c',
      ],
      'conditions': [
        ['os_posix==1 and OS!="mac"', {
          'cflags': [ '-mmmx', ],
        }],
        ['OS=="mac"', {
          'xcode_settings': {
            'OTHER_CFLAGS': [ '-mmmx', ],
          },
        }],
      ],
    },
    {
      'target_name': 'libvpx_intrinsics_sse2',
      'type': 'static_library',
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch)',
        '<(libvpx_source)',
      ],
      'sources': [
        '<(libvpx_source)/vp8/common/x86/idct_blk_sse2.c',
        '<(libvpx_source)/vp8/common/x86/recon_wrapper_sse2.c',
        '<(libvpx_source)/vp8/common/x86/variance_sse2.c',
        '<(libvpx_source)/vp8/encoder/x86/denoising_sse2.c',
        '<(libvpx_source)/vp8/encoder/x86/vp8_enc_stubs_sse2.c',
        '<(libvpx_source)/vp9/common/x86/vp9_loopfilter_intrin_sse2.c',
        '<(libvpx_source)/vp9/common/x86/vp9_recon_wrapper_sse2.c',
        '<(libvpx_source)/vp9/common/x86/vp9_sadmxn_sse2.c',
        '<(libvpx_source)/vp9/common/x86/vp9_subpixel_variance_sse2.c',
        '<(libvpx_source)/vp9/decoder/x86/vp9_idct_blk_sse2.c',
      ],
      'conditions': [
        ['os_posix==1 and OS!="mac"', {
          'cflags': [ '-msse2', ],
        }],
        ['OS=="mac"', {
          'xcode_settings': {
            'OTHER_CFLAGS': [ '-msse2', ],
          },
        }],
      ],
    },
    {
      'target_name': 'libvpx_intrinsics_ssse3',
      'type': 'static_library',
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch)',
        '<(libvpx_source)',
      ],
      'sources': [
        '<(libvpx_source)/vp8/common/x86/variance_ssse3.c',
      ],
      'conditions': [
        ['os_posix==1 and OS!="mac"', {
          'cflags': [ '-mssse3', ],
        }],
        ['OS=="mac"', {
          'xcode_settings': {
            'OTHER_CFLAGS': [ '-mssse3', ],
          },
        }],
      ],
    },
    {
      'target_name': 'libvpx_intrinsics_sse4_1',
      'type': 'static_library',
      'include_dirs': [
        'source/config/<(OS_CATEGORY)/<(target_arch)',
        '<(libvpx_source)',
      ],
      'sources': [
      ],
      'conditions': [
        ['os_posix==1 and OS!="mac"', {
          'cflags': [ '-msse4.1', ],
        }],
        ['OS=="mac"', {
          'xcode_settings': {
            'OTHER_CFLAGS': [ '-msse4.1', ],
          },
        }],
      ],
    },
  ],
}