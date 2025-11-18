.class public Landroidx/constraintlayout/motion/utils/StopLogic;
.super Landroidx/constraintlayout/motion/widget/MotionInterpolator;
.source "StopLogic.java"


# instance fields
.field private mBackwards:Z

.field private mLastPosition:F

.field private mNumberOfStages:I

.field private mStage1Duration:F

.field private mStage1EndPosition:F

.field private mStage1Velocity:F

.field private mStage2Duration:F

.field private mStage2EndPosition:F

.field private mStage2Velocity:F

.field private mStage3Duration:F

.field private mStage3EndPosition:F

.field private mStage3Velocity:F

.field private mStartPosition:F

.field private mType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/MotionInterpolator;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    return-void
.end method

.method private calcY(F)F
    .locals 4
    .param p1, "time"    # F

    .line 112
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    cmpg-float v0, p1, v0

    const/high16 v1, 0x40000000    # 2.0f

    if-gtz v0, :cond_0

    .line 113
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    mul-float/2addr v0, p1

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    mul-float/2addr v3, v1

    div-float/2addr v2, v3

    add-float/2addr v0, v2

    return v0

    .line 115
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 116
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    return v0

    .line 118
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    sub-float/2addr p1, v0

    .line 119
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    .line 121
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    mul-float/2addr v2, p1

    add-float/2addr v0, v2

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    mul-float/2addr v3, v1

    div-float/2addr v2, v3

    add-float/2addr v0, v2

    return v0

    .line 123
    :cond_2
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_3

    .line 124
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    return v0

    .line 126
    :cond_3
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    sub-float/2addr p1, v0

    .line 127
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_4

    .line 129
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    mul-float/2addr v2, p1

    add-float/2addr v0, v2

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    mul-float/2addr v2, p1

    mul-float/2addr v2, p1

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    mul-float/2addr v3, v1

    div-float/2addr v2, v3

    sub-float/2addr v0, v2

    return v0

    .line 131
    :cond_4
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    return v0
.end method

