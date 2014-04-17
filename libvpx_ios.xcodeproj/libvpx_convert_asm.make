all: \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/bilinearfilter_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem16x16_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x4_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x8_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dc_only_idct_add_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequant_idct_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequantize_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/filter_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/intra4x4_predict_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/simpleloopfilter_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_sad16x16_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance16x16_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance8x8_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_h_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_hv_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_v_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/buildintrapredictorsmby_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_0_2x_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_full_2x_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimplehorizontaledge_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimpleverticaledge_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/mbloopfilter_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad16_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad8_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/save_reg_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortidct4x4llm_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict16x16_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict4x4_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x8_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/variance_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16s_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance8x8_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/boolhuff_armv5te.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_armv5.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_mbrow_armv5.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_partitions_armv5.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_fast_quantize_b_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_short_fdct4x4_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subtract_armv6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/walsh_v6.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/fastquantizeb_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortfdct_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/subtract_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_memcpy_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_shortwalsh4x4_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_avg_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_avg_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_copy_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_dc_only_idct_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_1_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_1_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_1_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_1_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht4x4_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht8x8_add_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_16_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_mb_lpf_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_reconintra_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_save_reg_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copy_y_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copyframe_func_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copysrcframe_func_neon.S \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_extendframeborders_neon.S

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/bilinearfilter_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/bilinearfilter_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/bilinearfilter_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/bilinearfilter_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/bilinearfilter_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem16x16_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/copymem16x16_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/copymem16x16_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/copymem16x16_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem16x16_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x4_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/copymem8x4_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/copymem8x4_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/copymem8x4_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x4_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x8_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/copymem8x8_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/copymem8x8_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/copymem8x8_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/copymem8x8_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dc_only_idct_add_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/dc_only_idct_add_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/dc_only_idct_add_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/dc_only_idct_add_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dc_only_idct_add_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequant_idct_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/dequant_idct_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/dequant_idct_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/dequant_idct_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequant_idct_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequantize_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/dequantize_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/dequantize_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/dequantize_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/dequantize_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/filter_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/filter_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/filter_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/filter_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/filter_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/idct_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/idct_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/idct_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/intra4x4_predict_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/intra4x4_predict_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/intra4x4_predict_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/intra4x4_predict_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/intra4x4_predict_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/iwalsh_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/iwalsh_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/iwalsh_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/loopfilter_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/loopfilter_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/loopfilter_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/simpleloopfilter_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/simpleloopfilter_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/simpleloopfilter_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/simpleloopfilter_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/simpleloopfilter_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_v6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/sixtappredict8x4_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/sixtappredict8x4_v6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/sixtappredict8x4_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_sad16x16_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_sad16x16_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_sad16x16_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_sad16x16_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_sad16x16_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance16x16_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_variance16x16_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_variance16x16_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_variance16x16_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance16x16_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance8x8_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_variance8x8_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_variance8x8_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_variance8x8_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance8x8_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_h_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_h_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_h_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_h_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_h_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_hv_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_hv_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_hv_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_hv_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_hv_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_v_armv6.S \
    : \
    source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_v_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_v_armv6.asm"
	bash -c "cat source/libvpx/vp8/common/arm/armv6/vp8_variance_halfpixvar16x16_v_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_variance_halfpixvar16x16_v_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/buildintrapredictorsmby_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/buildintrapredictorsmby_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/buildintrapredictorsmby_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/buildintrapredictorsmby_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/buildintrapredictorsmby_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_0_2x_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/idct_dequant_0_2x_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/idct_dequant_0_2x_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/idct_dequant_0_2x_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_0_2x_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_full_2x_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/idct_dequant_full_2x_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/idct_dequant_full_2x_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/idct_dequant_full_2x_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/idct_dequant_full_2x_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/iwalsh_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/iwalsh_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/iwalsh_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/iwalsh_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/loopfilter_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/loopfilter_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/loopfilter_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfilter_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimplehorizontaledge_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/loopfiltersimplehorizontaledge_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/loopfiltersimplehorizontaledge_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/loopfiltersimplehorizontaledge_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimplehorizontaledge_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimpleverticaledge_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/loopfiltersimpleverticaledge_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/loopfiltersimpleverticaledge_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/loopfiltersimpleverticaledge_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/loopfiltersimpleverticaledge_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/mbloopfilter_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/mbloopfilter_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/mbloopfilter_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/mbloopfilter_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/mbloopfilter_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad16_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sad16_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sad16_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sad16_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad16_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad8_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sad8_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sad8_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sad8_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sad8_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/save_reg_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/save_reg_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/save_reg_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/save_reg_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/save_reg_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortidct4x4llm_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/shortidct4x4llm_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/shortidct4x4llm_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/shortidct4x4llm_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortidct4x4llm_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict16x16_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sixtappredict16x16_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sixtappredict16x16_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sixtappredict16x16_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict16x16_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict4x4_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sixtappredict4x4_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sixtappredict4x4_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sixtappredict4x4_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict4x4_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sixtappredict8x4_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sixtappredict8x4_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sixtappredict8x4_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x4_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x8_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/sixtappredict8x8_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/sixtappredict8x8_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/sixtappredict8x8_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/sixtappredict8x8_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/variance_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/variance_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/variance_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/variance_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/variance_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16s_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16s_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16s_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance16x16s_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance16x16s_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance8x8_neon.S \
    : \
    source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance8x8_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance8x8_neon.asm"
	bash -c "cat source/libvpx/vp8/common/arm/neon/vp8_subpixelvariance8x8_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subpixelvariance8x8_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/boolhuff_armv5te.S \
    : \
    source/libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/boolhuff_armv5te.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_armv5.S \
    : \
    source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_armv5.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_armv5.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_armv5.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_armv5.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_mbrow_armv5.S \
    : \
    source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_mbrow_armv5.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_mbrow_armv5.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_mbrow_armv5.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_mbrow_armv5.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_partitions_armv5.S \
    : \
    source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_partitions_armv5.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_partitions_armv5.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv5te/vp8_packtokens_partitions_armv5.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_packtokens_partitions_armv5.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_fast_quantize_b_armv6.S \
    : \
    source/libvpx/vp8/encoder/arm/armv6/vp8_fast_quantize_b_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv6/vp8_fast_quantize_b_armv6.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv6/vp8_fast_quantize_b_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_fast_quantize_b_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_armv6.S \
    : \
    source/libvpx/vp8/encoder/arm/armv6/vp8_mse16x16_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv6/vp8_mse16x16_armv6.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv6/vp8_mse16x16_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_short_fdct4x4_armv6.S \
    : \
    source/libvpx/vp8/encoder/arm/armv6/vp8_short_fdct4x4_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv6/vp8_short_fdct4x4_armv6.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv6/vp8_short_fdct4x4_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_short_fdct4x4_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subtract_armv6.S \
    : \
    source/libvpx/vp8/encoder/arm/armv6/vp8_subtract_armv6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv6/vp8_subtract_armv6.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv6/vp8_subtract_armv6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_subtract_armv6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/walsh_v6.S \
    : \
    source/libvpx/vp8/encoder/arm/armv6/walsh_v6.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/armv6/walsh_v6.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/armv6/walsh_v6.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/walsh_v6.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/fastquantizeb_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/fastquantizeb_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/fastquantizeb_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/fastquantizeb_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/fastquantizeb_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortfdct_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/shortfdct_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/shortfdct_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/shortfdct_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/shortfdct_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/subtract_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/subtract_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/subtract_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/subtract_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/subtract_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_memcpy_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/vp8_memcpy_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/vp8_memcpy_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/vp8_memcpy_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_memcpy_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/vp8_mse16x16_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/vp8_mse16x16_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/vp8_mse16x16_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_mse16x16_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_shortwalsh4x4_neon.S \
    : \
    source/libvpx/vp8/encoder/arm/neon/vp8_shortwalsh4x4_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp8/encoder/arm/neon/vp8_shortwalsh4x4_neon.asm"
	bash -c "cat source/libvpx/vp8/encoder/arm/neon/vp8_shortwalsh4x4_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_shortwalsh4x4_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_avg_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_avg_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_avg_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_avg_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_avg_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_avg_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_convolve8_avg_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_convolve8_avg_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_convolve8_avg_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_avg_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_convolve8_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_convolve8_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_convolve8_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_convolve8_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_copy_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_copy_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_copy_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_copy_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_copy_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_dc_only_idct_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_dc_only_idct_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_dc_only_idct_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_dc_only_idct_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_dc_only_idct_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_1_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct16x16_1_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct16x16_1_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct16x16_1_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_1_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct16x16_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct16x16_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct16x16_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct16x16_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_1_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct32x32_1_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct32x32_1_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct32x32_1_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_1_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct32x32_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct32x32_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct32x32_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct32x32_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_1_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct4x4_1_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct4x4_1_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct4x4_1_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_1_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct4x4_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct4x4_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct4x4_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct4x4_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_1_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct8x8_1_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct8x8_1_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct8x8_1_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_1_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_idct8x8_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_idct8x8_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_idct8x8_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_idct8x8_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht4x4_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_iht4x4_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_iht4x4_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_iht4x4_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht4x4_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht8x8_add_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_iht8x8_add_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_iht8x8_add_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_iht8x8_add_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_iht8x8_add_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_16_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_loopfilter_16_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_loopfilter_16_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_loopfilter_16_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_16_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_loopfilter_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_loopfilter_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_loopfilter_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_loopfilter_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_mb_lpf_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_mb_lpf_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_mb_lpf_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_mb_lpf_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_mb_lpf_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_reconintra_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_reconintra_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_reconintra_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_reconintra_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_reconintra_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_save_reg_neon.S \
    : \
    source/libvpx/vp9/common/arm/neon/vp9_save_reg_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vp9/common/arm/neon/vp9_save_reg_neon.asm"
	bash -c "cat source/libvpx/vp9/common/arm/neon/vp9_save_reg_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp9_save_reg_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copy_y_neon.S \
    : \
    source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copy_y_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copy_y_neon.asm"
	bash -c "cat source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copy_y_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copy_y_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copyframe_func_neon.S \
    : \
    source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copyframe_func_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copyframe_func_neon.asm"
	bash -c "cat source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copyframe_func_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copyframe_func_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copysrcframe_func_neon.S \
    : \
    source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copysrcframe_func_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copysrcframe_func_neon.asm"
	bash -c "cat source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_copysrcframe_func_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_copysrcframe_func_neon.S"

$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_extendframeborders_neon.S \
    : \
    source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_extendframeborders_neon.asm \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl \
    $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/thumb.pm
	@mkdir -p "$(SHARED_INTERMEDIATE_DIR)/third_party/libvpx"
	@echo note: "Convert libvpx asm file for ARM source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_extendframeborders_neon.asm"
	bash -c "cat source/libvpx/vpx_scale/arm/neon/vp8_vpxyv12_extendframeborders_neon.asm | perl $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/ads2gas_apple.pl -chromium > $(SHARED_INTERMEDIATE_DIR)/third_party/libvpx/vp8_vpxyv12_extendframeborders_neon.S"
