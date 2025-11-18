.class Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;
.super Ljava/lang/Object;
.source "ImageFilterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/utils/widget/ImageFilterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageMatrix"
.end annotation


# instance fields
.field m:[F

.field mBrightness:F

.field mColorMatrix:Landroid/graphics/ColorMatrix;

.field mContrast:F

.field mSaturation:F

.field mTmpColorMatrix:Landroid/graphics/ColorMatrix;

.field mWarmth:F


# direct methods
.method constructor <init>()V
    .locals 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/16 v0, 0x14

    new-array v0, v0, [F

    iput-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    .line 88
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    .line 89
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    .line 90
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mBrightness:F

    .line 91
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mSaturation:F

    .line 92
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mContrast:F

    .line 93
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mWarmth:F

    return-void
.end method

.method private brightness(F)V
    .locals 4
    .param p1, "brightness"    # F

    .line 225
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 226
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x1

    const/4 v2, 0x0

    aput v2, v0, v1

    .line 227
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x2

    aput v2, v0, v1

    .line 228
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x3

    aput v2, v0, v1

    .line 229
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x4

    aput v2, v0, v1

    .line 231
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x5

    aput v2, v0, v1

    .line 232
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x6

    aput p1, v0, v1

    .line 233
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v1, 0x7

    aput v2, v0, v1

    .line 234
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x8

    aput v2, v0, v1

    .line 235
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x9

    aput v2, v0, v1

    .line 237
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xa

    aput v2, v0, v1

    .line 238
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xb

    aput v2, v0, v1

    .line 239
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xc

    aput p1, v0, v1

    .line 240
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xd

    aput v2, v0, v1

    .line 241
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xe

    aput v2, v0, v1

    .line 243
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0xf

    aput v2, v0, v1

    .line 244
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x10

    aput v2, v0, v1

    .line 245
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x11

    aput v2, v0, v1

    .line 246
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x12

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v0, v1

    .line 247
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v1, 0x13

    aput v2, v0, v1

    .line 248
    return-void
.end method

.method private saturation(F)V
    .locals 13
    .param p1, "saturationStrength"    # F

    .line 96
    const v0, 0x3e998c7e    # 0.2999f

    .line 97
    .local v0, "Rf":F
    const v1, 0x3f1645a2    # 0.587f

    .line 98
    .local v1, "Gf":F
    const v2, 0x3de978d5    # 0.114f

    .line 99
    .local v2, "Bf":F
    move v3, p1

    .line 101
    .local v3, "S":F
    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v5, v4, v3

    .line 102
    .local v5, "MS":F
    mul-float v6, v0, v5

    .line 103
    .local v6, "Rt":F
    mul-float v7, v1, v5

    .line 104
    .local v7, "Gt":F
    mul-float v8, v2, v5

    .line 106
    .local v8, "Bt":F
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x0

    add-float v11, v6, v3

    aput v11, v9, v10

    .line 107
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x1

    aput v7, v9, v10

    .line 108
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x2

    aput v8, v9, v10

    .line 109
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x3

    const/4 v11, 0x0

    aput v11, v9, v10

    .line 110
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x4

    aput v11, v9, v10

    .line 112
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x5

    aput v6, v9, v10

    .line 113
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x6

    add-float v12, v7, v3

    aput v12, v9, v10

    .line 114
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v10, 0x7

    aput v8, v9, v10

    .line 115
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0x8

    aput v11, v9, v10

    .line 116
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0x9

    aput v11, v9, v10

    .line 118
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xa

    aput v6, v9, v10

    .line 119
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xb

    aput v7, v9, v10

    .line 120
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xc

    add-float v12, v8, v3

    aput v12, v9, v10

    .line 121
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xd

    aput v11, v9, v10

    .line 122
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xe

    aput v11, v9, v10

    .line 124
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0xf

    aput v11, v9, v10

    .line 125
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0x10

    aput v11, v9, v10

    .line 126
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0x11

    aput v11, v9, v10

    .line 127
    iget-object v9, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v10, 0x12

    aput v4, v9, v10

    .line 128
    iget-object v4, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v9, 0x13

    aput v11, v4, v9

    .line 129
    return-void
.end method

.method private warmth(F)V
    .locals 26
    .param p1, "warmth"    # F

    .line 132
    move-object/from16 v0, p0

    const v1, 0x459c4000    # 5000.0f

    .line 133
    .local v1, "baseTemprature":F
    const/4 v2, 0x0

    cmpg-float v3, p1, v2

    if-gtz v3, :cond_0

    const v3, 0x3c23d70a    # 0.01f

    .end local p1    # "warmth":F
    .local v3, "warmth":F
    goto :goto_0

    .end local v3    # "warmth":F
    .restart local p1    # "warmth":F
    :cond_0
    move/from16 v3, p1

    .line 138
    .end local p1    # "warmth":F
    .restart local v3    # "warmth":F
    :goto_0
    div-float v4, v1, v3

    .line 140
    .local v4, "kelvin":F
    const/high16 v5, 0x42c80000    # 100.0f

    div-float v6, v4, v5

    .line 142
    .local v6, "centiKelvin":F
    const/high16 v7, 0x42840000    # 66.0f

    cmpl-float v8, v6, v7

    const-wide v9, 0x3fb354f0e0000000L

    const-wide v12, -0x403ef32580000000L    # -0.13320475816726685

    const/high16 v15, 0x42700000    # 60.0f

    const v16, 0x43211e9c

    const v17, 0x42c6f10d

    if-lez v8, :cond_1

    .line 143
    sub-float v8, v6, v15

    .line 144
    .local v8, "tmp":F
    move/from16 v18, v15

    const p1, 0x43a4d970

    float-to-double v14, v8

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v14

    double-to-float v14, v14

    mul-float v14, v14, p1

    .line 145
    .local v14, "colorR":F
    const v15, 0x43900fa3

    float-to-double v11, v8

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float/2addr v11, v15

    .line 147
    .end local v8    # "tmp":F
    .local v11, "colorG":F
    goto :goto_1

    .line 148
    .end local v11    # "colorG":F
    .end local v14    # "colorR":F
    :cond_1
    move/from16 v18, v15

    const p1, 0x43a4d970

    const v15, 0x43900fa3

    float-to-double v11, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v11

    double-to-float v8, v11

    mul-float v8, v8, v17

    sub-float v11, v8, v16

    .line 149
    .restart local v11    # "colorG":F
    const/high16 v14, 0x437f0000    # 255.0f

    .line 151
    .restart local v14    # "colorR":F
    :goto_1
    cmpg-float v8, v6, v7

    const v12, 0x439885bc

    const/high16 v13, 0x41200000    # 10.0f

    const v19, 0x430a848a

    const/high16 v20, 0x41980000    # 19.0f

    if-gez v8, :cond_3

    .line 152
    cmpl-float v8, v6, v20

    if-lez v8, :cond_2

    .line 153
    sub-float v8, v6, v13

    move/from16 v21, v5

    move/from16 v22, v6

    .end local v6    # "centiKelvin":F
    .local v22, "centiKelvin":F
    float-to-double v5, v8

    invoke-static {v5, v6}, Ljava/lang/Math;->log(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v5, v5, v19

    sub-float/2addr v5, v12

    .local v5, "colorB":F
    goto :goto_2

    .line 155
    .end local v5    # "colorB":F
    .end local v22    # "centiKelvin":F
    .restart local v6    # "centiKelvin":F
    :cond_2
    move/from16 v21, v5

    move/from16 v22, v6

    .end local v6    # "centiKelvin":F
    .restart local v22    # "centiKelvin":F
    const/4 v5, 0x0

    .restart local v5    # "colorB":F
    goto :goto_2

    .line 158
    .end local v5    # "colorB":F
    .end local v22    # "centiKelvin":F
    .restart local v6    # "centiKelvin":F
    :cond_3
    move/from16 v21, v5

    move/from16 v22, v6

    .end local v6    # "centiKelvin":F
    .restart local v22    # "centiKelvin":F
    const/high16 v5, 0x437f0000    # 255.0f

    .line 160
    .restart local v5    # "colorB":F
    :goto_2
    invoke-static {v14, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/high16 v8, 0x437f0000    # 255.0f

    invoke-static {v8, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 161
    .local v6, "tmpColor_r":F
    move/from16 v23, v7

    invoke-static {v11, v2}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-static {v8, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    .line 162
    .local v7, "tmpColor_g":F
    move/from16 v24, v12

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v12

    invoke-static {v8, v12}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 165
    .end local v11    # "colorG":F
    .end local v14    # "colorR":F
    .end local v22    # "centiKelvin":F
    .local v5, "tmpColor_b":F
    move v11, v6

    .line 166
    .local v11, "color_r":F
    move v12, v7

    .line 167
    .local v12, "color_g":F
    move v14, v5

    .line 168
    .local v14, "color_b":F
    move v4, v1

    .line 170
    move/from16 v22, v13

    div-float v13, v4, v21

    .line 172
    .local v13, "centiKelvin":F
    cmpl-float v21, v13, v23

    if-lez v21, :cond_4

    .line 173
    move/from16 v21, v15

    sub-float v15, v13, v18

    .line 174
    .local v15, "tmp":F
    move/from16 v25, v3

    .end local v3    # "warmth":F
    .local v25, "warmth":F
    float-to-double v2, v15

    const-wide v8, -0x403ef32580000000L    # -0.13320475816726685

    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, p1

    .line 175
    .local v2, "colorR":F
    float-to-double v8, v15

    move/from16 p1, v11

    const-wide v10, 0x3fb354f0e0000000L

    .end local v11    # "color_r":F
    .local p1, "color_r":F
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    double-to-float v8, v8

    mul-float v8, v8, v21

    .line 177
    .end local v15    # "tmp":F
    .local v8, "colorG":F
    goto :goto_3

    .line 178
    .end local v2    # "colorR":F
    .end local v8    # "colorG":F
    .end local v25    # "warmth":F
    .end local p1    # "color_r":F
    .restart local v3    # "warmth":F
    .restart local v11    # "color_r":F
    :cond_4
    move/from16 v25, v3

    move/from16 p1, v11

    .end local v3    # "warmth":F
    .end local v11    # "color_r":F
    .restart local v25    # "warmth":F
    .restart local p1    # "color_r":F
    float-to-double v8, v13

    invoke-static {v8, v9}, Ljava/lang/Math;->log(D)D

    move-result-wide v8

    double-to-float v2, v8

    mul-float v2, v2, v17

    sub-float v8, v2, v16

    .line 179
    .restart local v8    # "colorG":F
    const/high16 v2, 0x437f0000    # 255.0f

    .line 181
    .restart local v2    # "colorR":F
    :goto_3
    cmpg-float v9, v13, v23

    if-gez v9, :cond_6

    .line 182
    cmpl-float v9, v13, v20

    if-lez v9, :cond_5

    .line 183
    sub-float v9, v13, v22

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    move-result-wide v9

    double-to-float v9, v9

    mul-float v9, v9, v19

    sub-float v9, v9, v24

    .local v9, "colorB":F
    goto :goto_4

    .line 185
    .end local v9    # "colorB":F
    :cond_5
    const/4 v9, 0x0

    .restart local v9    # "colorB":F
    goto :goto_4

    .line 188
    .end local v9    # "colorB":F
    :cond_6
    const/high16 v9, 0x437f0000    # 255.0f

    .line 190
    .restart local v9    # "colorB":F
    :goto_4
    const/4 v10, 0x0

    invoke-static {v2, v10}, Ljava/lang/Math;->max(FF)F

    move-result v11

    const/high16 v3, 0x437f0000    # 255.0f

    invoke-static {v3, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 191
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v11

    invoke-static {v3, v11}, Ljava/lang/Math;->min(FF)F

    move-result v7

    .line 192
    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v11

    invoke-static {v3, v11}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 195
    .end local v5    # "tmpColor_b":F
    .end local v8    # "colorG":F
    .end local v9    # "colorB":F
    .end local v13    # "centiKelvin":F
    .local v2, "tmpColor_b":F
    div-float v11, p1, v6

    .line 196
    .end local p1    # "color_r":F
    .restart local v11    # "color_r":F
    div-float/2addr v12, v7

    .line 197
    div-float/2addr v14, v2

    .line 198
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x0

    aput v11, v3, v5

    .line 199
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x1

    const/16 v18, 0x0

    aput v18, v3, v5

    .line 200
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x2

    aput v18, v3, v5

    .line 201
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x3

    aput v18, v3, v5

    .line 202
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x4

    aput v18, v3, v5

    .line 204
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x5

    aput v18, v3, v5

    .line 205
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x6

    aput v12, v3, v5

    .line 206
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/4 v5, 0x7

    aput v18, v3, v5

    .line 207
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x8

    aput v18, v3, v5

    .line 208
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x9

    aput v18, v3, v5

    .line 210
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xa

    aput v18, v3, v5

    .line 211
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xb

    aput v18, v3, v5

    .line 212
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xc

    aput v14, v3, v5

    .line 213
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xd

    aput v18, v3, v5

    .line 214
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xe

    aput v18, v3, v5

    .line 216
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0xf

    aput v18, v3, v5

    .line 217
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x10

    aput v18, v3, v5

    .line 218
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x11

    aput v18, v3, v5

    .line 219
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x12

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v3, v5

    .line 220
    iget-object v3, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    const/16 v5, 0x13

    aput v18, v3, v5

    .line 221
    return-void
.end method


# virtual methods
.method updateMatrix(Landroid/widget/ImageView;)V
    .locals 6
    .param p1, "view"    # Landroid/widget/ImageView;

    .line 251
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    invoke-virtual {v0}, Landroid/graphics/ColorMatrix;->reset()V

    .line 252
    const/4 v0, 0x0

    .line 253
    .local v0, "filter":Z
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mSaturation:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    .line 254
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mSaturation:F

    invoke-direct {p0, v1}, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->saturation(F)V

    .line 255
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    invoke-virtual {v1, v3}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 256
    const/4 v0, 0x1

    .line 258
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mContrast:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    .line 259
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    iget v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mContrast:F

    iget v4, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mContrast:F

    iget v5, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mContrast:F

    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/graphics/ColorMatrix;->setScale(FFFF)V

    .line 260
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    invoke-virtual {v1, v3}, Landroid/graphics/ColorMatrix;->postConcat(Landroid/graphics/ColorMatrix;)V

    .line 261
    const/4 v0, 0x1

    .line 263
    :cond_1
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mWarmth:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_2

    .line 264
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mWarmth:F

    invoke-direct {p0, v1}, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->warmth(F)V

    .line 265
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    invoke-virtual {v1, v3}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 266
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    invoke-virtual {v1, v3}, Landroid/graphics/ColorMatrix;->postConcat(Landroid/graphics/ColorMatrix;)V

    .line 267
    const/4 v0, 0x1

    .line 269
    :cond_2
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mBrightness:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_3

    .line 270
    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mBrightness:F

    invoke-direct {p0, v1}, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->brightness(F)V

    .line 271
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->m:[F

    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 272
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    iget-object v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mTmpColorMatrix:Landroid/graphics/ColorMatrix;

    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->postConcat(Landroid/graphics/ColorMatrix;)V

    .line 273
    const/4 v0, 0x1

    .line 276
    :cond_3
    if-eqz v0, :cond_4

    .line 277
    new-instance v1, Landroid/graphics/ColorMatrixColorFilter;

    iget-object v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterView$ImageMatrix;->mColorMatrix:Landroid/graphics/ColorMatrix;

    invoke-direct {v1, v2}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0

    .line 279
    :cond_4
    invoke-virtual {p1}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 281
    :goto_0
    return-void
.end method
