/*
 *  Copyright (c) 2010 The VP8 project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */


/*!\file vpx_decoder.c
 * \brief Provides the high level interface to wrap decoder algorithms.
 *
 */
#include <string.h>
#include "vpx/internal/vpx_codec_internal.h"
#include "vpx/vp8dx.h"

#define SAVE_STATUS(ctx,var) (ctx?(ctx->err = var):var)

vpx_codec_err_t vpx_codec_dec_init_ver(vpx_codec_ctx_t      *ctx,
                                       vpx_codec_iface_t    *iface,
                                       vpx_codec_dec_cfg_t  *cfg,
                                       vpx_codec_flags_t     flags,
                                       int                   ver)
{
    vpx_codec_err_t res;

    if (ver != VPX_DECODER_ABI_VERSION)
        res = VPX_CODEC_ABI_MISMATCH;
    else if (!ctx || !iface)
        res = VPX_CODEC_INVALID_PARAM;
    else if (iface->abi_version != VPX_CODEC_INTERNAL_ABI_VERSION)
        res = VPX_CODEC_ABI_MISMATCH;
    else if ((flags & VPX_CODEC_USE_XMA) && !(iface->caps & VPX_CODEC_CAP_XMA))
        res = VPX_CODEC_INCAPABLE;
    else if ((flags & VPX_CODEC_USE_POSTPROC) && !(iface->caps & VPX_CODEC_CAP_POSTPROC))
        res = VPX_CODEC_INCAPABLE;
    else
    {
        memset(ctx, 0, sizeof(*ctx));
        ctx->iface = iface;
        ctx->name = iface->name;
        ctx->priv = NULL;
        ctx->init_flags = flags;
        ctx->config.dec = cfg;
        res = VPX_CODEC_OK;

        if (!(flags & VPX_CODEC_USE_XMA))
        {
            res = ctx->iface->init(ctx);

            if (res)
            {
                ctx->err_detail = ctx->priv ? ctx->priv->err_detail : NULL;
                vpx_codec_destroy(ctx);
            }

            if (ctx->priv)
                ctx->priv->iface = ctx->iface;
        }
    }

    return SAVE_STATUS(ctx, res);
}


vpx_codec_err_t vpx_codec_peek_stream_info(vpx_codec_iface_t       *iface,
        const uint8_t         *data,
        unsigned int           data_sz,
        vpx_codec_stream_info_t *si)
{
    vpx_codec_err_t res;

    if (!iface || !data || !data_sz || !si
        || si->sz < sizeof(vpx_codec_stream_info_t))
        res = VPX_CODEC_INVALID_PARAM;
    else
    {
        /* Set default/unknown values */
        si->w = 0;
        si->h = 0;

        res = iface->dec.peek_si(data, data_sz, si);
    }

    return res;
}


vpx_codec_err_t vpx_codec_get_stream_info(vpx_codec_ctx_t         *ctx,
        vpx_codec_stream_info_t *si)
{
    vpx_codec_err_t res;

    if (!ctx || !si || si->sz < sizeof(vpx_codec_stream_info_t))
        res = VPX_CODEC_INVALID_PARAM;
    else if (!ctx->iface || !ctx->priv)
        res = VPX_CODEC_ERROR;
    else
    {
        /* Set default/unknown values */
        si->w = 0;
        si->h = 0;

        res = ctx->iface->dec.get_si(ctx->priv->alg_priv, si);
    }

    return SAVE_STATUS(ctx, res);
}


vpx_codec_err_t vpx_codec_decode(vpx_codec_ctx_t    *ctx,
                                 const uint8_t        *data,
                                 unsigned int    data_sz,
                                 void       *user_priv,
                                 long        deadline)
{
    vpx_codec_err_t res;

    if (!ctx || !data || !data_sz)
        res = VPX_CODEC_INVALID_PARAM;
    else if (!ctx->iface || !ctx->priv)
        res = VPX_CODEC_ERROR;
    else
    {
        res = ctx->iface->dec.decode(ctx->priv->alg_priv, data, data_sz,
                                     user_priv, deadline);
    }

    return SAVE_STATUS(ctx, res);
}

vpx_image_t *vpx_codec_get_frame(vpx_codec_ctx_t  *ctx,
                                 vpx_codec_iter_t *iter)
{
    vpx_image_t *img;

    if (!ctx || !iter || !ctx->iface || !ctx->priv)
        img = NULL;
    else
        img = ctx->iface->dec.get_frame(ctx->priv->alg_priv, iter);

    return img;
}


vpx_codec_err_t vpx_codec_register_put_frame_cb(vpx_codec_ctx_t             *ctx,
        vpx_codec_put_frame_cb_fn_t  cb,
        void                      *user_priv)
{
    vpx_codec_err_t res;

    if (!ctx || !cb)
        res = VPX_CODEC_INVALID_PARAM;
    else if (!ctx->iface || !ctx->priv
             || !(ctx->iface->caps & VPX_CODEC_CAP_PUT_FRAME))
        res = VPX_CODEC_ERROR;
    else
    {
        ctx->priv->dec.put_frame_cb.put_frame = cb;
        ctx->priv->dec.put_frame_cb.user_priv = user_priv;
        res = VPX_CODEC_OK;
    }

    return SAVE_STATUS(ctx, res);
}


