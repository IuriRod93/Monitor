.class public final Landroidx/core/graphics/BitmapCompat;
.super Ljava/lang/Object;
.source "BitmapCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/graphics/BitmapCompat$Api17Impl;,
        Landroidx/core/graphics/BitmapCompat$Api19Impl;,
        Landroidx/core/graphics/BitmapCompat$Api27Impl;,
        Landroidx/core/graphics/BitmapCompat$Api29Impl;,
        Landroidx/core/graphics/BitmapCompat$Api31Impl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 332
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    return-void
.end method

.method public static createScaledBitmap(Landroid/graphics/Bitmap;IILandroid/graphics/Rect;Z)Landroid/graphics/Bitmap;
    .locals 30
    .param p0, "srcBm"    # Landroid/graphics/Bitmap;
    .param p1, "dstW"    # I
    .param p2, "dstH"    # I
    .param p3, "srcRect"    # Landroid/graphics/Rect;
    .param p4, "scaleInLinearSpace"    # Z

    .line 133
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    if-lez v1, :cond_24

    if-lez v2, :cond_24

    .line 137
    if-eqz v3, :cond_1

    .line 138
    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    iget v4, v3, Landroid/graphics/Rect;->left:I

    if-ltz v4, :cond_0

    iget v4, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-gt v4, v5, :cond_0

    iget v4, v3, Landroid/graphics/Rect;->top:I

    if-ltz v4, :cond_0

    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    .line 139
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-gt v4, v5, :cond_0

    goto :goto_0

    .line 140
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "srcRect must be contained by srcBm!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 144
    :cond_1
    :goto_0
    move-object/from16 v4, p0

    .line 145
    .local v4, "src":Landroid/graphics/Bitmap;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1b

    if-lt v5, v6, :cond_2

    .line 148
    invoke-static {v0}, Landroidx/core/graphics/BitmapCompat$Api27Impl;->copyBitmapIfHardware(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 151
    :cond_2
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v5

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 152
    .local v5, "srcW":I
    :goto_1
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v7

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 154
    .local v7, "srcH":I
    :goto_2
    int-to-float v8, v1

    int-to-float v9, v5

    div-float/2addr v8, v9

    .line 155
    .local v8, "sx":F
    int-to-float v9, v2

    int-to-float v10, v7

    div-float/2addr v9, v10

    .line 157
    .local v9, "sy":F
    if-eqz v3, :cond_5

    iget v11, v3, Landroid/graphics/Rect;->left:I

    goto :goto_3

    :cond_5
    const/4 v11, 0x0

    .line 158
    .local v11, "srcX":I
    :goto_3
    if-eqz v3, :cond_6

    iget v12, v3, Landroid/graphics/Rect;->top:I

    goto :goto_4

    :cond_6
    const/4 v12, 0x0

    .line 161
    .local v12, "srcY":I
    :goto_4
    const/4 v13, 0x1

    if-nez v11, :cond_8

    if-nez v12, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    if-ne v1, v14, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    if-ne v2, v14, :cond_8

    .line 163
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v6

    if-eqz v6, :cond_7

    if-ne v0, v4, :cond_7

    .line 164
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    invoke-virtual {v0, v6, v13}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v6

    return-object v6

    .line 167
    :cond_7
    return-object v4

    .line 171
    :cond_8
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14, v13}, Landroid/graphics/Paint;-><init>(I)V

    .line 172
    .local v14, "paint":Landroid/graphics/Paint;
    invoke-virtual {v14, v13}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 173
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1d

    if-lt v15, v10, :cond_9

    .line 174
    invoke-static {v14}, Landroidx/core/graphics/BitmapCompat$Api29Impl;->setPaintBlendMode(Landroid/graphics/Paint;)V

    goto :goto_5

    .line 176
    :cond_9
    new-instance v10, Landroid/graphics/PorterDuffXfermode;

    sget-object v15, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v10, v15}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v14, v10}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 180
    :goto_5
    if-ne v5, v1, :cond_a

    if-ne v7, v2, :cond_a

    .line 181
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    invoke-static {v1, v2, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 182
    .local v6, "out":Landroid/graphics/Bitmap;
    new-instance v10, Landroid/graphics/Canvas;

    invoke-direct {v10, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 183
    .local v10, "canvasForCopy":Landroid/graphics/Canvas;
    neg-int v13, v11

    int-to-float v13, v13

    neg-int v15, v12

    int-to-float v15, v15

    invoke-virtual {v10, v4, v13, v15, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 184
    return-object v6

    .line 188
    .end local v6    # "out":Landroid/graphics/Bitmap;
    .end local v10    # "canvasForCopy":Landroid/graphics/Canvas;
    :cond_a
    const-wide/high16 v17, 0x4000000000000000L    # 2.0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->log(D)D

    move-result-wide v17

    .line 189
    .local v17, "log2":D
    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v15, v8, v10

    if-lez v15, :cond_b

    move/from16 v19, v10

    move v15, v11

    .end local v11    # "srcX":I
    .local v15, "srcX":I
    float-to-double v10, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->log(D)D

    move-result-wide v10

    div-double v10, v10, v17

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v10, v10

    goto :goto_6

    .line 190
    .end local v15    # "srcX":I
    .restart local v11    # "srcX":I
    :cond_b
    move/from16 v19, v10

    move v15, v11

    .end local v11    # "srcX":I
    .restart local v15    # "srcX":I
    float-to-double v10, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->log(D)D

    move-result-wide v10

    div-double v10, v10, v17

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    :goto_6
    nop

    .line 191
    .local v10, "stepsX":I
    cmpl-float v11, v9, v19

    if-lez v11, :cond_c

    move-object v11, v14

    .end local v14    # "paint":Landroid/graphics/Paint;
    .local v11, "paint":Landroid/graphics/Paint;
    float-to-double v13, v9

    invoke-static {v13, v14}, Ljava/lang/Math;->log(D)D

    move-result-wide v13

    div-double v13, v13, v17

    invoke-static {v13, v14}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v13

    double-to-int v13, v13

    goto :goto_7

    .line 192
    .end local v11    # "paint":Landroid/graphics/Paint;
    .restart local v14    # "paint":Landroid/graphics/Paint;
    :cond_c
    move-object v11, v14

    .end local v14    # "paint":Landroid/graphics/Paint;
    .restart local v11    # "paint":Landroid/graphics/Paint;
    float-to-double v13, v9

    invoke-static {v13, v14}, Ljava/lang/Math;->log(D)D

    move-result-wide v13

    div-double v13, v13, v17

    invoke-static {v13, v14}, Ljava/lang/Math;->floor(D)D

    move-result-wide v13

    double-to-int v13, v13

    :goto_7
    nop

    .line 193
    .local v13, "stepsY":I
    move v14, v10

    .line 194
    .local v14, "totalStepsX":I
    move/from16 v20, v13

    .line 200
    .local v20, "totalStepsY":I
    const/16 v21, 0x0

    .line 203
    .local v21, "dst":Landroid/graphics/Bitmap;
    const/16 v22, 0x0

    .line 204
    .local v22, "needFinalConversion":Z
    if-eqz p4, :cond_10

    .line 205
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_f

    invoke-static {v0}, Landroidx/core/graphics/BitmapCompat$Api27Impl;->isAlreadyF16AndLinear(Landroid/graphics/Bitmap;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 206
    if-lez v10, :cond_d

    const/4 v3, 0x1

    invoke-static {v5, v1, v3, v14}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v19

    goto :goto_8

    :cond_d
    const/4 v3, 0x1

    move/from16 v19, v5

    :goto_8
    move/from16 v23, v19

    .line 207
    .local v23, "allocW":I
    if-lez v13, :cond_e

    move/from16 v6, v20

    .end local v20    # "totalStepsY":I
    .local v6, "totalStepsY":I
    invoke-static {v7, v2, v3, v6}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v20

    goto :goto_9

    .end local v6    # "totalStepsY":I
    .restart local v20    # "totalStepsY":I
    :cond_e
    move/from16 v6, v20

    .end local v20    # "totalStepsY":I
    .restart local v6    # "totalStepsY":I
    move/from16 v20, v7

    :goto_9
    move/from16 v24, v20

    .line 208
    .local v24, "allocH":I
    move/from16 v20, v8

    move/from16 v8, v23

    move/from16 v23, v9

    move/from16 v9, v24

    move/from16 v24, v10

    .end local v10    # "stepsX":I
    .local v8, "allocW":I
    .local v9, "allocH":I
    .local v20, "sx":F
    .local v23, "sy":F
    .local v24, "stepsX":I
    invoke-static {v8, v9, v0, v3}, Landroidx/core/graphics/BitmapCompat$Api27Impl;->createBitmapWithSourceColorspace(IILandroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 210
    .end local v21    # "dst":Landroid/graphics/Bitmap;
    .local v10, "dst":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 211
    .local v3, "canvasForCopy":Landroid/graphics/Canvas;
    move/from16 v25, v8

    .end local v8    # "allocW":I
    .local v25, "allocW":I
    neg-int v8, v15

    int-to-float v8, v8

    move/from16 v26, v9

    .end local v9    # "allocH":I
    .local v26, "allocH":I
    neg-int v9, v12

    int-to-float v9, v9

    invoke-virtual {v3, v4, v8, v9, v11}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 212
    const/4 v8, 0x0

    .line 213
    .end local v15    # "srcX":I
    .local v8, "srcX":I
    const/4 v12, 0x0

    .line 214
    move-object v9, v10

    .line 215
    .local v9, "swap":Landroid/graphics/Bitmap;
    move-object/from16 v21, v4

    .line 216
    .end local v10    # "dst":Landroid/graphics/Bitmap;
    .restart local v21    # "dst":Landroid/graphics/Bitmap;
    move-object v4, v9

    .line 217
    const/16 v22, 0x1

    move v15, v8

    goto :goto_a

    .line 205
    .end local v3    # "canvasForCopy":Landroid/graphics/Canvas;
    .end local v6    # "totalStepsY":I
    .end local v23    # "sy":F
    .end local v24    # "stepsX":I
    .end local v25    # "allocW":I
    .end local v26    # "allocH":I
    .local v8, "sx":F
    .local v9, "sy":F
    .local v10, "stepsX":I
    .restart local v15    # "srcX":I
    .local v20, "totalStepsY":I
    :cond_f
    move/from16 v23, v9

    move/from16 v24, v10

    move/from16 v6, v20

    move/from16 v20, v8

    .end local v8    # "sx":F
    .end local v9    # "sy":F
    .end local v10    # "stepsX":I
    .restart local v6    # "totalStepsY":I
    .local v20, "sx":F
    .restart local v23    # "sy":F
    .restart local v24    # "stepsX":I
    goto :goto_a

    .line 204
    .end local v6    # "totalStepsY":I
    .end local v23    # "sy":F
    .end local v24    # "stepsX":I
    .restart local v8    # "sx":F
    .restart local v9    # "sy":F
    .restart local v10    # "stepsX":I
    .local v20, "totalStepsY":I
    :cond_10
    move/from16 v23, v9

    move/from16 v24, v10

    move/from16 v6, v20

    move/from16 v20, v8

    .line 221
    .end local v8    # "sx":F
    .end local v9    # "sy":F
    .end local v10    # "stepsX":I
    .restart local v6    # "totalStepsY":I
    .local v20, "sx":F
    .restart local v23    # "sy":F
    .restart local v24    # "stepsX":I
    :goto_a
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v15, v12, v5, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 222
    .local v3, "currRect":Landroid/graphics/Rect;
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v9, v21

    move/from16 v10, v24

    .line 224
    .end local v21    # "dst":Landroid/graphics/Bitmap;
    .end local v24    # "stepsX":I
    .local v8, "nextRect":Landroid/graphics/Rect;
    .local v9, "dst":Landroid/graphics/Bitmap;
    .restart local v10    # "stepsX":I
    :goto_b
    if-nez v10, :cond_13

    if-eqz v13, :cond_11

    goto :goto_c

    .line 310
    :cond_11
    if-eq v9, v0, :cond_12

    if-eqz v9, :cond_12

    .line 311
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->recycle()V

    .line 313
    :cond_12
    return-object v4

    .line 225
    :cond_13
    :goto_c
    if-gez v10, :cond_14

    .line 226
    add-int/lit8 v10, v10, 0x1

    goto :goto_d

    .line 227
    :cond_14
    if-lez v10, :cond_15

    .line 228
    add-int/lit8 v10, v10, -0x1

    .line 230
    :cond_15
    :goto_d
    if-gez v13, :cond_16

    .line 231
    add-int/lit8 v13, v13, 0x1

    goto :goto_e

    .line 232
    :cond_16
    if-lez v13, :cond_17

    .line 233
    add-int/lit8 v13, v13, -0x1

    .line 235
    :cond_17
    :goto_e
    move/from16 v21, v12

    .end local v12    # "srcY":I
    .local v21, "srcY":I
    invoke-static {v5, v1, v10, v14}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v12

    .line 236
    .local v12, "nextW":I
    move/from16 v24, v10

    .end local v10    # "stepsX":I
    .restart local v24    # "stepsX":I
    invoke-static {v7, v2, v13, v6}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v10

    .line 237
    .local v10, "nextH":I
    move/from16 v25, v13

    const/4 v13, 0x0

    .end local v13    # "stepsY":I
    .local v25, "stepsY":I
    invoke-virtual {v8, v13, v13, v12, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 255
    if-nez v24, :cond_18

    if-nez v25, :cond_18

    const/16 v16, 0x1

    goto :goto_f

    :cond_18
    move/from16 v16, v13

    .line 256
    .local v16, "lastStep":Z
    :goto_f
    if-eqz v9, :cond_19

    .line 257
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    if-ne v13, v1, :cond_19

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    if-ne v13, v2, :cond_19

    const/4 v13, 0x1

    goto :goto_10

    :cond_19
    const/4 v13, 0x0

    .line 258
    .local v13, "dstSizeIsFinal":Z
    :goto_10
    if-eqz v9, :cond_1e

    if-eq v9, v0, :cond_1e

    if-eqz p4, :cond_1a

    move/from16 v27, v10

    .end local v10    # "nextH":I
    .local v27, "nextH":I
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    move/from16 v28, v12

    const/16 v12, 0x1b

    .end local v12    # "nextW":I
    .local v28, "nextW":I
    if-lt v10, v12, :cond_1b

    .line 267
    invoke-static {v9}, Landroidx/core/graphics/BitmapCompat$Api27Impl;->isAlreadyF16AndLinear(Landroid/graphics/Bitmap;)Z

    move-result v10

    if-eqz v10, :cond_1c

    goto :goto_11

    .line 258
    .end local v27    # "nextH":I
    .end local v28    # "nextW":I
    .restart local v10    # "nextH":I
    .restart local v12    # "nextW":I
    :cond_1a
    move/from16 v27, v10

    move/from16 v28, v12

    .line 267
    .end local v10    # "nextH":I
    .end local v12    # "nextW":I
    .restart local v27    # "nextH":I
    .restart local v28    # "nextW":I
    :cond_1b
    :goto_11
    if-eqz v16, :cond_1d

    if-eqz v13, :cond_1c

    if-eqz v22, :cond_1d

    :cond_1c
    goto :goto_12

    .line 301
    :cond_1d
    move/from16 v29, v5

    const/16 v5, 0x1b

    goto :goto_16

    .line 258
    .end local v27    # "nextH":I
    .end local v28    # "nextW":I
    .restart local v10    # "nextH":I
    .restart local v12    # "nextW":I
    :cond_1e
    move/from16 v27, v10

    move/from16 v28, v12

    .line 274
    .end local v10    # "nextH":I
    .end local v12    # "nextW":I
    .restart local v27    # "nextH":I
    .restart local v28    # "nextW":I
    :goto_12
    if-eq v9, v0, :cond_1f

    if-eqz v9, :cond_1f

    .line 275
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->recycle()V

    .line 283
    :cond_1f
    move/from16 v10, v22

    .line 284
    .local v10, "lastScratchStep":I
    if-lez v24, :cond_20

    move v12, v10

    goto :goto_13

    :cond_20
    move/from16 v12, v24

    :goto_13
    invoke-static {v5, v1, v12, v14}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v12

    .line 286
    .local v12, "allocW":I
    if-lez v25, :cond_21

    move v1, v10

    goto :goto_14

    :cond_21
    move/from16 v1, v25

    :goto_14
    invoke-static {v7, v2, v1, v6}, Landroidx/core/graphics/BitmapCompat;->sizeAtStep(IIII)I

    move-result v1

    .line 290
    .local v1, "allocH":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    move/from16 v29, v5

    const/16 v5, 0x1b

    .end local v5    # "srcW":I
    .local v29, "srcW":I
    if-lt v2, v5, :cond_23

    .line 291
    if-eqz p4, :cond_22

    if-nez v16, :cond_22

    const/4 v2, 0x1

    goto :goto_15

    :cond_22
    const/4 v2, 0x0

    .line 292
    .local v2, "linear":Z
    :goto_15
    invoke-static {v12, v1, v0, v2}, Landroidx/core/graphics/BitmapCompat$Api27Impl;->createBitmapWithSourceColorspace(IILandroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 294
    .end local v2    # "linear":Z
    goto :goto_16

    .line 295
    :cond_23
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    invoke-static {v12, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 301
    .end local v1    # "allocH":I
    .end local v10    # "lastScratchStep":I
    .end local v12    # "allocW":I
    :goto_16
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v9}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 302
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v1, v4, v3, v8, v11}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 305
    move-object v2, v4

    .line 306
    .local v2, "swap":Landroid/graphics/Bitmap;
    move-object v4, v9

    .line 307
    move-object v9, v2

    .line 308
    invoke-virtual {v3, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 309
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v2    # "swap":Landroid/graphics/Bitmap;
    .end local v13    # "dstSizeIsFinal":Z
    .end local v16    # "lastStep":Z
    .end local v27    # "nextH":I
    .end local v28    # "nextW":I
    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v12, v21

    move/from16 v13, v25

    move/from16 v5, v29

    move/from16 v10, v24

    goto/16 :goto_b

    .line 134
    .end local v3    # "currRect":Landroid/graphics/Rect;
    .end local v4    # "src":Landroid/graphics/Bitmap;
    .end local v6    # "totalStepsY":I
    .end local v7    # "srcH":I
    .end local v8    # "nextRect":Landroid/graphics/Rect;
    .end local v9    # "dst":Landroid/graphics/Bitmap;
    .end local v11    # "paint":Landroid/graphics/Paint;
    .end local v14    # "totalStepsX":I
    .end local v15    # "srcX":I
    .end local v17    # "log2":D
    .end local v20    # "sx":F
    .end local v21    # "srcY":I
    .end local v22    # "needFinalConversion":Z
    .end local v23    # "sy":F
    .end local v24    # "stepsX":I
    .end local v25    # "stepsY":I
    .end local v29    # "srcW":I
    :cond_24
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "dstW and dstH must be > 0!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getAllocationByteCount(Landroid/graphics/Bitmap;)I
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .line 96
    nop

    .line 97
    invoke-static {p0}, Landroidx/core/graphics/BitmapCompat$Api19Impl;->getAllocationByteCount(Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method

.method public static hasMipMap(Landroid/graphics/Bitmap;)Z
    .locals 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .line 57
    nop

    .line 58
    invoke-static {p0}, Landroidx/core/graphics/BitmapCompat$Api17Impl;->hasMipMap(Landroid/graphics/Bitmap;)Z

    move-result v0

    return v0
.end method

.method public static setHasMipMap(Landroid/graphics/Bitmap;Z)V
    .locals 0
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "hasMipMap"    # Z

    .line 83
    nop

    .line 84
    invoke-static {p0, p1}, Landroidx/core/graphics/BitmapCompat$Api17Impl;->setHasMipMap(Landroid/graphics/Bitmap;Z)V

    .line 86
    return-void
.end method

.method static sizeAtStep(IIII)I
    .locals 2
    .param p0, "srcSize"    # I
    .param p1, "dstSize"    # I
    .param p2, "step"    # I
    .param p3, "totalSteps"    # I

    .line 323
    if-nez p2, :cond_0

    .line 324
    return p1

    .line 325
    :cond_0
    const/4 v0, 0x1

    if-lez p2, :cond_1

    .line 326
    sub-int v1, p3, p2

    shl-int/2addr v0, v1

    mul-int/2addr v0, p0

    return v0

    .line 328
    :cond_1
    neg-int v1, p2

    sub-int/2addr v1, v0

    shl-int v0, p1, v1

    return v0
.end method
