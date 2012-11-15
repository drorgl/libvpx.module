static const char* const cfg = "--target=x86_64-linux-icc --disable-ccache --disable-install-docs --disable-install-srcs --enable-postproc --disable-psnr --disable-examples --enable-pic --enable-temporal-denoising --enable-multi-res-encoding";
const char *vpx_codec_build_config(void) {return cfg;}