.method private setup(FFFFF)V
    .locals 12
    .param p1, "velocity"    # F
    .param p2, "distance"    # F
    .param p3, "maxAcceleration"    # F
    .param p4, "maxVelocity"    # F
    .param p5, "maxTime"    # F

    .line 160
    move/from16 v0, p4

    const/4 v1, 0x0

    cmpl-float v2, p1, v1

    if-nez v2, :cond_0

    .line 161
    const p1, 0x38d1b717    # 1.0E-4f

    .line 163
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 164
    div-float v2, p1, p3

    .line 165
    .local v2, "min_time_to_stop":F
    mul-float v3, v2, p1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    .line 167
    .local v3, "stopDistance":F
    cmpg-float v5, p1, v1

    const/4 v6, 0x3

    const/4 v7, 0x2

    if-gez v5, :cond_2

    .line 168
    neg-float v5, p1

    div-float/2addr v5, p3

    .line 169
    .local v5, "timeToZeroVelocity":F
    mul-float v8, v5, p1

    div-float/2addr v8, v4

    .line 170
    .local v8, "reversDistanceTraveled":F
    sub-float v9, p2, v8

    .line 171
    .local v9, "totalDistance":F
    mul-float v10, p3, v9

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-float v10, v10

    .line 172
    .local v10, "peak_v":F
    cmpg-float v11, v10, v0

    if-gez v11, :cond_1

    .line 173
    const-string v6, "backward accelerate, decelerate"

    iput-object v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 174
    iput v7, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 175
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 176
    iput v10, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 177
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    .line 178
    sub-float v1, v10, p1

    div-float/2addr v1, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 179
    div-float v1, v10, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 180
    add-float v1, p1, v10

    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    mul-float/2addr v1, v6

    div-float/2addr v1, v4

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 181
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    .line 182
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    .line 183
    return-void

    .line 185
    :cond_1
    const-string v1, "backward accelerate cruse decelerate"

    iput-object v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 186
    iput v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 187
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 188
    iput v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 189
    iput v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    .line 191
    sub-float v1, v0, p1

    div-float/2addr v1, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 192
    div-float v1, v0, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    .line 193
    add-float v1, p1, v0

    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    mul-float/2addr v1, v6

    div-float/2addr v1, v4

    .line 194
    .local v1, "accDist":F
    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    mul-float/2addr v6, v0

    div-float/2addr v6, v4

    .line 195
    .local v6, "decDist":F
    sub-float v4, p2, v1

    sub-float/2addr v4, v6

    div-float/2addr v4, v0

    iput v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 196
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 197
    sub-float v4, p2, v6

    iput v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    .line 198
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    .line 199
    return-void

    .line 202
    .end local v1    # "accDist":F
    .end local v5    # "timeToZeroVelocity":F
    .end local v6    # "decDist":F
    .end local v8    # "reversDistanceTraveled":F
    .end local v9    # "totalDistance":F
    .end local v10    # "peak_v":F
    :cond_2
    cmpl-float v5, v3, p2

    if-ltz v5, :cond_3

    .line 204
    const-string v5, "hard stop"

    iput-object v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 205
    mul-float/2addr v4, p2

    div-float/2addr v4, p1

    .line 206
    .local v4, "time":F
    const/4 v5, 0x1

    iput v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 207
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 208
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 209
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 210
    iput v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 211
    return-void

    .line 214
    .end local v4    # "time":F
    :cond_3
    sub-float v5, p2, v3

    .line 215
    .local v5, "distance_before_break":F
    div-float v8, v5, p1

    .line 216
    .local v8, "cruseTime":F
    add-float v9, v8, v2

    cmpg-float v9, v9, p5

    if-gez v9, :cond_4

    .line 217
    const-string v4, "cruse decelerate"

    iput-object v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 218
    iput v7, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 219
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 220
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 221
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    .line 222
    iput v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 223
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    .line 224
    iput v8, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 225
    div-float v1, p1, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 226
    return-void

    .line 229
    :cond_4
    mul-float v9, p3, p2

    mul-float v10, p1, p1

    div-float/2addr v10, v4

    add-float/2addr v9, v10

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v9

    double-to-float v9, v9

    .line 230
    .local v9, "peak_v":F
    sub-float v10, v9, p1

    div-float/2addr v10, p3

    iput v10, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 231
    div-float v10, v9, p3

    iput v10, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 232
    cmpg-float v10, v9, v0

    if-gez v10, :cond_5

    .line 233
    const-string v6, "accelerate decelerate"

    iput-object v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 234
    iput v7, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 235
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 236
    iput v9, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 237
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    .line 238
    sub-float v1, v9, p1

    div-float/2addr v1, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 239
    div-float v1, v9, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 240
    add-float v1, p1, v9

    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    mul-float/2addr v1, v6

    div-float/2addr v1, v4

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 241
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    .line 243
    return-void

    .line 245
    :cond_5
    const-string v1, "accelerate cruse decelerate"

    iput-object v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    .line 247
    iput v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    .line 248
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    .line 249
    iput v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    .line 250
    iput v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    .line 252
    sub-float v1, v0, p1

    div-float/2addr v1, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    .line 253
    div-float v1, v0, p3

    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    .line 254
    add-float v1, p1, v0

    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    mul-float/2addr v1, v6

    div-float/2addr v1, v4

    .line 255
    .restart local v1    # "accDist":F
    iget v6, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    mul-float/2addr v6, v0

    div-float/2addr v6, v4

    .line 257
    .restart local v6    # "decDist":F
    sub-float v4, p2, v1

    sub-float/2addr v4, v6

    div-float/2addr v4, v0

    iput v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    .line 258
    iput v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    .line 259
    sub-float v4, p2, v6

    iput v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    .line 260
    iput p2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    .line 261
    return-void