vpx_codec_err_t vpx_codec_register_put_slice_cb(vpx_codec_ctx_t             *ctx,
        vpx_codec_put_slice_cb_fn_t  cb,
        void                      *user_priv)
{
    vpx_codec_err_t res;

    if (!ctx || !cb)
        res = VPX_CODEC_INVALID_PARAM;
    else if (!ctx->iface || !ctx->priv
             || !(ctx->iface->caps & VPX_CODEC_CAP_PUT_FRAME))
        res = VPX_CODEC_ERROR;
    else
    {
        ctx->priv->dec.put_slice_cb.put_slice = cb;
        ctx->priv->dec.put_slice_cb.user_priv = user_priv;
        res = VPX_CODEC_OK;
    }

    return SAVE_STATUS(ctx, res);
}


vpx_codec_err_t vpx_codec_get_mem_map(vpx_codec_ctx_t                *ctx,
                                      vpx_codec_mmap_t               *mmap,
                                      vpx_codec_iter_t               *iter)
{
    vpx_codec_err_t res = VPX_CODEC_OK;

    if (!ctx || !mmap || !iter || !ctx->iface)
        res = VPX_CODEC_INVALID_PARAM;
    else if (!(ctx->iface->caps & VPX_CODEC_CAP_XMA))
        res = VPX_CODEC_ERROR;
    else
        res = ctx->iface->get_mmap(ctx, mmap, iter);

    return SAVE_STATUS(ctx, res);
}


vpx_codec_err_t vpx_codec_set_mem_map(vpx_codec_ctx_t   *ctx,
                                      vpx_codec_mmap_t  *mmap,
                                      unsigned int     num_maps)
{
    vpx_codec_err_t res = VPX_CODEC_MEM_ERROR;

    if (!ctx || !mmap || !ctx->iface)
        res = VPX_CODEC_INVALID_PARAM;
    else if (!(ctx->iface->caps & VPX_CODEC_CAP_XMA))
        res = VPX_CODEC_ERROR;
    else
    {
        unsigned int i;

        for (i = 0; i < num_maps; i++, mmap++)
        {
            if (!mmap->base)
                break;

            /* Everything look ok, set the mmap in the decoder */
            res = ctx->iface->set_mmap(ctx, mmap);

            if (res)
                break;
        }
    }

    return SAVE_STATUS(ctx, res);
}

// === bridge with chromium (begin) ============================================

//------------------------------------------------------------------------------
int VP8IGetInfo(const uint8_t* data, int data_size, int* width, int* height) {
  vpx_codec_stream_info_t info;
  // simple checks
  if (!data || data_size <= 10) {
    return 0;
  }
  if (width) *width = 0;
  if (height) *height = 0;
  if (vpx_codec_peek_stream_info(&vpx_codec_vp8_dx_algo,
                                 data, data_size, &info) != VPX_CODEC_OK) {
    return 0;
  }
  // we can only decode video starting with a keyframe.
  if (!info.is_kf) {
    return 0;
  }
  if (width) *width = info.w;
  if (height) *height = info.h;
  return 1;
}
//------------------------------------------------------------------------------
enum { RGB_FRAC = 12 };
//------------------------------------------------------------------------------
__inline uint8_t clip_rgb(int v) {
  v = v >> RGB_FRAC;
  return ((v & ~0xff) == 0) ? v : (v < 0) ? 0 : 255u;
}
//------------------------------------------------------------------------------
void ToBGR(int y, int u, int v, uint8_t* const dst) {
  const int kRound = 1 << (RGB_FRAC - 1);
  y = (y << RGB_FRAC) + kRound;
  dst[0] = clip_rgb(y + 7258 * u);
  dst[1] = clip_rgb(y - 2925 * v - 1409 * u);
  dst[2] = clip_rgb(y + 5742 * v);
}
//------------------------------------------------------------------------------
void ExportBGRLine(const uint8_t* y,
                   const uint8_t* u,
                   const uint8_t* v,
                   int width, uint8_t *dst) {
  int x;
  for (x = 0; x < (width >> 1); x++) {
    const int U = u[0] - 128;
    const int V = v[0] - 128;
    ToBGR(y[0], U, V, dst);
    ToBGR(y[1], U, V, dst + 3);
    u++;
    v++;
    y += 2;
    dst += 6;
  }
  if (width & 1) {      // Rightmost pixel
    ToBGR(y[0], (*u) - 128, (*v) - 128, dst);
  }
}
//------------------------------------------------------------------------------
int VP8IDecodeBGRInto(const uint8_t* data, int data_size,
                      uint8_t* output_buffer, int output_buffer_size,
                      int output_stride) {
  int have_image = 0;
  vpx_codec_ctx_t dec;

  // simple checks
  if (!output_buffer || !data || data_size <= 10) {
    return 0;
  }

  // allocate decoder
  if (VPX_CODEC_OK != vpx_codec_dec_init(&dec, &vpx_codec_vp8_dx_algo,
                                         NULL, 0)) {
    return 0;
  }

  // decode image
  if (VPX_CODEC_OK == vpx_codec_decode(&dec, data, data_size, NULL, 0)) {
    vpx_codec_iter_t iter = NULL;
    vpx_image_t* const img = vpx_codec_get_frame(&dec, &iter);
    if (img) {
      int y;
      for (y = 0; y < img->d_h; ++y) {
        ExportBGRLine(img->planes[0] +  y    * img->stride[0],
                      img->planes[1] + (y/2) * img->stride[1],
                      img->planes[2] + (y/2) * img->stride[2],
                      img->d_w,
                      output_buffer + y * output_stride);
      }
      have_image = 1;
    }
  }
  vpx_codec_destroy(&dec);
  return have_image;
}

// === bridge with chromium (end) ==============================================

