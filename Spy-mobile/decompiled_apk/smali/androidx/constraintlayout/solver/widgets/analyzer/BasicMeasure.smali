.class public Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;
.super Ljava/lang/Object;
.source "BasicMeasure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;,
        Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;,
        Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$MeasureType;
    }
.end annotation


# static fields
.field public static final AT_MOST:I = -0x80000000

.field private static final DEBUG:Z = false

.field public static final EXACTLY:I = 0x40000000

.field public static final FIXED:I = -0x3

.field public static final MATCH_PARENT:I = -0x1

.field private static final MODE_SHIFT:I = 0x1e

.field public static final UNSPECIFIED:I = 0x0

.field public static final WRAP_CONTENT:I = -0x2


# instance fields
.field private constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

.field private mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

.field private final mVariableDimensionsWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .locals 1
    .param p1, "constraintWidgetContainer"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 51
    new-instance v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    .line 75
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 76
    return-void
.end method

.method private measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z
    .locals 9
    .param p1, "measurer"    # Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;
    .param p2, "widget"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .param p3, "useCurrentDimensions"    # Z

    .line 403
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 404
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 405
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalDimension:I

    .line 406
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalDimension:I

    .line 407
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    .line 408
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iput-boolean p3, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useCurrentDimensions:Z

    .line 410
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v3, 0x1

    if-ne v0, v2, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v1

    .line 411
    .local v0, "horizontalMatchConstraints":Z
    :goto_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v4, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    move v2, v1

    .line 412
    .local v2, "verticalMatchConstraints":Z
    :goto_1
    const/4 v4, 0x0

    if-eqz v0, :cond_2

    iget v5, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v5, v5, v4

    if-lez v5, :cond_2

    move v5, v3

    goto :goto_2

    :cond_2
    move v5, v1

    .line 413
    .local v5, "horizontalUseRatio":Z
    :goto_2
    if-eqz v2, :cond_3

    iget v6, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v4, v6, v4

    if-lez v4, :cond_3

    move v4, v3

    goto :goto_3

    :cond_3
    move v4, v1

    .line 415
    .local v4, "verticalUseRatio":Z
    :goto_3
    const/4 v6, 0x4

    if-eqz v5, :cond_4

    .line 416
    iget-object v7, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v7, v7, v1

    if-ne v7, v6, :cond_4

    .line 417
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    iput-object v8, v7, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 420
    :cond_4
    if-eqz v4, :cond_5

    .line 421
    iget-object v7, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v3, v7, v3

    if-ne v3, v6, :cond_5

    .line 422
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    iput-object v6, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 426
    :cond_5
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-interface {p1, p2, v3}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;->measure(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;)V

    .line 427
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredWidth:I

    invoke-virtual {p2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 428
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHeight:I

    invoke-virtual {p2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 429
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget-boolean v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHasBaseline:Z

    invoke-virtual {p2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHasBaseline(Z)V

    .line 430
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredBaseline:I

    invoke-virtual {p2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setBaselineDistance(I)V

    .line 431
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iput-boolean v1, v3, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useCurrentDimensions:Z

    .line 432
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget-boolean v1, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    return v1
.end method

.method private measureChildren(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .locals 12
    .param p1, "layout"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 79
    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 80
    .local v0, "childCount":I
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v1

    .line 81
    .local v1, "measurer":Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_5

    .line 82
    iget-object v3, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 83
    .local v3, "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    instance-of v4, v3, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v4, :cond_0

    .line 84
    goto :goto_2

    .line 87
    :cond_0
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v4, :cond_1

    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v4, :cond_1

    .line 88
    goto :goto_2

    .line 91
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v5

    .line 92
    .local v5, "widthBehavior":Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v7

    .line 94
    .local v7, "heightBehavior":Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v5, v8, :cond_2

    iget v8, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-eq v8, v6, :cond_2

    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v7, v8, :cond_2

    iget v8, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eq v8, v6, :cond_2

    goto :goto_1

    :cond_2
    move v6, v4

    .line 99
    .local v6, "skip":Z
    :goto_1
    if-eqz v6, :cond_3

    .line 102
    goto :goto_2

    .line 105
    :cond_3
    invoke-direct {p0, v1, v3, v4}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    .line 106
    iget-object v4, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    if-eqz v4, :cond_4

    .line 107
    iget-object v4, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    iget-wide v8, v4, Landroidx/constraintlayout/solver/Metrics;->measuredWidgets:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, v4, Landroidx/constraintlayout/solver/Metrics;->measuredWidgets:J

    .line 81
    .end local v3    # "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v5    # "widthBehavior":Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    .end local v6    # "skip":Z
    .end local v7    # "heightBehavior":Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;
    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 110
    .end local v2    # "i":I
    :cond_5
    invoke-interface {v1}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;->didMeasures()V

    .line 111
    return-void
.end method

.method private solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;II)V
    .locals 3
    .param p1, "layout"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "w"    # I
    .param p4, "h"    # I

    .line 119
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMinWidth()I

    move-result v0

    .line 120
    .local v0, "minWidth":I
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMinHeight()I

    move-result v1

    .line 121
    .local v1, "minHeight":I
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setMinWidth(I)V

    .line 122
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setMinHeight(I)V

    .line 123
    invoke-virtual {p1, p3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 124
    invoke-virtual {p1, p4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setHeight(I)V

    .line 125
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setMinWidth(I)V

    .line 126
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setMinHeight(I)V

    .line 130
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->layout()V

    .line 135
    return-void
.end method


# virtual methods
.method public solverMeasure(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;IIIIIIIII)J
    .locals 35
    .param p1, "layout"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;
    .param p2, "optimizationLevel"    # I
    .param p3, "paddingX"    # I
    .param p4, "paddingY"    # I
    .param p5, "widthMode"    # I
    .param p6, "widthSize"    # I
    .param p7, "heightMode"    # I
    .param p8, "heightSize"    # I
    .param p9, "lastMeasureWidth"    # I
    .param p10, "lastMeasureHeight"    # I

    .line 156
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p5

    move/from16 v4, p7

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMeasurer()Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    move-result-object v5

    .line 157
    .local v5, "measurer":Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;
    const-wide/16 v6, 0x0

    .line 159
    .local v6, "layoutTime":J
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 160
    .local v8, "childCount":I
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v9

    .line 161
    .local v9, "startingWidth":I
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v10

    .line 163
    .local v10, "startingHeight":I
    const/16 v11, 0x80

    invoke-static {v2, v11}, Landroidx/constraintlayout/solver/widgets/Optimizer;->enabled(II)Z

    move-result v11

    .line 164
    .local v11, "optimizeWrap":Z
    if-nez v11, :cond_1

    const/16 v14, 0x40

    invoke-static {v2, v14}, Landroidx/constraintlayout/solver/widgets/Optimizer;->enabled(II)Z

    move-result v14

    if-eqz v14, :cond_0

    goto :goto_0

    :cond_0
    const/4 v14, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v14, 0x1

    .line 166
    .local v14, "optimize":Z
    :goto_1
    if-eqz v14, :cond_a

    .line 167
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_2
    if-ge v15, v8, :cond_a

    .line 168
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v13, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 169
    .local v13, "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v12

    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v12, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_3

    :cond_2
    const/4 v2, 0x0

    .line 170
    .local v2, "matchWidth":Z
    :goto_3
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v12

    move/from16 v18, v2

    .end local v2    # "matchWidth":Z
    .local v18, "matchWidth":Z
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v12, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_4

    :cond_3
    const/4 v2, 0x0

    .line 171
    .local v2, "matchHeight":Z
    :goto_4
    if-eqz v18, :cond_4

    if-eqz v2, :cond_4

    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionRatio()F

    move-result v12

    const/16 v19, 0x0

    cmpl-float v12, v12, v19

    if-lez v12, :cond_4

    const/4 v12, 0x1

    goto :goto_5

    :cond_4
    const/4 v12, 0x0

    .line 172
    .local v12, "ratio":Z
    :goto_5
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v19

    if-eqz v19, :cond_5

    if-eqz v12, :cond_5

    .line 173
    const/4 v14, 0x0

    .line 174
    goto :goto_7

    .line 176
    :cond_5
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v19

    if-eqz v19, :cond_6

    if-eqz v12, :cond_6

    .line 177
    const/4 v14, 0x0

    .line 178
    goto :goto_7

    .line 180
    :cond_6
    move/from16 v19, v2

    .end local v2    # "matchHeight":Z
    .local v19, "matchHeight":Z
    instance-of v2, v13, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v2, :cond_7

    .line 181
    const/4 v14, 0x0

    .line 182
    goto :goto_7

    .line 184
    :cond_7
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v2

    if-nez v2, :cond_9

    .line 185
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_6

    .line 167
    .end local v12    # "ratio":Z
    .end local v13    # "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v18    # "matchWidth":Z
    .end local v19    # "matchHeight":Z
    :cond_8
    add-int/lit8 v15, v15, 0x1

    move/from16 v2, p2

    goto :goto_2

    .line 186
    .restart local v12    # "ratio":Z
    .restart local v13    # "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v18    # "matchWidth":Z
    .restart local v19    # "matchHeight":Z
    :cond_9
    :goto_6
    const/4 v14, 0x0

    .line 187
    nop

    .line 192
    .end local v12    # "ratio":Z
    .end local v13    # "child":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v15    # "i":I
    .end local v18    # "matchWidth":Z
    .end local v19    # "matchHeight":Z
    :cond_a
    :goto_7
    if-eqz v14, :cond_b

    sget-object v2, Landroidx/constraintlayout/solver/LinearSystem;->sMetrics:Landroidx/constraintlayout/solver/Metrics;

    if-eqz v2, :cond_b

    .line 193
    sget-object v2, Landroidx/constraintlayout/solver/LinearSystem;->sMetrics:Landroidx/constraintlayout/solver/Metrics;

    const-wide/16 v18, 0x1

    iget-wide v12, v2, Landroidx/constraintlayout/solver/Metrics;->measures:J

    add-long v12, v12, v18

    iput-wide v12, v2, Landroidx/constraintlayout/solver/Metrics;->measures:J

    goto :goto_8

    .line 192
    :cond_b
    const-wide/16 v18, 0x1

    .line 196
    :goto_8
    const/4 v2, 0x0

    .line 198
    .local v2, "allSolved":Z
    const/high16 v12, 0x40000000    # 2.0f

    if-ne v3, v12, :cond_c

    if-eq v4, v12, :cond_d

    :cond_c
    if-eqz v11, :cond_e

    :cond_d
    const/4 v13, 0x1

    goto :goto_9

    :cond_e
    const/4 v13, 0x0

    :goto_9
    and-int/2addr v13, v14

    .line 200
    .end local v14    # "optimize":Z
    .local v13, "optimize":Z
    const/4 v14, 0x0

    .line 202
    .local v14, "computations":I
    if-eqz v13, :cond_17

    .line 206
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMaxWidth()I

    move-result v15

    move/from16 v12, p6

    invoke-static {v15, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 207
    .end local p6    # "widthSize":I
    .local v12, "widthSize":I
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMaxHeight()I

    move-result v15

    move/from16 v21, v2

    move/from16 v2, p8

    .end local v2    # "allSolved":Z
    .local v21, "allSolved":Z
    invoke-static {v15, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 209
    .end local p8    # "heightSize":I
    .local v2, "heightSize":I
    const/high16 v15, 0x40000000    # 2.0f

    if-ne v3, v15, :cond_f

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v15

    if-eq v15, v12, :cond_f

    .line 210
    invoke-virtual {v1, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 211
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 213
    :cond_f
    const/high16 v15, 0x40000000    # 2.0f

    if-ne v4, v15, :cond_10

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v15

    if-eq v15, v2, :cond_10

    .line 214
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setHeight(I)V

    .line 215
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 217
    :cond_10
    const/high16 v15, 0x40000000    # 2.0f

    if-ne v3, v15, :cond_11

    if-ne v4, v15, :cond_11

    .line 218
    invoke-virtual {v1, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasure(Z)Z

    move-result v15

    .line 219
    .end local v21    # "allSolved":Z
    .local v15, "allSolved":Z
    const/4 v14, 0x2

    move/from16 p6, v2

    move v2, v15

    goto :goto_b

    .line 221
    .end local v15    # "allSolved":Z
    .restart local v21    # "allSolved":Z
    :cond_11
    invoke-virtual {v1, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasureSetup(Z)Z

    move-result v15

    .line 222
    .end local v21    # "allSolved":Z
    .restart local v15    # "allSolved":Z
    move/from16 p6, v2

    const/high16 v2, 0x40000000    # 2.0f

    .end local v2    # "heightSize":I
    .local p6, "heightSize":I
    if-ne v3, v2, :cond_12

    .line 223
    const/4 v2, 0x0

    invoke-virtual {v1, v11, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v17

    and-int v15, v15, v17

    .line 224
    add-int/lit8 v14, v14, 0x1

    goto :goto_a

    .line 222
    :cond_12
    const/4 v2, 0x0

    .line 226
    :goto_a
    const/high16 v2, 0x40000000    # 2.0f

    if-ne v4, v2, :cond_13

    .line 227
    const/4 v2, 0x1

    invoke-virtual {v1, v11, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v21

    and-int v2, v15, v21

    .line 228
    .end local v15    # "allSolved":Z
    .local v2, "allSolved":Z
    add-int/lit8 v14, v14, 0x1

    goto :goto_b

    .line 226
    .end local v2    # "allSolved":Z
    .restart local v15    # "allSolved":Z
    :cond_13
    move v2, v15

    .line 231
    .end local v15    # "allSolved":Z
    .restart local v2    # "allSolved":Z
    :goto_b
    if-eqz v2, :cond_16

    .line 232
    const/high16 v15, 0x40000000    # 2.0f

    move/from16 p8, v2

    if-ne v3, v15, :cond_14

    const/4 v2, 0x1

    goto :goto_c

    :cond_14
    const/4 v2, 0x0

    .end local v2    # "allSolved":Z
    .local p8, "allSolved":Z
    :goto_c
    if-ne v4, v15, :cond_15

    const/4 v15, 0x1

    goto :goto_d

    :cond_15
    const/4 v15, 0x0

    :goto_d
    invoke-virtual {v1, v2, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->updateFromRuns(ZZ)V

    goto :goto_e

    .line 231
    .end local p8    # "allSolved":Z
    .restart local v2    # "allSolved":Z
    :cond_16
    move/from16 p8, v2

    .line 245
    .end local v2    # "allSolved":Z
    .restart local p8    # "allSolved":Z
    :goto_e
    move/from16 v2, p6

    move/from16 v21, p8

    goto :goto_f

    .line 202
    .end local v12    # "widthSize":I
    .restart local v2    # "allSolved":Z
    .local p6, "widthSize":I
    .local p8, "heightSize":I
    :cond_17
    move/from16 v12, p6

    move/from16 v21, v2

    .end local v2    # "allSolved":Z
    .restart local v21    # "allSolved":Z
    move/from16 v2, p8

    .line 245
    .end local p6    # "widthSize":I
    .end local p8    # "heightSize":I
    .local v2, "heightSize":I
    .restart local v12    # "widthSize":I
    :goto_f
    if-eqz v21, :cond_19

    const/4 v15, 0x2

    if-eq v14, v15, :cond_18

    goto :goto_10

    :cond_18
    move/from16 p6, v2

    move-wide/from16 v22, v6

    move/from16 v25, v8

    move/from16 v26, v11

    move/from16 v28, v12

    move/from16 v27, v13

    move/from16 v30, v14

    goto/16 :goto_24

    .line 246
    :cond_19
    :goto_10
    if-lez v8, :cond_1a

    .line 247
    invoke-direct/range {p0 .. p1}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measureChildren(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V

    .line 252
    :cond_1a
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getOptimizationLevel()I

    move-result v15

    .line 255
    .local v15, "optimizations":I
    move/from16 p6, v2

    .end local v2    # "heightSize":I
    .local p6, "heightSize":I
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 258
    .local v2, "sizeDependentWidgetsCount":I
    if-lez v8, :cond_1b

    .line 259
    const-string v3, "First pass"

    invoke-direct {v0, v1, v3, v9, v10}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;II)V

    .line 266
    :cond_1b
    if-lez v2, :cond_36

    .line 267
    const/4 v3, 0x0

    .line 268
    .local v3, "needSolverPass":Z
    move/from16 p8, v3

    .end local v3    # "needSolverPass":Z
    .local p8, "needSolverPass":Z
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_1c

    const/4 v3, 0x1

    goto :goto_11

    :cond_1c
    const/4 v3, 0x0

    .line 270
    .local v3, "containerWrapWidth":Z
    :goto_11
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v4

    move/from16 v20, v3

    .end local v3    # "containerWrapWidth":Z
    .local v20, "containerWrapWidth":Z
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v3, :cond_1d

    const/16 v17, 0x1

    goto :goto_12

    :cond_1d
    const/16 v17, 0x0

    .line 272
    .local v17, "containerWrapHeight":Z
    :goto_12
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v3

    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMinWidth()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 273
    .local v3, "minWidth":I
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v4

    move/from16 v22, v3

    .end local v3    # "minWidth":I
    .local v22, "minWidth":I
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getMinHeight()I

    move-result v3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 278
    .local v3, "minHeight":I
    const/4 v4, 0x0

    move-wide/from16 v33, v6

    move v6, v4

    move/from16 v4, v22

    move-wide/from16 v22, v33

    .local v4, "minWidth":I
    .local v6, "i":I
    .local v22, "layoutTime":J
    :goto_13
    if-ge v6, v2, :cond_24

    .line 279
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 280
    .local v7, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move/from16 v24, v6

    .end local v6    # "i":I
    .local v24, "i":I
    instance-of v6, v7, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-nez v6, :cond_1e

    .line 281
    move/from16 v6, p8

    move/from16 v25, v8

    move/from16 v26, v11

    move/from16 v28, v12

    move/from16 v27, v13

    goto/16 :goto_19

    .line 283
    :cond_1e
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v6

    .line 284
    .local v6, "preWidth":I
    move/from16 v25, v8

    .end local v8    # "childCount":I
    .local v25, "childCount":I
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v8

    .line 285
    .local v8, "preHeight":I
    move/from16 v26, v11

    const/4 v11, 0x1

    .end local v11    # "optimizeWrap":Z
    .local v26, "optimizeWrap":Z
    invoke-direct {v0, v5, v7, v11}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    move-result v27

    or-int v11, p8, v27

    .line 286
    .end local p8    # "needSolverPass":Z
    .local v11, "needSolverPass":Z
    move/from16 p8, v11

    .end local v11    # "needSolverPass":Z
    .restart local p8    # "needSolverPass":Z
    iget-object v11, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    if-eqz v11, :cond_1f

    .line 287
    iget-object v11, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    move/from16 v28, v12

    move/from16 v27, v13

    .end local v12    # "widthSize":I
    .end local v13    # "optimize":Z
    .local v27, "optimize":Z
    .local v28, "widthSize":I
    iget-wide v12, v11, Landroidx/constraintlayout/solver/Metrics;->measuredMatchWidgets:J

    add-long v12, v12, v18

    iput-wide v12, v11, Landroidx/constraintlayout/solver/Metrics;->measuredMatchWidgets:J

    goto :goto_14

    .line 286
    .end local v27    # "optimize":Z
    .end local v28    # "widthSize":I
    .restart local v12    # "widthSize":I
    .restart local v13    # "optimize":Z
    :cond_1f
    move/from16 v28, v12

    move/from16 v27, v13

    .line 289
    .end local v12    # "widthSize":I
    .end local v13    # "optimize":Z
    .restart local v27    # "optimize":Z
    .restart local v28    # "widthSize":I
    :goto_14
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v11

    .line 290
    .local v11, "measuredWidth":I
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    .line 291
    .local v12, "measuredHeight":I
    if-eq v11, v6, :cond_21

    .line 292
    invoke-virtual {v7, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 293
    if-eqz v20, :cond_20

    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v13

    if-le v13, v4, :cond_20

    .line 294
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v13

    move/from16 v29, v6

    .end local v6    # "preWidth":I
    .local v29, "preWidth":I
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 295
    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    add-int/2addr v13, v6

    .line 296
    .local v13, "w":I
    invoke-static {v4, v13}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_15

    .line 293
    .end local v13    # "w":I
    .end local v29    # "preWidth":I
    .restart local v6    # "preWidth":I
    :cond_20
    move/from16 v29, v6

    .line 298
    .end local v6    # "preWidth":I
    .restart local v29    # "preWidth":I
    :goto_15
    const/4 v6, 0x1

    .end local p8    # "needSolverPass":Z
    .local v6, "needSolverPass":Z
    goto :goto_16

    .line 291
    .end local v29    # "preWidth":I
    .local v6, "preWidth":I
    .restart local p8    # "needSolverPass":Z
    :cond_21
    move/from16 v29, v6

    .end local v6    # "preWidth":I
    .restart local v29    # "preWidth":I
    move/from16 v6, p8

    .line 300
    .end local p8    # "needSolverPass":Z
    .local v6, "needSolverPass":Z
    :goto_16
    if-eq v12, v8, :cond_23

    .line 301
    invoke-virtual {v7, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 302
    if-eqz v17, :cond_22

    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v13

    if-le v13, v3, :cond_22

    .line 303
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v13

    move/from16 p8, v4

    .end local v4    # "minWidth":I
    .local p8, "minWidth":I
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 304
    invoke-virtual {v7, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    add-int/2addr v13, v4

    .line 305
    .local v13, "h":I
    invoke-static {v3, v13}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_17

    .line 302
    .end local v13    # "h":I
    .end local p8    # "minWidth":I
    .restart local v4    # "minWidth":I
    :cond_22
    move/from16 p8, v4

    .line 307
    .end local v4    # "minWidth":I
    .restart local p8    # "minWidth":I
    :goto_17
    const/4 v6, 0x1

    goto :goto_18

    .line 300
    .end local p8    # "minWidth":I
    .restart local v4    # "minWidth":I
    :cond_23
    move/from16 p8, v4

    .line 309
    .end local v4    # "minWidth":I
    .restart local p8    # "minWidth":I
    :goto_18
    move-object v4, v7

    check-cast v4, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    .line 310
    .local v4, "virtualLayout":Landroidx/constraintlayout/solver/widgets/VirtualLayout;
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/VirtualLayout;->needSolverPass()Z

    move-result v13

    or-int/2addr v6, v13

    move/from16 v4, p8

    .line 278
    .end local v7    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v8    # "preHeight":I
    .end local v11    # "measuredWidth":I
    .end local v12    # "measuredHeight":I
    .end local v29    # "preWidth":I
    .end local p8    # "minWidth":I
    .local v4, "minWidth":I
    :goto_19
    add-int/lit8 v7, v24, 0x1

    move/from16 p8, v6

    move v6, v7

    move/from16 v8, v25

    move/from16 v11, v26

    move/from16 v13, v27

    move/from16 v12, v28

    .end local v24    # "i":I
    .local v7, "i":I
    goto/16 :goto_13

    .end local v7    # "i":I
    .end local v25    # "childCount":I
    .end local v26    # "optimizeWrap":Z
    .end local v27    # "optimize":Z
    .end local v28    # "widthSize":I
    .local v6, "i":I
    .local v8, "childCount":I
    .local v11, "optimizeWrap":Z
    .local v12, "widthSize":I
    .local v13, "optimize":Z
    .local p8, "needSolverPass":Z
    :cond_24
    move/from16 v24, v6

    move/from16 v25, v8

    move/from16 v26, v11

    move/from16 v28, v12

    move/from16 v27, v13

    .line 314
    .end local v6    # "i":I
    .end local v8    # "childCount":I
    .end local v11    # "optimizeWrap":Z
    .end local v12    # "widthSize":I
    .end local v13    # "optimize":Z
    .restart local v25    # "childCount":I
    .restart local v26    # "optimizeWrap":Z
    .restart local v27    # "optimize":Z
    .restart local v28    # "widthSize":I
    const/4 v6, 0x2

    .line 315
    .local v6, "maxIterations":I
    const/4 v7, 0x0

    move v8, v7

    move v7, v4

    move v4, v3

    move/from16 v3, p8

    .end local p8    # "needSolverPass":Z
    .local v3, "needSolverPass":Z
    .local v4, "minHeight":I
    .local v7, "minWidth":I
    .local v8, "j":I
    :goto_1a
    if-ge v8, v6, :cond_33

    .line 316
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1b
    if-ge v11, v2, :cond_31

    .line 317
    iget-object v12, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v12, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 318
    .local v12, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    instance-of v13, v12, Landroidx/constraintlayout/solver/widgets/Helper;

    if-eqz v13, :cond_26

    instance-of v13, v12, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v13, :cond_25

    goto :goto_1c

    :cond_25
    move/from16 p8, v2

    goto :goto_1d

    :cond_26
    :goto_1c
    instance-of v13, v12, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v13, :cond_27

    .line 319
    move/from16 p8, v2

    goto :goto_1d

    .line 321
    :cond_27
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v13

    move/from16 p8, v2

    .end local v2    # "sizeDependentWidgetsCount":I
    .local p8, "sizeDependentWidgetsCount":I
    const/16 v2, 0x8

    if-ne v13, v2, :cond_28

    .line 322
    goto :goto_1d

    .line 324
    :cond_28
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v2, :cond_29

    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolved:Z

    if-eqz v2, :cond_29

    .line 325
    goto :goto_1d

    .line 327
    :cond_29
    instance-of v2, v12, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v2, :cond_2a

    .line 328
    nop

    .line 316
    .end local v12    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local p8    # "sizeDependentWidgetsCount":I
    .restart local v2    # "sizeDependentWidgetsCount":I
    :goto_1d
    move/from16 v29, v6

    move/from16 v30, v14

    move/from16 v31, v15

    .end local v2    # "sizeDependentWidgetsCount":I
    .restart local p8    # "sizeDependentWidgetsCount":I
    goto/16 :goto_21

    .line 331
    .restart local v12    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_2a
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v2

    .line 332
    .local v2, "preWidth":I
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v13

    .line 333
    .local v13, "preHeight":I
    move/from16 v24, v3

    .end local v3    # "needSolverPass":Z
    .local v24, "needSolverPass":Z
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBaselineDistance()I

    move-result v3

    .line 335
    .local v3, "preBaselineDistance":I
    move/from16 v29, v6

    const/4 v6, 0x1

    .end local v6    # "maxIterations":I
    .local v29, "maxIterations":I
    invoke-direct {v0, v5, v12, v6}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    move-result v16

    or-int v16, v24, v16

    .line 336
    .end local v24    # "needSolverPass":Z
    .local v16, "needSolverPass":Z
    iget-object v6, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    if-eqz v6, :cond_2b

    .line 337
    iget-object v6, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMetrics:Landroidx/constraintlayout/solver/Metrics;

    move/from16 v30, v14

    move/from16 v31, v15

    .end local v14    # "computations":I
    .end local v15    # "optimizations":I
    .local v30, "computations":I
    .local v31, "optimizations":I
    iget-wide v14, v6, Landroidx/constraintlayout/solver/Metrics;->measuredMatchWidgets:J

    add-long v14, v14, v18

    iput-wide v14, v6, Landroidx/constraintlayout/solver/Metrics;->measuredMatchWidgets:J

    goto :goto_1e

    .line 336
    .end local v30    # "computations":I
    .end local v31    # "optimizations":I
    .restart local v14    # "computations":I
    .restart local v15    # "optimizations":I
    :cond_2b
    move/from16 v30, v14

    move/from16 v31, v15

    .line 340
    .end local v14    # "computations":I
    .end local v15    # "optimizations":I
    .restart local v30    # "computations":I
    .restart local v31    # "optimizations":I
    :goto_1e
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v6

    .line 341
    .local v6, "measuredWidth":I
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v14

    .line 343
    .local v14, "measuredHeight":I
    if-eq v6, v2, :cond_2d

    .line 344
    invoke-virtual {v12, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 345
    if-eqz v20, :cond_2c

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v15

    if-le v15, v7, :cond_2c

    .line 346
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v15

    move/from16 v32, v2

    .end local v2    # "preWidth":I
    .local v32, "preWidth":I
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 347
    invoke-virtual {v12, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v15, v2

    .line 348
    .local v15, "w":I
    invoke-static {v7, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_1f

    .line 345
    .end local v15    # "w":I
    .end local v32    # "preWidth":I
    .restart local v2    # "preWidth":I
    :cond_2c
    move/from16 v32, v2

    .line 350
    .end local v2    # "preWidth":I
    .restart local v32    # "preWidth":I
    :goto_1f
    const/16 v16, 0x1

    goto :goto_20

    .line 343
    .end local v32    # "preWidth":I
    .restart local v2    # "preWidth":I
    :cond_2d
    move/from16 v32, v2

    .line 352
    .end local v2    # "preWidth":I
    .restart local v32    # "preWidth":I
    :goto_20
    if-eq v14, v13, :cond_2f

    .line 353
    invoke-virtual {v12, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 354
    if-eqz v17, :cond_2e

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v2

    if-le v2, v4, :cond_2e

    .line 355
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v2

    sget-object v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 356
    invoke-virtual {v12, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v15

    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v15

    add-int/2addr v2, v15

    .line 357
    .local v2, "h":I
    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 359
    .end local v2    # "h":I
    :cond_2e
    const/16 v16, 0x1

    .line 361
    :cond_2f
    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline()Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBaselineDistance()I

    move-result v2

    if-eq v3, v2, :cond_30

    .line 362
    const/4 v2, 0x1

    move v3, v2

    .end local v16    # "needSolverPass":Z
    .local v2, "needSolverPass":Z
    goto :goto_21

    .line 316
    .end local v2    # "needSolverPass":Z
    .end local v3    # "preBaselineDistance":I
    .end local v6    # "measuredWidth":I
    .end local v12    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v13    # "preHeight":I
    .end local v14    # "measuredHeight":I
    .end local v32    # "preWidth":I
    .restart local v16    # "needSolverPass":Z
    :cond_30
    move/from16 v3, v16

    .end local v16    # "needSolverPass":Z
    .local v3, "needSolverPass":Z
    :goto_21
    add-int/lit8 v11, v11, 0x1

    move/from16 v2, p8

    move/from16 v6, v29

    move/from16 v14, v30

    move/from16 v15, v31

    goto/16 :goto_1b

    .end local v29    # "maxIterations":I
    .end local v30    # "computations":I
    .end local v31    # "optimizations":I
    .end local p8    # "sizeDependentWidgetsCount":I
    .local v2, "sizeDependentWidgetsCount":I
    .local v6, "maxIterations":I
    .local v14, "computations":I
    .local v15, "optimizations":I
    :cond_31
    move/from16 p8, v2

    move/from16 v24, v3

    move/from16 v29, v6

    move/from16 v30, v14

    move/from16 v31, v15

    .line 365
    .end local v2    # "sizeDependentWidgetsCount":I
    .end local v3    # "needSolverPass":Z
    .end local v6    # "maxIterations":I
    .end local v11    # "i":I
    .end local v14    # "computations":I
    .end local v15    # "optimizations":I
    .restart local v24    # "needSolverPass":Z
    .restart local v29    # "maxIterations":I
    .restart local v30    # "computations":I
    .restart local v31    # "optimizations":I
    .restart local p8    # "sizeDependentWidgetsCount":I
    if-eqz v24, :cond_32

    .line 366
    const-string v2, "intermediate pass"

    invoke-direct {v0, v1, v2, v9, v10}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;II)V

    .line 367
    const/4 v2, 0x0

    move v3, v2

    .end local v24    # "needSolverPass":Z
    .local v2, "needSolverPass":Z
    goto :goto_22

    .line 365
    .end local v2    # "needSolverPass":Z
    .restart local v24    # "needSolverPass":Z
    :cond_32
    move/from16 v3, v24

    .line 315
    .end local v24    # "needSolverPass":Z
    .restart local v3    # "needSolverPass":Z
    :goto_22
    add-int/lit8 v8, v8, 0x1

    move/from16 v2, p8

    move/from16 v6, v29

    move/from16 v14, v30

    move/from16 v15, v31

    goto/16 :goto_1a

    .end local v29    # "maxIterations":I
    .end local v30    # "computations":I
    .end local v31    # "optimizations":I
    .end local p8    # "sizeDependentWidgetsCount":I
    .local v2, "sizeDependentWidgetsCount":I
    .restart local v6    # "maxIterations":I
    .restart local v14    # "computations":I
    .restart local v15    # "optimizations":I
    :cond_33
    move/from16 p8, v2

    move/from16 v29, v6

    move/from16 v30, v14

    move/from16 v31, v15

    .line 370
    .end local v2    # "sizeDependentWidgetsCount":I
    .end local v6    # "maxIterations":I
    .end local v8    # "j":I
    .end local v14    # "computations":I
    .end local v15    # "optimizations":I
    .restart local v29    # "maxIterations":I
    .restart local v30    # "computations":I
    .restart local v31    # "optimizations":I
    .restart local p8    # "sizeDependentWidgetsCount":I
    if-eqz v3, :cond_37

    .line 371
    const-string v2, "2nd pass"

    invoke-direct {v0, v1, v2, v9, v10}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;II)V

    .line 372
    const/4 v2, 0x0

    .line 373
    .end local v3    # "needSolverPass":Z
    .local v2, "needSolverPass":Z
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v3

    if-ge v3, v7, :cond_34

    .line 374
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 375
    const/4 v2, 0x1

    .line 377
    :cond_34
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v3

    if-ge v3, v4, :cond_35

    .line 378
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setHeight(I)V

    .line 379
    const/4 v2, 0x1

    .line 381
    :cond_35
    if-eqz v2, :cond_37

    .line 382
    const-string v3, "3rd pass"

    invoke-direct {v0, v1, v3, v9, v10}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;II)V

    goto :goto_23

    .line 266
    .end local v4    # "minHeight":I
    .end local v7    # "minWidth":I
    .end local v17    # "containerWrapHeight":Z
    .end local v20    # "containerWrapWidth":Z
    .end local v22    # "layoutTime":J
    .end local v25    # "childCount":I
    .end local v26    # "optimizeWrap":Z
    .end local v27    # "optimize":Z
    .end local v28    # "widthSize":I
    .end local v29    # "maxIterations":I
    .end local v30    # "computations":I
    .end local v31    # "optimizations":I
    .end local p8    # "sizeDependentWidgetsCount":I
    .local v2, "sizeDependentWidgetsCount":I
    .local v6, "layoutTime":J
    .local v8, "childCount":I
    .local v11, "optimizeWrap":Z
    .local v12, "widthSize":I
    .local v13, "optimize":Z
    .restart local v14    # "computations":I
    .restart local v15    # "optimizations":I
    :cond_36
    move/from16 p8, v2

    move-wide/from16 v22, v6

    move/from16 v25, v8

    move/from16 v26, v11

    move/from16 v28, v12

    move/from16 v27, v13

    move/from16 v30, v14

    move/from16 v31, v15

    .line 386
    .end local v2    # "sizeDependentWidgetsCount":I
    .end local v6    # "layoutTime":J
    .end local v8    # "childCount":I
    .end local v11    # "optimizeWrap":Z
    .end local v12    # "widthSize":I
    .end local v13    # "optimize":Z
    .end local v14    # "computations":I
    .end local v15    # "optimizations":I
    .restart local v22    # "layoutTime":J
    .restart local v25    # "childCount":I
    .restart local v26    # "optimizeWrap":Z
    .restart local v27    # "optimize":Z
    .restart local v28    # "widthSize":I
    .restart local v30    # "computations":I
    .restart local v31    # "optimizations":I
    .restart local p8    # "sizeDependentWidgetsCount":I
    :cond_37
    :goto_23
    move/from16 v2, v31

    .end local v31    # "optimizations":I
    .local v2, "optimizations":I
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->setOptimizationLevel(I)V

    .line 391
    .end local v2    # "optimizations":I
    .end local p8    # "sizeDependentWidgetsCount":I
    :goto_24
    return-wide v22
.end method

.method public updateHierarchy(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .locals 5
    .param p1, "layout"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 54
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 55
    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 56
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 57
    iget-object v2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 58
    .local v2, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v3, v4, :cond_0

    .line 59
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v3, v4, :cond_0

    .line 60
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v3, v4, :cond_0

    .line 61
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour()Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-result-object v3

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_1

    .line 62
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 65
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 66
    return-void
.end method