.end method


# virtual methods
.method public config(FFFFFF)V
    .locals 6
    .param p1, "currentPos"    # F
    .param p2, "destination"    # F
    .param p3, "currentVelocity"    # F
    .param p4, "maxTime"    # F
    .param p5, "maxAcceleration"    # F
    .param p6, "maxVelocity"    # F

    .line 137
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStartPosition:F

    .line 138
    cmpl-float v1, p1, p2

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    .line 139
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    if-eqz v1, :cond_1

    .line 140
    neg-float v1, p3

    sub-float v2, p1, p2

    move-object v0, p0

    move v5, p4

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/utils/StopLogic;->setup(FFFFF)V

    goto :goto_1

    .line 142
    :cond_1
    sub-float v2, p2, p1

    move-object v0, p0

    move v1, p3

    move v5, p4

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/utils/StopLogic;->setup(FFFFF)V

    .line 144
    :goto_1
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;F)V
    .locals 6
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "time"    # F

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ===== "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    if-eqz v1, :cond_0

    const-string v1, "backwards"

    goto :goto_0

    :cond_0
    const-string v1, "forward "

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " time = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  stages "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dur "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " vel "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " pos "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v4, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1EndPosition:F

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v4, 0x1

    if-le v0, v4, :cond_1

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v5, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v5, 0x2

    if-le v0, v5, :cond_2

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_2
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    cmpg-float v0, p3, v0

    if-gtz v0, :cond_3

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "stage 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    return-void

    .line 65
    :cond_3
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    if-ne v0, v4, :cond_4

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "end stage 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    return-void

    .line 69
    :cond_4
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    sub-float/2addr p3, v0

    .line 70
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    cmpg-float v0, p3, v0

    if-gez v0, :cond_5

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " stage 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void

    .line 75
    :cond_5
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    if-ne v0, v5, :cond_6

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "end stage 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    return-void

    .line 79
    :cond_6
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    sub-float/2addr p3, v0

    .line 80
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    cmpg-float v0, p3, v0

    if-gez v0, :cond_7

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " stage 2"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    return-void

    .line 85
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " end stage 2"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method

.method public getInterpolation(F)F
    .locals 2
    .param p1, "v"    # F

    .line 148
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/utils/StopLogic;->calcY(F)F

    move-result v0

    .line 149
    .local v0, "y":F
    iput p1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mLastPosition:F

    .line 150
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    if-eqz v1, :cond_0

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStartPosition:F

    sub-float/2addr v1, v0

    goto :goto_0

    :cond_0
    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStartPosition:F

    add-float/2addr v1, v0

    :goto_0
    return v1
.end method

.method public getVelocity()F
    .locals 1

    .line 155
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mBackwards:Z

    if-eqz v0, :cond_0

    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mLastPosition:F

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/utils/StopLogic;->getVelocity(F)F

    move-result v0

    neg-float v0, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mLastPosition:F

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/utils/StopLogic;->getVelocity(F)F

    move-result v0

    :goto_0
    return v0
.end method

.method public getVelocity(F)F
    .locals 3
    .param p1, "x"    # F

    .line 89
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    .line 90
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Velocity:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p1

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0

    .line 92
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 93
    const/4 v0, 0x0

    return v0

    .line 95
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage1Duration:F

    sub-float/2addr p1, v0

    .line 96
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    .line 98
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Velocity:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p1

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0

    .line 100
    :cond_2
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mNumberOfStages:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 101
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2EndPosition:F

    return v0

    .line 103
    :cond_3
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage2Duration:F

    sub-float/2addr p1, v0

    .line 104
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_4

    .line 106
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    iget v1, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Velocity:F

    mul-float/2addr v1, p1

    iget v2, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3Duration:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0

    .line 108
    :cond_4
    iget v0, p0, Landroidx/constraintlayout/motion/utils/StopLogic;->mStage3EndPosition:F

    return v0
.end method
