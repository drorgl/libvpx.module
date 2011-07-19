@ This file was created from a .asm file
@  using the ads2gas.pl script.
	.equ DO1STROUNDING, 0
@
@  Copyright (c) 2010 The WebM project authors. All Rights Reserved.
@
@  Use of this source code is governed by a BSD-style license
@  that can be found in the LICENSE file in the root of the source
@  tree. An additional intellectual property rights grant can be found
@  in the file PATENTS.  All contributing project authors may
@  be found in the AUTHORS file in the root of the source tree.
@


    .global vp8_dequantize_b_armv5 
	.type vp8_dequantize_b_armv5, function

.text

q       .req r0
dqc     .req r1
cnt     .req r2

@void dequantize_b_armv5(short *Q, short *DQC)
_vp8_dequantize_b_armv5:
	vp8_dequantize_b_armv5:@
    stmdb   sp!, {r4, lr}
    ldr     r3, [q]
    ldr     r4, [dqc], #8

    mov     cnt, #4
dequant_loop:
    smulbb  lr, r3, r4
    smultt  r12, r3, r4

    ldr     r3, [q, #4]
    ldr     r4, [dqc, #-4]

    strh    lr, [q], #2
    strh    r12, [q], #2

    smulbb  lr, r3, r4
    smultt  r12, r3, r4

    subs    cnt, cnt, #1
    ldrne   r3, [q, #4]
    ldrne   r4, [dqc], #8

    strh    lr, [q], #2
    strh    r12, [q], #2

    bne     dequant_loop

    ldmia   sp!, {r4, pc}
   @    @|vp8_dequantize_b_arm|

