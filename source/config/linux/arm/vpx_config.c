static const char* const cfg = "--target=armv6-linux-gcc --enable-pic --disable-install-docs --disable-install-bins --disable-install-libs --enable-realtime-only --disable-install-srcs --disable-examples --enable-postproc --enable-temporal-denoising  --enable-multi-res-encoding";
const char *vpx_codec_build_config(void) {return cfg;}
