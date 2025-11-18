.class Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;
.super Ljava/lang/Object;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/MotionLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DevModeDraw"
.end annotation


# static fields
.field private static final DEBUG_PATH_TICKS_PER_MS:I = 0x10


# instance fields
.field final DIAMOND_SIZE:I

.field final GRAPH_COLOR:I

.field final KEYFRAME_COLOR:I

.field final RED_COLOR:I

.field final SHADOW_COLOR:I

.field mBounds:Landroid/graphics/Rect;

.field mDashPathEffect:Landroid/graphics/DashPathEffect;

.field mFillPaint:Landroid/graphics/Paint;

.field mKeyFrameCount:I

.field mKeyFramePoints:[F

.field mPaint:Landroid/graphics/Paint;

.field mPaintGraph:Landroid/graphics/Paint;

.field mPaintKeyframes:Landroid/graphics/Paint;

.field mPath:Landroid/graphics/Path;

.field mPathMode:[I

.field mPoints:[F

.field mPresentationMode:Z

.field private mRectangle:[F

.field mShadowTranslate:I

.field mTextPaint:Landroid/graphics/Paint;

.field final synthetic this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .locals 6

    .line 2545
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2534
    const/16 v0, -0x55cd

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->RED_COLOR:I

    .line 2535
    const v1, -0x1f8a66

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->KEYFRAME_COLOR:I

    .line 2536
    const v2, -0xcc5600

    iput v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->GRAPH_COLOR:I

    .line 2537
    const/high16 v3, 0x77000000

    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->SHADOW_COLOR:I

    .line 2538
    const/16 v3, 0xa

    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->DIAMOND_SIZE:I

    .line 2541
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    .line 2542
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPresentationMode:Z

    .line 2543
    const/4 v3, 0x1

    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    .line 2546
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    .line 2547
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2548
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2549
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2550
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2552
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    .line 2553
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2554
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 2555
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2556
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2558
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2559
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2560
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 2561
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2562
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2564
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    .line 2565
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2566
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 2567
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41400000    # 12.0f

    mul-float/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 2568
    const/16 p1, 0x8

    new-array p1, p1, [F

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    .line 2569
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    .line 2570
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2571
    new-instance p1, Landroid/graphics/DashPathEffect;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 2572
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 2573
    const/16 p1, 0x64

    new-array p1, p1, [F

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFramePoints:[F

    .line 2574
    const/16 p1, 0x32

    new-array p1, p1, [I

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    .line 2576
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPresentationMode:Z

    if-eqz p1, :cond_0

    .line 2577
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x41000000    # 8.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2578
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2579
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2580
    const/4 p1, 0x4

    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    .line 2582
    :cond_0
    return-void

    :array_0
    .array-data 4
        0x40800000    # 4.0f
        0x41000000    # 8.0f
    .end array-data
.end method

.method private drawBasicPath(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2654
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawLines([FLandroid/graphics/Paint;)V

    .line 2655
    return-void
.end method

.method private drawPathAsConfigured(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2728
    const/4 v0, 0x0

    .line 2729
    .local v0, "path":Z
    const/4 v1, 0x0

    .line 2730
    .local v1, "cart":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFrameCount:I

    if-ge v2, v3, :cond_2

    .line 2731
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    aget v3, v3, v2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 2732
    const/4 v0, 0x1

    .line 2734
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    aget v3, v3, v2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 2735
    const/4 v1, 0x1

    .line 2730
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2738
    .end local v2    # "i":I
    :cond_2
    if-eqz v0, :cond_3

    .line 2739
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathRelative(Landroid/graphics/Canvas;)V

    .line 2741
    :cond_3
    if-eqz v1, :cond_4

    .line 2742
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathCartesian(Landroid/graphics/Canvas;)V

    .line 2744
    :cond_4
    return-void
.end method

.method private drawPathCartesian(Landroid/graphics/Canvas;)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2772
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    .line 2773
    .local v1, "x1":F
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    .line 2774
    .local v2, "y1":F
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v5, v5

    add-int/lit8 v5, v5, -0x2

    aget v4, v4, v5

    .line 2775
    .local v4, "x2":F
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v6, v6

    sub-int/2addr v6, v3

    aget v3, v5, v6

    .line 2777
    .local v3, "y2":F
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 2778
    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v8

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iget-object v10, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2777
    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2779
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v12

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v13

    .line 2780
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v14

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v15

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2779
    move-object/from16 v11, p1

    move-object/from16 v16, v5

    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2781
    return-void
.end method

.method private drawPathCartesianTicks(Landroid/graphics/Canvas;FF)V
    .locals 22
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2784
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v3, 0x0

    aget v7, v2, v3

    .line 2785
    .local v7, "x1":F
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v3, 0x1

    aget v8, v2, v3

    .line 2786
    .local v8, "y1":F
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v4, v4

    add-int/lit8 v4, v4, -0x2

    aget v9, v2, v4

    .line 2787
    .local v9, "x2":F
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v4, v4

    sub-int/2addr v4, v3

    aget v10, v2, v4

    .line 2788
    .local v10, "y2":F
    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 2789
    .local v11, "minx":F
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v12

    .line 2790
    .local v12, "maxy":F
    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v2

    sub-float v13, p2, v2

    .line 2791
    .local v13, "xgap":F
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v2

    sub-float v14, v2, p3

    .line 2793
    .local v14, "ygap":F
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ""

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/high16 v16, 0x42c80000    # 100.0f

    mul-float v3, v13, v16

    sub-float v4, v9, v7

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    div-float/2addr v3, v4

    float-to-double v3, v3

    const-wide/high16 v17, 0x3fe0000000000000L    # 0.5

    add-double v3, v3, v17

    double-to-int v3, v3

    int-to-float v3, v3

    div-float v3, v3, v16

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2794
    .local v2, "text":Ljava/lang/String;
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 2795
    const/high16 v19, 0x40000000    # 2.0f

    div-float v3, v13, v19

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    sub-float v20, v3, v4

    .line 2796
    .local v20, "off":F
    add-float v3, v20, v11

    const/high16 v4, 0x41a00000    # 20.0f

    sub-float v4, p3, v4

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2797
    nop

    .line 2798
    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2797
    move/from16 v5, p3

    move/from16 v3, p3

    move-object/from16 v21, v2

    move/from16 v2, p2

    .end local v2    # "text":Ljava/lang/String;
    .local v21, "text":Ljava/lang/String;
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2801
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    mul-float v3, v14, v16

    sub-float v4, v10, v8

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    div-float/2addr v3, v4

    float-to-double v3, v3

    add-double v3, v3, v17

    double-to-int v3, v3

    int-to-float v3, v3

    div-float v3, v3, v16

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 2802
    .end local v21    # "text":Ljava/lang/String;
    .local v15, "text":Ljava/lang/String;
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v15, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 2803
    div-float v2, v14, v19

    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float v16, v2, v3

    .line 2804
    .end local v20    # "off":F
    .local v16, "off":F
    const/high16 v2, 0x40a00000    # 5.0f

    add-float v2, p2, v2

    sub-float v3, v12, v16

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v15, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2805
    nop

    .line 2806
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2805
    move/from16 v4, p2

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2807
    return-void
.end method

.method private drawPathRelative(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2723
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v1, 0x0

    aget v3, v0, v1

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v1, 0x1

    aget v4, v0, v1

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v2, v2

    add-int/lit8 v2, v2, -0x2

    aget v5, v0, v2

    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v2, v2

    sub-int/2addr v2, v1

    aget v6, v0, v2

    iget-object v7, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    move-object v2, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v2, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2725
    return-void
.end method

.method private drawPathRelativeTicks(Landroid/graphics/Canvas;FF)V
    .locals 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2747
    move-object/from16 v0, p0

    move/from16 v2, p2

    move/from16 v3, p3

    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v4, 0x0

    aget v7, v1, v4

    .line 2748
    .local v7, "x1":F
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v4, 0x1

    aget v8, v1, v4

    .line 2749
    .local v8, "y1":F
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v5, v5

    add-int/lit8 v5, v5, -0x2

    aget v9, v1, v5

    .line 2750
    .local v9, "x2":F
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v5, v5

    sub-int/2addr v5, v4

    aget v10, v1, v5

    .line 2751
    .local v10, "y2":F
    sub-float v1, v7, v9

    float-to-double v4, v1

    sub-float v1, v8, v10

    float-to-double v11, v1

    invoke-static {v4, v5, v11, v12}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    double-to-float v11, v4

    .line 2752
    .local v11, "dist":F
    sub-float v1, v2, v7

    sub-float v4, v9, v7

    mul-float/2addr v1, v4

    sub-float v4, v3, v8

    sub-float v5, v10, v8

    mul-float/2addr v4, v5

    add-float/2addr v1, v4

    mul-float v4, v11, v11

    div-float v12, v1, v4

    .line 2753
    .local v12, "t":F
    sub-float v1, v9, v7

    mul-float/2addr v1, v12

    add-float v4, v7, v1

    .line 2754
    .local v4, "xp":F
    sub-float v1, v10, v8

    mul-float/2addr v1, v12

    add-float v5, v8, v1

    .line 2756
    .local v5, "yp":F
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    move-object v15, v1

    .line 2757
    .local v15, "path":Landroid/graphics/Path;
    invoke-virtual {v15, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 2758
    invoke-virtual {v15, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2759
    sub-float v1, v4, v2

    float-to-double v13, v1

    sub-float v1, v5, v3

    float-to-double v1, v1

    invoke-static {v13, v14, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v1

    double-to-float v1, v1

    .line 2760
    .local v1, "len":F
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float v13, v1, v6

    div-float/2addr v13, v11

    float-to-int v13, v13

    int-to-float v13, v13

    div-float/2addr v13, v6

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 2761
    .local v14, "text":Ljava/lang/String;
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v14, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 2762
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v1, v2

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    sub-float v16, v2, v6

    .line 2763
    .local v16, "off":F
    const/high16 v17, -0x3e600000    # -20.0f

    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    move-object/from16 v13, p1

    move-object/from16 v18, v2

    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    .line 2764
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    move/from16 v2, p2

    move v13, v1

    move-object/from16 v1, p1

    .end local v1    # "len":F
    .local v13, "len":F
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2765
    return-void
.end method

.method private drawPathScreenTicks(Landroid/graphics/Canvas;FFII)V
    .locals 22
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "viewWidth"    # I
    .param p5, "viewHeight"    # I

    .line 2810
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v7, 0x0

    .line 2811
    .local v7, "x1":F
    const/4 v8, 0x0

    .line 2812
    .local v8, "y1":F
    const/high16 v9, 0x3f800000    # 1.0f

    .line 2813
    .local v9, "x2":F
    const/high16 v10, 0x3f800000    # 1.0f

    .line 2814
    .local v10, "y2":F
    const/4 v11, 0x0

    .line 2815
    .local v11, "minx":F
    const/4 v12, 0x0

    .line 2816
    .local v12, "maxy":F
    move/from16 v13, p2

    .line 2817
    .local v13, "xgap":F
    move/from16 v14, p3

    .line 2819
    .local v14, "ygap":F
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ""

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    div-int/lit8 v3, p4, 0x2

    int-to-float v3, v3

    sub-float v3, v13, v3

    const/high16 v16, 0x42c80000    # 100.0f

    mul-float v3, v3, v16

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getWidth()I

    move-result v4

    sub-int v4, v4, p4

    int-to-float v4, v4

    div-float/2addr v3, v4

    float-to-double v3, v3

    const-wide/high16 v17, 0x3fe0000000000000L    # 0.5

    add-double v3, v3, v17

    double-to-int v3, v3

    int-to-float v3, v3

    div-float v3, v3, v16

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2820
    .local v2, "text":Ljava/lang/String;
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 2821
    const/high16 v19, 0x40000000    # 2.0f

    div-float v3, v13, v19

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    sub-float v20, v3, v4

    .line 2822
    .local v20, "off":F
    add-float v3, v20, v11

    const/high16 v4, 0x41a00000    # 20.0f

    sub-float v4, p3, v4

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2823
    nop

    .line 2824
    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2823
    move/from16 v5, p3

    move/from16 v3, p3

    move-object/from16 v21, v2

    move/from16 v2, p2

    .end local v2    # "text":Ljava/lang/String;
    .local v21, "text":Ljava/lang/String;
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2827
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    div-int/lit8 v3, p5, 0x2

    int-to-float v3, v3

    sub-float v3, v14, v3

    mul-float v3, v3, v16

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v4}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getHeight()I

    move-result v4

    sub-int v4, v4, p5

    int-to-float v4, v4

    div-float/2addr v3, v4

    float-to-double v3, v3

    add-double v3, v3, v17

    double-to-int v3, v3

    int-to-float v3, v3

    div-float v3, v3, v16

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 2828
    .end local v21    # "text":Ljava/lang/String;
    .local v15, "text":Ljava/lang/String;
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v15, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 2829
    div-float v2, v14, v19

    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float v16, v2, v3

    .line 2830
    .end local v20    # "off":F
    .local v16, "off":F
    const/high16 v2, 0x40a00000    # 5.0f

    add-float v2, p2, v2

    sub-float v3, v12, v16

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v15, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2831
    nop

    .line 2832
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    .line 2831
    move/from16 v4, p2

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2833
    return-void
.end method

.method private drawRectangle(Landroid/graphics/Canvas;Landroidx/constraintlayout/motion/widget/MotionController;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "motionController"    # Landroidx/constraintlayout/motion/widget/MotionController;

    .line 2836
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 2837
    const/16 v0, 0x32

    .line 2838
    .local v0, "rectFrames":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-gt v1, v0, :cond_0

    .line 2839
    int-to-float v2, v1

    int-to-float v3, v0

    div-float/2addr v2, v3

    .line 2840
    .local v2, "p":F
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v4, 0x0

    invoke-virtual {p2, v2, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionController;->buildRect(F[FI)V

    .line 2841
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    aget v4, v5, v4

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v6, 0x1

    aget v5, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 2842
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v5, 0x2

    aget v4, v4, v5

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v6, 0x3

    aget v5, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2843
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v5, 0x4

    aget v4, v4, v5

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v6, 0x5

    aget v5, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2844
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v5, 0x6

    aget v4, v4, v5

    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mRectangle:[F

    const/4 v6, 0x7

    aget v5, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2845
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 2838
    .end local v2    # "p":F
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2847
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x44000000    # 512.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 2848
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2849
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 2851
    const/high16 v1, -0x40000000    # -2.0f

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2852
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x10000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 2853
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 2854
    return-void
.end method

.method private drawTicks(Landroid/graphics/Canvas;IILandroidx/constraintlayout/motion/widget/MotionController;)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "mode"    # I
    .param p3, "keyFrames"    # I
    .param p4, "motionController"    # Landroidx/constraintlayout/motion/widget/MotionController;

    .line 2658
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v6, p2

    move-object/from16 v7, p4

    const/4 v2, 0x0

    .line 2659
    .local v2, "viewWidth":I
    const/4 v3, 0x0

    .line 2660
    .local v3, "viewHeight":I
    iget-object v4, v7, Landroidx/constraintlayout/motion/widget/MotionController;->mView:Landroid/view/View;

    if-eqz v4, :cond_0

    .line 2661
    iget-object v4, v7, Landroidx/constraintlayout/motion/widget/MotionController;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 2662
    iget-object v4, v7, Landroidx/constraintlayout/motion/widget/MotionController;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v3

    move v4, v2

    move v5, v3

    goto :goto_0

    .line 2660
    :cond_0
    move v4, v2

    move v5, v3

    .line 2664
    .end local v2    # "viewWidth":I
    .end local v3    # "viewHeight":I
    .local v4, "viewWidth":I
    .local v5, "viewHeight":I
    :goto_0
    const/4 v2, 0x1

    move v8, v2

    .local v8, "i":I
    :goto_1
    add-int/lit8 v2, p3, -0x1

    const/4 v9, 0x2

    const/4 v3, 0x1

    if-ge v8, v2, :cond_b

    .line 2665
    const/4 v2, 0x4

    if-ne v6, v2, :cond_1

    iget-object v10, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    add-int/lit8 v11, v8, -0x1

    aget v10, v10, v11

    if-nez v10, :cond_1

    .line 2667
    move v15, v4

    move/from16 v16, v5

    goto/16 :goto_5

    .line 2670
    :cond_1
    iget-object v10, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFramePoints:[F

    mul-int/lit8 v11, v8, 0x2

    aget v10, v10, v11

    .line 2671
    .local v10, "x":F
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFramePoints:[F

    mul-int/lit8 v12, v8, 0x2

    add-int/2addr v12, v3

    aget v11, v11, v12

    .line 2672
    .local v11, "y":F
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    invoke-virtual {v12}, Landroid/graphics/Path;->reset()V

    .line 2673
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    const/high16 v13, 0x41200000    # 10.0f

    add-float v14, v11, v13

    invoke-virtual {v12, v10, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 2674
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    add-float v14, v10, v13

    invoke-virtual {v12, v14, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2675
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    sub-float v14, v11, v13

    invoke-virtual {v12, v10, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2676
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    sub-float v13, v10, v13

    invoke-virtual {v12, v13, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2677
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    invoke-virtual {v12}, Landroid/graphics/Path;->close()V

    .line 2679
    add-int/lit8 v12, v8, -0x1

    invoke-virtual {v7, v12}, Landroidx/constraintlayout/motion/widget/MotionController;->getKeyFrame(I)Landroidx/constraintlayout/motion/widget/MotionPaths;

    move-result-object v12

    .line 2680
    .local v12, "framePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    const/4 v13, 0x0

    .line 2681
    .local v13, "dx":F
    const/4 v14, 0x0

    .line 2682
    .local v14, "dy":F
    const/4 v15, 0x3

    if-ne v6, v2, :cond_5

    .line 2684
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    add-int/lit8 v16, v8, -0x1

    aget v2, v2, v16

    if-ne v2, v3, :cond_2

    .line 2685
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct {v0, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathRelativeTicks(Landroid/graphics/Canvas;FF)V

    goto :goto_2

    .line 2686
    :cond_2
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    add-int/lit8 v3, v8, -0x1

    aget v2, v2, v3

    if-ne v2, v9, :cond_3

    .line 2687
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct {v0, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathCartesianTicks(Landroid/graphics/Canvas;FF)V

    goto :goto_2

    .line 2688
    :cond_3
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    add-int/lit8 v3, v8, -0x1

    aget v2, v2, v3

    if-ne v2, v15, :cond_4

    .line 2689
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathScreenTicks(Landroid/graphics/Canvas;FFII)V

    .line 2692
    :cond_4
    :goto_2
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 2694
    :cond_5
    if-ne v6, v9, :cond_6

    .line 2695
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct {v0, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathRelativeTicks(Landroid/graphics/Canvas;FF)V

    .line 2697
    :cond_6
    if-ne v6, v15, :cond_7

    .line 2698
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct {v0, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathCartesianTicks(Landroid/graphics/Canvas;FF)V

    .line 2700
    :cond_7
    const/4 v2, 0x6

    if-ne v6, v2, :cond_8

    .line 2701
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathScreenTicks(Landroid/graphics/Canvas;FFII)V

    move v15, v4

    move/from16 v16, v5

    .end local v4    # "viewWidth":I
    .end local v5    # "viewHeight":I
    .local v15, "viewWidth":I
    .local v16, "viewHeight":I
    goto :goto_3

    .line 2700
    .end local v15    # "viewWidth":I
    .end local v16    # "viewHeight":I
    .restart local v4    # "viewWidth":I
    .restart local v5    # "viewHeight":I
    :cond_8
    move v15, v4

    move/from16 v16, v5

    .line 2703
    .end local v4    # "viewWidth":I
    .end local v5    # "viewHeight":I
    .restart local v15    # "viewWidth":I
    .restart local v16    # "viewHeight":I
    :goto_3
    const/4 v2, 0x0

    cmpl-float v3, v13, v2

    if-nez v3, :cond_a

    cmpl-float v2, v14, v2

    if-eqz v2, :cond_9

    goto :goto_4

    .line 2706
    :cond_9
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_5

    .line 2704
    :cond_a
    :goto_4
    sub-float v2, v10, v13

    sub-float v3, v11, v14

    move v4, v10

    move v5, v11

    .end local v10    # "x":F
    .end local v11    # "y":F
    .local v4, "x":F
    .local v5, "y":F
    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawTranslation(Landroid/graphics/Canvas;FFFF)V

    .line 2664
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v12    # "framePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .end local v13    # "dx":F
    .end local v14    # "dy":F
    :goto_5
    add-int/lit8 v8, v8, 0x1

    move v4, v15

    move/from16 v5, v16

    goto/16 :goto_1

    .end local v15    # "viewWidth":I
    .end local v16    # "viewHeight":I
    .local v4, "viewWidth":I
    .local v5, "viewHeight":I
    :cond_b
    move v15, v4

    move/from16 v16, v5

    .line 2709
    .end local v4    # "viewWidth":I
    .end local v5    # "viewHeight":I
    .end local v8    # "i":I
    .restart local v15    # "viewWidth":I
    .restart local v16    # "viewHeight":I
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v2, v2

    if-le v2, v3, :cond_c

    .line 2711
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    const/4 v4, 0x0

    aget v2, v2, v4

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    aget v4, v4, v3

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    const/high16 v8, 0x41000000    # 8.0f

    invoke-virtual {v1, v2, v4, v8, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 2712
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v4, v4

    sub-int/2addr v4, v9

    aget v2, v2, v4

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v5, v5

    sub-int/2addr v5, v3

    aget v3, v4, v5

    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v8, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 2715
    :cond_c
    return-void
.end method

.method private drawTranslation(Landroid/graphics/Canvas;FFFF)V
    .locals 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F

    .line 2718
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    move v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 2719
    iget-object v11, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    move-object v6, p1

    move v7, p2

    move v8, p3

    move/from16 v9, p4

    move/from16 v10, p5

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2720
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/util/HashMap;II)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "duration"    # I
    .param p4, "debugPath"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Landroidx/constraintlayout/motion/widget/MotionController;",
            ">;II)V"
        }
    .end annotation

    .line 2587
    .local p2, "frameArrayList":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/view/View;Landroidx/constraintlayout/motion/widget/MotionController;>;"
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 2590
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2591
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1

    and-int/lit8 v0, p4, 0x1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 2592
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-static {v2}, Landroidx/constraintlayout/motion/widget/MotionLayout;->access$000(Landroidx/constraintlayout/motion/widget/MotionLayout;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getProgress()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2593
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getHeight()I

    move-result v1

    add-int/lit8 v1, v1, -0x1e

    int-to-float v1, v1

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mTextPaint:Landroid/graphics/Paint;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2594
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->this$0:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getHeight()I

    move-result v1

    add-int/lit8 v1, v1, -0x1d

    int-to-float v1, v1

    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 2596
    .end local v0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/motion/widget/MotionController;

    .line 2597
    .local v1, "motionController":Landroidx/constraintlayout/motion/widget/MotionController;
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/MotionController;->getDrawPath()I

    move-result v2

    .line 2598
    .local v2, "mode":I
    if-lez p4, :cond_2

    if-nez v2, :cond_2

    .line 2599
    const/4 v2, 0x1

    .line 2601
    :cond_2
    if-nez v2, :cond_3

    .line 2602
    goto :goto_0

    .line 2605
    :cond_3
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFramePoints:[F

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPathMode:[I

    invoke-virtual {v1, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionController;->buildKeyFrames([F[I)I

    move-result v3

    iput v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFrameCount:I

    .line 2607
    const/4 v3, 0x1

    if-lt v2, v3, :cond_6

    .line 2609
    div-int/lit8 v3, p3, 0x10

    .line 2610
    .local v3, "frames":I
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    if-eqz v4, :cond_4

    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    array-length v4, v4

    mul-int/lit8 v5, v3, 0x2

    if-eq v4, v5, :cond_5

    .line 2611
    :cond_4
    mul-int/lit8 v4, v3, 0x2

    new-array v4, v4, [F

    iput-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    .line 2612
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    iput-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPath:Landroid/graphics/Path;

    .line 2615
    :cond_5
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    int-to-float v4, v4

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    int-to-float v5, v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2617
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v5, 0x77000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2618
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2619
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2620
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2621
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPoints:[F

    invoke-virtual {v1, v4, v3}, Landroidx/constraintlayout/motion/widget/MotionController;->buildPath([FI)V

    .line 2622
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFrameCount:I

    invoke-virtual {p0, p1, v2, v4, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawAll(Landroid/graphics/Canvas;IILandroidx/constraintlayout/motion/widget/MotionController;)V

    .line 2623
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaint:Landroid/graphics/Paint;

    const/16 v5, -0x55cd

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2624
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintKeyframes:Landroid/graphics/Paint;

    const v5, -0x1f8a66

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2625
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2626
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mPaintGraph:Landroid/graphics/Paint;

    const v5, -0xcc5600

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 2628
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    neg-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mShadowTranslate:I

    neg-int v5, v5

    int-to-float v5, v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2629
    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mKeyFrameCount:I

    invoke-virtual {p0, p1, v2, v4, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawAll(Landroid/graphics/Canvas;IILandroidx/constraintlayout/motion/widget/MotionController;)V

    .line 2630
    const/4 v4, 0x5

    if-ne v2, v4, :cond_6

    .line 2631
    invoke-direct {p0, p1, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawRectangle(Landroid/graphics/Canvas;Landroidx/constraintlayout/motion/widget/MotionController;)V

    .line 2635
    .end local v1    # "motionController":Landroidx/constraintlayout/motion/widget/MotionController;
    .end local v2    # "mode":I
    .end local v3    # "frames":I
    :cond_6
    goto/16 :goto_0

    .line 2636
    :cond_7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 2637
    return-void

    .line 2588
    :cond_8
    :goto_1
    return-void
.end method

.method public drawAll(Landroid/graphics/Canvas;IILandroidx/constraintlayout/motion/widget/MotionController;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "mode"    # I
    .param p3, "keyFrames"    # I
    .param p4, "motionController"    # Landroidx/constraintlayout/motion/widget/MotionController;

    .line 2640
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 2641
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathAsConfigured(Landroid/graphics/Canvas;)V

    .line 2643
    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 2644
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathRelative(Landroid/graphics/Canvas;)V

    .line 2646
    :cond_1
    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    .line 2647
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawPathCartesian(Landroid/graphics/Canvas;)V

    .line 2649
    :cond_2
    invoke-direct {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawBasicPath(Landroid/graphics/Canvas;)V

    .line 2650
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->drawTicks(Landroid/graphics/Canvas;IILandroidx/constraintlayout/motion/widget/MotionController;)V

    .line 2651
    return-void
.end method

.method getTextBounds(Ljava/lang/String;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .line 2768
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$DevModeDraw;->mBounds:Landroid/graphics/Rect;

    const/4 v2, 0x0

    invoke-virtual {p2, p1, v2, v0, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 2769
    return-void
.end method
