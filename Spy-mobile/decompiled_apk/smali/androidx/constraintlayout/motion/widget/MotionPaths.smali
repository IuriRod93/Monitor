.class Landroidx/constraintlayout/motion/widget/MotionPaths;
.super Ljava/lang/Object;
.source "MotionPaths.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Landroidx/constraintlayout/motion/widget/MotionPaths;",
        ">;"
    }
.end annotation


# static fields
.field static final CARTESIAN:I = 0x2

.field public static final DEBUG:Z = false

.field static final OFF_HEIGHT:I = 0x4

.field static final OFF_PATH_ROTATE:I = 0x5

.field static final OFF_POSITION:I = 0x0

.field static final OFF_WIDTH:I = 0x3

.field static final OFF_X:I = 0x1

.field static final OFF_Y:I = 0x2

.field public static final OLD_WAY:Z = false

.field static final PERPENDICULAR:I = 0x1

.field static final SCREEN:I = 0x3

.field public static final TAG:Ljava/lang/String; = "MotionPaths"

.field static names:[Ljava/lang/String;


# instance fields
.field attributes:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/widget/ConstraintAttribute;",
            ">;"
        }
    .end annotation
.end field

.field height:F

.field mDrawPath:I

.field mKeyFrameEasing:Landroidx/constraintlayout/motion/utils/Easing;

.field mMode:I

.field mPathMotionArc:I

.field mPathRotate:F

.field mProgress:F

.field mTempDelta:[D

.field mTempValue:[D

.field position:F

.field time:F

.field width:F

.field x:F

.field y:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 52
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "position"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "x"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "y"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "width"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "height"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "pathRotate"

    aput-object v2, v0, v1

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->names:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 61
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 62
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 63
    sget v1, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 65
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    .line 66
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 308
    const/16 v0, 0x12

    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 309
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    .line 70
    return-void
.end method

.method public constructor <init>(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 2
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p4, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p5, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 61
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 62
    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 63
    sget v1, Landroidx/constraintlayout/motion/widget/Key;->UNSET:I

    iput v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 65
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    .line 66
    iput v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 308
    const/16 v0, 0x12

    new-array v1, v0, [D

    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 309
    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    .line 125
    iget v0, p3, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPositionType:I

    packed-switch v0, :pswitch_data_0

    .line 134
    move-object v0, p5

    move-object p5, p4

    move-object p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "parentWidth":I
    .local v0, "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .local p2, "parentWidth":I
    .local p3, "parentHeight":I
    .local p4, "c":Landroidx/constraintlayout/motion/widget/KeyPosition;
    .local p5, "startTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    invoke-virtual {p0, p4, p5, v0}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initCartesian(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 135
    return-void

    .line 127
    .end local v0    # "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .restart local p1    # "parentWidth":I
    .local p2, "parentHeight":I
    .local p3, "c":Landroidx/constraintlayout/motion/widget/KeyPosition;
    .local p4, "startTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .local p5, "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    :pswitch_0
    invoke-virtual/range {p0 .. p5}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initScreen(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 128
    move-object v0, p5

    move-object p5, p4

    move-object p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "parentWidth":I
    .restart local v0    # "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .local p2, "parentWidth":I
    .local p3, "parentHeight":I
    .local p4, "c":Landroidx/constraintlayout/motion/widget/KeyPosition;
    .local p5, "startTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    return-void

    .line 130
    .end local v0    # "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .restart local p1    # "parentWidth":I
    .local p2, "parentHeight":I
    .local p3, "c":Landroidx/constraintlayout/motion/widget/KeyPosition;
    .local p4, "startTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .local p5, "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    :pswitch_1
    move-object v0, p5

    move-object p5, p4

    move-object p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "parentWidth":I
    .restart local v0    # "endTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    .local p2, "parentWidth":I
    .local p3, "parentHeight":I
    .local p4, "c":Landroidx/constraintlayout/motion/widget/KeyPosition;
    .local p5, "startTimePoint":Landroidx/constraintlayout/motion/widget/MotionPaths;
    invoke-virtual {p0, p4, p5, v0}, Landroidx/constraintlayout/motion/widget/MotionPaths;->initPath(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V

    .line 131
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private diff(FF)Z
    .locals 4
    .param p1, "a"    # F
    .param p2, "b"    # F

    .line 236
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 239
    :cond_0
    sub-float v0, p1, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v3, 0x358637bd    # 1.0E-6f

    cmpl-float v0, v0, v3

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    return v1

    .line 237
    :cond_2
    :goto_1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eq v0, v3, :cond_3

    goto :goto_2

    :cond_3
    move v1, v2

    :goto_2
    return v1
.end method

.method private static final xRotate(FFFFFF)F
    .locals 2
    .param p0, "sin"    # F
    .param p1, "cos"    # F
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 224
    sub-float/2addr p4, p2

    .line 225
    sub-float/2addr p5, p3

    .line 226
    mul-float v0, p4, p1

    mul-float v1, p5, p0

    sub-float/2addr v0, v1

    add-float/2addr v0, p2

    return v0
.end method

.method private static final yRotate(FFFFFF)F
    .locals 2
    .param p0, "sin"    # F
    .param p1, "cos"    # F
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 230
    sub-float/2addr p4, p2

    .line 231
    sub-float/2addr p5, p3

    .line 232
    mul-float v0, p4, p0

    mul-float v1, p5, p1

    add-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method


# virtual methods
.method public applyParameters(Landroidx/constraintlayout/widget/ConstraintSet$Constraint;)V
    .locals 7
    .param p1, "c"    # Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    .line 680
    move-object v0, p0

    .line 681
    .local v0, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget-object v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v1}, Landroidx/constraintlayout/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/Easing;

    move-result-object v1

    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/motion/utils/Easing;

    .line 682
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mPathMotionArc:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 683
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mPathRotate:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    .line 684
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->motion:Landroidx/constraintlayout/widget/ConstraintSet$Motion;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Motion;->mDrawPath:I

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 685
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->propertySet:Landroidx/constraintlayout/widget/ConstraintSet$PropertySet;

    iget v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$PropertySet;->mProgress:F

    iput v1, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mProgress:F

    .line 686
    iget-object v1, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->mCustomConstraints:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 687
    .local v1, "at":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 688
    .local v3, "s":Ljava/lang/String;
    iget-object v4, p1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->mCustomConstraints:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintAttribute;

    .line 689
    .local v4, "attr":Landroidx/constraintlayout/widget/ConstraintAttribute;
    invoke-virtual {v4}, Landroidx/constraintlayout/widget/ConstraintAttribute;->getType()Landroidx/constraintlayout/widget/ConstraintAttribute$AttributeType;

    move-result-object v5

    sget-object v6, Landroidx/constraintlayout/widget/ConstraintAttribute$AttributeType;->STRING_TYPE:Landroidx/constraintlayout/widget/ConstraintAttribute$AttributeType;

    if-eq v5, v6, :cond_0

    .line 690
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "attr":Landroidx/constraintlayout/widget/ConstraintAttribute;
    :cond_0
    goto :goto_0

    .line 693
    :cond_1
    return-void
.end method

.method public compareTo(Landroidx/constraintlayout/motion/widget/MotionPaths;)I
    .locals 2
    .param p1, "o"    # Landroidx/constraintlayout/motion/widget/MotionPaths;

    .line 676
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    iget v1, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 38
    check-cast p1, Landroidx/constraintlayout/motion/widget/MotionPaths;

    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/MotionPaths;->compareTo(Landroidx/constraintlayout/motion/widget/MotionPaths;)I

    move-result p1

    return p1
.end method

.method different(Landroidx/constraintlayout/motion/widget/MotionPaths;[Z[Ljava/lang/String;Z)V
    .locals 5
    .param p1, "points"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p2, "mask"    # [Z
    .param p3, "custom"    # [Ljava/lang/String;
    .param p4, "arcMode"    # Z

    .line 243
    const/4 v0, 0x0

    .line 244
    .local v0, "c":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    aget-boolean v2, p2, v0

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    iget v4, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v3

    or-int/2addr v2, v3

    aput-boolean v2, p2, v0

    .line 245
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    aget-boolean v2, p2, v1

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v4, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v3

    or-int/2addr v3, p4

    or-int/2addr v2, v3

    aput-boolean v2, p2, v1

    .line 246
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .restart local v1    # "c":I
    aget-boolean v2, p2, v0

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v4, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v3

    or-int/2addr v3, p4

    or-int/2addr v2, v3

    aput-boolean v2, p2, v0

    .line 247
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    aget-boolean v2, p2, v1

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v4, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v3

    or-int/2addr v2, v3

    aput-boolean v2, p2, v1

    .line 248
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .restart local v1    # "c":I
    aget-boolean v2, p2, v0

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v4, p1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    invoke-direct {p0, v3, v4}, Landroidx/constraintlayout/motion/widget/MotionPaths;->diff(FF)Z

    move-result v3

    or-int/2addr v2, v3

    aput-boolean v2, p2, v0

    .line 250
    return-void
.end method

.method fillStandard([D[I)V
    .locals 8
    .param p1, "data"    # [D
    .param p2, "toUse"    # [I

    .line 634
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v5, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathRotate:F

    const/4 v6, 0x6

    new-array v6, v6, [F

    const/4 v7, 0x0

    aput v0, v6, v7

    const/4 v0, 0x1

    aput v1, v6, v0

    const/4 v0, 0x2

    aput v2, v6, v0

    const/4 v0, 0x3

    aput v3, v6, v0

    const/4 v0, 0x4

    aput v4, v6, v0

    const/4 v0, 0x5

    aput v5, v6, v0

    .line 635
    .local v6, "set":[F
    const/4 v0, 0x0

    .line 636
    .local v0, "c":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 637
    aget v2, p2, v1

    array-length v3, v6

    if-ge v2, v3, :cond_0

    .line 638
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "c":I
    .local v2, "c":I
    aget v3, p2, v1

    aget v3, v6, v3

    float-to-double v3, v3

    aput-wide v3, p1, v0

    move v0, v2

    .line 636
    .end local v2    # "c":I
    .restart local v0    # "c":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 641
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method getBounds([I[D[FI)V
    .locals 9
    .param p1, "toUse"    # [I
    .param p2, "data"    # [D
    .param p3, "point"    # [F
    .param p4, "offset"    # I

    .line 281
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 282
    .local v0, "v_x":F
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 283
    .local v1, "v_y":F
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 284
    .local v2, "v_width":F
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 285
    .local v3, "v_height":F
    const/4 v4, 0x0

    .local v4, "translationX":F
    const/4 v5, 0x0

    .line 286
    .local v5, "translationY":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v7, p1

    if-ge v6, v7, :cond_0

    .line 287
    aget-wide v7, p2, v6

    double-to-float v7, v7

    .line 289
    .local v7, "value":F
    aget v8, p1, v6

    packed-switch v8, :pswitch_data_0

    goto :goto_1

    .line 300
    :pswitch_0
    move v3, v7

    goto :goto_1

    .line 297
    :pswitch_1
    move v2, v7

    .line 298
    goto :goto_1

    .line 294
    :pswitch_2
    move v1, v7

    .line 295
    goto :goto_1

    .line 291
    :pswitch_3
    move v0, v7

    .line 292
    nop

    .line 286
    .end local v7    # "value":F
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 304
    .end local v6    # "i":I
    :cond_0
    aput v2, p3, p4

    .line 305
    add-int/lit8 v6, p4, 0x1

    aput v3, p3, v6

    .line 306
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCenter([I[D[FI)V
    .locals 9
    .param p1, "toUse"    # [I
    .param p2, "data"    # [D
    .param p3, "point"    # [F
    .param p4, "offset"    # I

    .line 253
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 254
    .local v0, "v_x":F
    iget v1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 255
    .local v1, "v_y":F
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 256
    .local v2, "v_width":F
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 257
    .local v3, "v_height":F
    const/4 v4, 0x0

    .local v4, "translationX":F
    const/4 v5, 0x0

    .line 258
    .local v5, "translationY":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v7, p1

    if-ge v6, v7, :cond_0

    .line 259
    aget-wide v7, p2, v6

    double-to-float v7, v7

    .line 261
    .local v7, "value":F
    aget v8, p1, v6

    packed-switch v8, :pswitch_data_0

    goto :goto_1

    .line 272
    :pswitch_0
    move v3, v7

    goto :goto_1

    .line 269
    :pswitch_1
    move v2, v7

    .line 270
    goto :goto_1

    .line 266
    :pswitch_2
    move v1, v7

    .line 267
    goto :goto_1

    .line 263
    :pswitch_3
    move v0, v7

    .line 264
    nop

    .line 258
    .end local v7    # "value":F
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 276
    .end local v6    # "i":I
    :cond_0
    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, v2, v6

    add-float/2addr v7, v0

    add-float/2addr v7, v4

    aput v7, p3, p4

    .line 277
    add-int/lit8 v7, p4, 0x1

    div-float v6, v3, v6

    add-float/2addr v6, v1

    add-float/2addr v6, v5

    aput v6, p3, v7

    .line 278
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getCustomData(Ljava/lang/String;[DI)I
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [D
    .param p3, "offset"    # I

    .line 652
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintAttribute;

    .line 653
    .local v0, "a":Landroidx/constraintlayout/widget/ConstraintAttribute;
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->noOfInterpValues()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 654
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->getValueToInterpolate()F

    move-result v1

    float-to-double v3, v1

    aput-wide v3, p2, p3

    .line 655
    return v2

    .line 657
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->noOfInterpValues()I

    move-result v1

    .line 658
    .local v1, "N":I
    new-array v2, v1, [F

    .line 659
    .local v2, "f":[F
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/widget/ConstraintAttribute;->getValuesToInterpolate([F)V

    .line 660
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 661
    add-int/lit8 v4, p3, 0x1

    .end local p3    # "offset":I
    .local v4, "offset":I
    aget v5, v2, v3

    float-to-double v5, v5

    aput-wide v5, p2, p3

    .line 660
    add-int/lit8 v3, v3, 0x1

    move p3, v4

    goto :goto_0

    .line 663
    .end local v3    # "i":I
    .end local v4    # "offset":I
    .restart local p3    # "offset":I
    :cond_1
    return v1
.end method

.method getCustomDataCount(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 648
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintAttribute;

    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintAttribute;->noOfInterpValues()I

    move-result v0

    return v0
.end method

.method getRect([I[D[FI)V
    .locals 35
    .param p1, "toUse"    # [I
    .param p2, "data"    # [D
    .param p3, "path"    # [F
    .param p4, "offset"    # I

    .line 432
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 433
    .local v2, "v_x":F
    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 434
    .local v3, "v_y":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 435
    .local v4, "v_width":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 436
    .local v5, "v_height":F
    const/4 v6, 0x0

    .line 437
    .local v6, "delta_path":F
    const/4 v7, 0x0

    .line 438
    .local v7, "rotation":F
    const/4 v8, 0x0

    .line 439
    .local v8, "alpha":F
    const/4 v9, 0x0

    .line 440
    .local v9, "rotationX":F
    const/4 v10, 0x0

    .line 441
    .local v10, "rotationY":F
    const/high16 v11, 0x3f800000    # 1.0f

    .line 442
    .local v11, "scaleX":F
    const/high16 v12, 0x3f800000    # 1.0f

    .line 443
    .local v12, "scaleY":F
    const/high16 v13, 0x7fc00000    # Float.NaN

    .line 444
    .local v13, "pivotX":F
    const/high16 v14, 0x7fc00000    # Float.NaN

    .line 445
    .local v14, "pivotY":F
    const/4 v15, 0x0

    .line 446
    .local v15, "translationX":F
    const/16 v16, 0x0

    .line 450
    .local v16, "translationY":F
    const/16 v17, 0x0

    move/from16 v0, v17

    .local v0, "i":I
    :goto_0
    move/from16 v17, v2

    .end local v2    # "v_x":F
    .local v17, "v_x":F
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 451
    move v2, v0

    .end local v0    # "i":I
    .local v2, "i":I
    aget-wide v0, p2, v2

    double-to-float v0, v0

    .line 453
    .local v0, "value":F
    aget v1, p1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 467
    :pswitch_0
    move v1, v0

    move v5, v1

    .end local v5    # "v_height":F
    .local v1, "v_height":F
    goto :goto_1

    .line 464
    .end local v1    # "v_height":F
    .restart local v5    # "v_height":F
    :pswitch_1
    move v1, v0

    .line 465
    .end local v4    # "v_width":F
    .local v1, "v_width":F
    move v4, v1

    goto :goto_1

    .line 461
    .end local v1    # "v_width":F
    .restart local v4    # "v_width":F
    :pswitch_2
    move v1, v0

    .line 462
    .end local v3    # "v_y":F
    .local v1, "v_y":F
    move v3, v1

    goto :goto_1

    .line 458
    .end local v1    # "v_y":F
    .restart local v3    # "v_y":F
    :pswitch_3
    move v1, v0

    .line 459
    .end local v17    # "v_x":F
    .local v1, "v_x":F
    move/from16 v17, v1

    goto :goto_1

    .line 455
    .end local v1    # "v_x":F
    .restart local v17    # "v_x":F
    :pswitch_4
    move v1, v0

    .line 456
    .end local v6    # "delta_path":F
    .local v1, "delta_path":F
    move v6, v1

    .line 450
    .end local v0    # "value":F
    .end local v1    # "delta_path":F
    .restart local v6    # "delta_path":F
    :goto_1
    add-int/lit8 v0, v2, 0x1

    move-object/from16 v1, p1

    move/from16 v2, v17

    .end local v2    # "i":I
    .local v0, "i":I
    goto :goto_0

    :cond_0
    move v2, v0

    .line 471
    .end local v0    # "i":I
    move/from16 v0, v17

    .line 472
    .local v0, "x1":F
    move v1, v3

    .line 474
    .local v1, "y1":F
    add-float v2, v17, v4

    .line 475
    .local v2, "x2":F
    move/from16 v18, v1

    .line 477
    .local v18, "y2":F
    move/from16 v19, v2

    .line 478
    .local v19, "x3":F
    add-float v20, v3, v5

    .line 480
    .local v20, "y3":F
    move/from16 v21, v0

    .line 481
    .local v21, "x4":F
    move/from16 v22, v20

    .line 483
    .local v22, "y4":F
    const/high16 v23, 0x40000000    # 2.0f

    div-float v24, v4, v23

    add-float v24, v0, v24

    .line 484
    .local v24, "cx":F
    div-float v25, v5, v23

    add-float v25, v1, v25

    .line 486
    .local v25, "cy":F
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    move-result v26

    if-nez v26, :cond_1

    .line 487
    sub-float v26, v2, v0

    mul-float v26, v26, v13

    add-float v24, v0, v26

    move/from16 v28, v24

    goto :goto_2

    .line 486
    :cond_1
    move/from16 v28, v24

    .line 489
    .end local v24    # "cx":F
    .local v28, "cx":F
    :goto_2
    invoke-static {v14}, Ljava/lang/Float;->isNaN(F)Z

    move-result v24

    if-nez v24, :cond_2

    .line 491
    sub-float v24, v20, v1

    mul-float v24, v24, v14

    add-float v25, v1, v24

    move/from16 v29, v25

    goto :goto_3

    .line 489
    :cond_2
    move/from16 v29, v25

    .line 493
    .end local v25    # "cy":F
    .local v29, "cy":F
    :goto_3
    const/high16 v24, 0x3f800000    # 1.0f

    cmpl-float v25, v11, v24

    if-eqz v25, :cond_3

    .line 494
    add-float v25, v0, v2

    div-float v25, v25, v23

    .line 495
    .local v25, "midx":F
    sub-float v26, v0, v25

    mul-float v26, v26, v11

    add-float v0, v26, v25

    .line 496
    sub-float v26, v2, v25

    mul-float v26, v26, v11

    add-float v2, v26, v25

    .line 497
    sub-float v26, v19, v25

    mul-float v26, v26, v11

    add-float v19, v26, v25

    .line 498
    sub-float v26, v21, v25

    mul-float v26, v26, v11

    add-float v21, v26, v25

    move/from16 v30, v0

    goto :goto_4

    .line 493
    .end local v25    # "midx":F
    :cond_3
    move/from16 v30, v0

    .line 500
    .end local v0    # "x1":F
    .local v30, "x1":F
    :goto_4
    cmpl-float v0, v12, v24

    if-eqz v0, :cond_4

    .line 501
    add-float v0, v1, v20

    div-float v0, v0, v23

    .line 502
    .local v0, "midy":F
    sub-float v23, v1, v0

    mul-float v23, v23, v12

    add-float v1, v23, v0

    .line 503
    sub-float v23, v18, v0

    mul-float v23, v23, v12

    add-float v18, v23, v0

    .line 504
    sub-float v23, v20, v0

    mul-float v23, v23, v12

    add-float v20, v23, v0

    .line 505
    sub-float v23, v22, v0

    mul-float v23, v23, v12

    add-float v22, v23, v0

    move/from16 v31, v1

    goto :goto_5

    .line 500
    .end local v0    # "midy":F
    :cond_4
    move/from16 v31, v1

    .line 507
    .end local v1    # "y1":F
    .local v31, "y1":F
    :goto_5
    const/4 v0, 0x0

    cmpl-float v0, v7, v0

    if-eqz v0, :cond_5

    .line 508
    float-to-double v0, v7

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 509
    .local v0, "sin":F
    move/from16 v26, v0

    .end local v0    # "sin":F
    .local v26, "sin":F
    float-to-double v0, v7

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 510
    .local v0, "cos":F
    move/from16 v27, v0

    .end local v0    # "cos":F
    .local v27, "cos":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v0

    .line 511
    .local v0, "tx1":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v1

    .line 512
    move/from16 v23, v30

    move/from16 v24, v31

    .end local v30    # "x1":F
    .end local v31    # "y1":F
    .local v1, "ty1":F
    .local v23, "x1":F
    .local v24, "y1":F
    move/from16 v30, v2

    move/from16 v31, v18

    .end local v2    # "x2":F
    .end local v18    # "y2":F
    .local v30, "x2":F
    .local v31, "y2":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v2

    .line 513
    .local v2, "tx2":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v18

    .line 514
    move/from16 v25, v30

    move/from16 v32, v31

    .end local v30    # "x2":F
    .end local v31    # "y2":F
    .local v18, "ty2":F
    .local v25, "x2":F
    .local v32, "y2":F
    move/from16 v30, v19

    move/from16 v31, v20

    .end local v19    # "x3":F
    .end local v20    # "y3":F
    .local v30, "x3":F
    .local v31, "y3":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v19

    .line 515
    .local v19, "tx3":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v20

    .line 516
    move/from16 v33, v30

    move/from16 v34, v31

    .end local v30    # "x3":F
    .end local v31    # "y3":F
    .local v20, "ty3":F
    .local v33, "x3":F
    .local v34, "y3":F
    move/from16 v30, v21

    move/from16 v31, v22

    .end local v21    # "x4":F
    .end local v22    # "y4":F
    .local v30, "x4":F
    .local v31, "y4":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->xRotate(FFFFFF)F

    move-result v21

    .line 517
    .local v21, "tx4":F
    invoke-static/range {v26 .. v31}, Landroidx/constraintlayout/motion/widget/MotionPaths;->yRotate(FFFFFF)F

    move-result v22

    .line 518
    .local v22, "ty4":F
    move/from16 v23, v0

    .line 519
    move/from16 v24, v1

    .line 520
    move/from16 v25, v2

    .line 521
    move/from16 v32, v18

    .line 522
    move/from16 v33, v19

    .line 523
    move/from16 v34, v20

    .line 524
    move/from16 v30, v21

    .line 525
    move/from16 v31, v22

    move/from16 v30, v23

    move/from16 v31, v24

    goto :goto_6

    .line 507
    .end local v0    # "tx1":F
    .end local v1    # "ty1":F
    .end local v23    # "x1":F
    .end local v24    # "y1":F
    .end local v25    # "x2":F
    .end local v26    # "sin":F
    .end local v27    # "cos":F
    .end local v32    # "y2":F
    .end local v33    # "x3":F
    .end local v34    # "y3":F
    .local v2, "x2":F
    .local v18, "y2":F
    .local v19, "x3":F
    .local v20, "y3":F
    .local v21, "x4":F
    .local v22, "y4":F
    .local v30, "x1":F
    .local v31, "y1":F
    :cond_5
    move/from16 v25, v2

    move/from16 v32, v18

    move/from16 v33, v19

    move/from16 v34, v20

    move/from16 v23, v30

    move/from16 v24, v31

    move/from16 v30, v21

    move/from16 v31, v22

    .end local v2    # "x2":F
    .end local v18    # "y2":F
    .end local v19    # "x3":F
    .end local v20    # "y3":F
    .end local v21    # "x4":F
    .end local v22    # "y4":F
    .restart local v23    # "x1":F
    .restart local v24    # "y1":F
    .restart local v25    # "x2":F
    .local v30, "x4":F
    .local v31, "y4":F
    .restart local v32    # "y2":F
    .restart local v33    # "x3":F
    .restart local v34    # "y3":F
    move/from16 v30, v23

    move/from16 v31, v24

    .line 528
    .end local v23    # "x1":F
    .end local v24    # "y1":F
    .end local v25    # "x2":F
    .end local v32    # "y2":F
    .end local v33    # "x3":F
    .end local v34    # "y3":F
    .restart local v2    # "x2":F
    .restart local v18    # "y2":F
    .restart local v19    # "x3":F
    .restart local v20    # "y3":F
    .restart local v21    # "x4":F
    .restart local v22    # "y4":F
    .local v30, "x1":F
    .local v31, "y1":F
    :goto_6
    add-float v30, v30, v15

    .line 529
    add-float v31, v31, v16

    .line 530
    add-float/2addr v2, v15

    .line 531
    add-float v18, v18, v16

    .line 532
    add-float v19, v19, v15

    .line 533
    add-float v20, v20, v16

    .line 534
    add-float v21, v21, v15

    .line 535
    add-float v22, v22, v16

    .line 537
    add-int/lit8 v0, p4, 0x1

    .end local p4    # "offset":I
    .local v0, "offset":I
    aput v30, p3, p4

    .line 538
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .local v1, "offset":I
    aput v31, p3, v0

    .line 539
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    aput v2, p3, v1

    .line 540
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .restart local v1    # "offset":I
    aput v18, p3, v0

    .line 541
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    aput v19, p3, v1

    .line 542
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .restart local v1    # "offset":I
    aput v20, p3, v0

    .line 543
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    aput v21, p3, v1

    .line 544
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .restart local v1    # "offset":I
    aput v22, p3, v0

    .line 545
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method hasCustomData(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 644
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method initCartesian(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 23
    .param p1, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p2, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p3, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;

    .line 80
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v3, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    .line 81
    .local v3, "position":F
    move-object/from16 v4, p0

    .line 82
    .local v4, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 84
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    move-object/from16 v6, p0

    iput v5, v6, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 85
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 86
    .local v5, "scaleWidth":F
    :goto_0
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v3

    goto :goto_1

    :cond_1
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 87
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v8, v9

    .line 88
    .local v8, "scaleX":F
    iget v9, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v10, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v9, v10

    .line 90
    .local v9, "scaleY":F
    iget v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 92
    move v10, v3

    .line 94
    .local v10, "path":F
    iget v11, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    add-float/2addr v11, v12

    .line 95
    .local v11, "startCenterX":F
    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v14, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v14, v13

    add-float/2addr v12, v14

    .line 96
    .local v12, "startCenterY":F
    iget v14, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    div-float/2addr v15, v13

    add-float/2addr v14, v15

    .line 97
    .local v14, "endCenterX":F
    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    move/from16 v16, v13

    iget v13, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float v13, v13, v16

    add-float/2addr v15, v13

    .line 98
    .local v15, "endCenterY":F
    sub-float v13, v14, v11

    .line 99
    .local v13, "pathVectorX":F
    sub-float v17, v15, v12

    .line 100
    .local v17, "pathVectorY":F
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v18, v13, v10

    add-float v2, v2, v18

    mul-float v18, v8, v5

    div-float v18, v18, v16

    sub-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 101
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v18, v17, v10

    add-float v2, v2, v18

    mul-float v18, v9, v7

    div-float v18, v18, v16

    sub-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 102
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    mul-float v18, v8, v5

    add-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 103
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    mul-float v18, v9, v7

    add-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 105
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    .line 106
    .local v2, "dxdx":F
    :goto_2
    move/from16 v18, v2

    .end local v2    # "dxdx":F
    .local v18, "dxdx":F
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentY:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    const/16 v19, 0x0

    if-eqz v2, :cond_3

    move/from16 v2, v19

    goto :goto_3

    :cond_3
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentY:F

    .line 107
    .local v2, "dydx":F
    :goto_3
    move/from16 v20, v2

    .end local v2    # "dydx":F
    .local v20, "dydx":F
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_4

    move v2, v3

    goto :goto_4

    :cond_4
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    .line 108
    .local v2, "dydy":F
    :goto_4
    move/from16 v21, v2

    .end local v2    # "dydy":F
    .local v21, "dydy":F
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentX:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_5

    :cond_5
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mAltPercentX:F

    move/from16 v19, v2

    .line 109
    .local v19, "dxdy":F
    :goto_5
    const/4 v2, 0x2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 110
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v22, v13, v18

    add-float v2, v2, v22

    mul-float v22, v17, v19

    add-float v2, v2, v22

    mul-float v22, v8, v5

    div-float v22, v22, v16

    sub-float v2, v2, v22

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 111
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v22, v13, v20

    add-float v2, v2, v22

    mul-float v22, v17, v21

    add-float v2, v2, v22

    mul-float v22, v9, v7

    div-float v22, v22, v16

    sub-float v2, v2, v22

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 113
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v2}, Landroidx/constraintlayout/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/Easing;

    move-result-object v2

    iput-object v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/motion/utils/Easing;

    .line 114
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 115
    return-void
.end method

.method initPath(Landroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 24
    .param p1, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p2, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p3, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;

    .line 182
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v3, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    .line 183
    .local v3, "position":F
    move-object/from16 v4, p0

    .line 184
    .local v4, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 186
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    move-object/from16 v6, p0

    iput v5, v6, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 187
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 188
    .local v5, "scaleWidth":F
    :goto_0
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v3

    goto :goto_1

    :cond_1
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 190
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v8, v9

    .line 191
    .local v8, "scaleX":F
    iget v9, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v10, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v9, v10

    .line 193
    .local v9, "scaleY":F
    iget v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 195
    iget v10, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v3

    goto :goto_2

    :cond_2
    iget v10, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    .line 197
    .local v10, "path":F
    :goto_2
    iget v11, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    add-float/2addr v11, v12

    .line 198
    .local v11, "startCenterX":F
    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v14, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v14, v13

    add-float/2addr v12, v14

    .line 199
    .local v12, "startCenterY":F
    iget v14, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    div-float/2addr v15, v13

    add-float/2addr v14, v15

    .line 200
    .local v14, "endCenterX":F
    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    move/from16 v16, v13

    iget v13, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float v13, v13, v16

    add-float/2addr v15, v13

    .line 201
    .local v15, "endCenterY":F
    sub-float v13, v14, v11

    .line 202
    .local v13, "pathVectorX":F
    sub-float v2, v15, v12

    .line 203
    .local v2, "pathVectorY":F
    move/from16 v17, v3

    .end local v3    # "position":F
    .local v17, "position":F
    iget v3, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v18, v13, v10

    add-float v3, v3, v18

    mul-float v18, v8, v5

    div-float v18, v18, v16

    sub-float v3, v3, v18

    float-to-int v3, v3

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 204
    iget v3, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v18, v2, v10

    add-float v3, v3, v18

    mul-float v18, v9, v7

    div-float v18, v18, v16

    sub-float v3, v3, v18

    float-to-int v3, v3

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 205
    iget v3, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    mul-float v18, v8, v5

    add-float v3, v3, v18

    float-to-int v3, v3

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 206
    iget v3, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    mul-float v18, v9, v7

    add-float v3, v3, v18

    float-to-int v3, v3

    int-to-float v3, v3

    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 207
    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x0

    goto :goto_3

    :cond_3
    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    .line 208
    .local v3, "perpendicular":F
    :goto_3
    move/from16 v18, v3

    .end local v3    # "perpendicular":F
    .local v18, "perpendicular":F
    neg-float v3, v2

    .line 209
    .local v3, "perpendicularX":F
    move/from16 v19, v13

    .line 211
    .local v19, "perpendicularY":F
    mul-float v20, v3, v18

    .line 212
    .local v20, "normalX":F
    mul-float v21, v19, v18

    .line 213
    .local v21, "normalY":F
    move/from16 v22, v2

    .end local v2    # "pathVectorY":F
    .local v22, "pathVectorY":F
    const/4 v2, 0x1

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 214
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v23, v13, v10

    add-float v2, v2, v23

    mul-float v23, v8, v5

    div-float v23, v23, v16

    sub-float v2, v2, v23

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 215
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v23, v22, v10

    add-float v2, v2, v23

    mul-float v23, v9, v7

    div-float v23, v23, v16

    sub-float v2, v2, v23

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 216
    iget v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    add-float v2, v2, v20

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 217
    iget v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    add-float v2, v2, v21

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 219
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v2}, Landroidx/constraintlayout/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/Easing;

    move-result-object v2

    iput-object v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/motion/utils/Easing;

    .line 220
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 221
    return-void
.end method

.method initScreen(IILandroidx/constraintlayout/motion/widget/KeyPosition;Landroidx/constraintlayout/motion/widget/MotionPaths;Landroidx/constraintlayout/motion/widget/MotionPaths;)V
    .locals 19
    .param p1, "parentWidth"    # I
    .param p2, "parentHeight"    # I
    .param p3, "c"    # Landroidx/constraintlayout/motion/widget/KeyPosition;
    .param p4, "startTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;
    .param p5, "endTimePoint"    # Landroidx/constraintlayout/motion/widget/MotionPaths;

    .line 140
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    iget v3, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mFramePosition:I

    int-to-float v3, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    .line 141
    .local v3, "position":F
    move-object/from16 v4, p0

    .line 142
    .local v4, "point":Landroidx/constraintlayout/motion/widget/MotionPaths;
    iput v3, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    .line 144
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mDrawPath:I

    move-object/from16 v6, p0

    iput v5, v6, Landroidx/constraintlayout/motion/widget/MotionPaths;->mDrawPath:I

    .line 145
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    iget v5, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentWidth:F

    .line 146
    .local v5, "scaleWidth":F
    :goto_0
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v3

    goto :goto_1

    :cond_1
    iget v7, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentHeight:F

    .line 148
    .local v7, "scaleHeight":F
    :goto_1
    iget v8, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    iget v9, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float/2addr v8, v9

    .line 149
    .local v8, "scaleX":F
    iget v9, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    iget v10, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float/2addr v9, v10

    .line 151
    .local v9, "scaleY":F
    iget v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->time:F

    iput v10, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->position:F

    .line 153
    move v10, v3

    .line 155
    .local v10, "path":F
    iget v11, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    add-float/2addr v11, v12

    .line 156
    .local v11, "startCenterX":F
    iget v12, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    iget v14, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float/2addr v14, v13

    add-float/2addr v12, v14

    .line 157
    .local v12, "startCenterY":F
    iget v14, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    div-float/2addr v15, v13

    add-float/2addr v14, v15

    .line 158
    .local v14, "endCenterX":F
    iget v15, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    move/from16 v16, v13

    iget v13, v2, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    div-float v13, v13, v16

    add-float/2addr v15, v13

    .line 159
    .local v15, "endCenterY":F
    sub-float v13, v14, v11

    .line 160
    .local v13, "pathVectorX":F
    sub-float v17, v15, v12

    .line 161
    .local v17, "pathVectorY":F
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    mul-float v18, v13, v10

    add-float v2, v2, v18

    mul-float v18, v8, v5

    div-float v18, v18, v16

    sub-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 162
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    mul-float v18, v17, v10

    add-float v2, v2, v18

    mul-float v18, v9, v7

    div-float v18, v18, v16

    sub-float v2, v2, v18

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 163
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    mul-float v16, v8, v5

    add-float v2, v2, v16

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 164
    iget v2, v1, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    mul-float v16, v9, v7

    add-float v2, v2, v16

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 166
    const/4 v2, 0x3

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mMode:I

    .line 167
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_2

    .line 168
    move/from16 v2, p1

    int-to-float v1, v2

    move/from16 v16, v1

    iget v1, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    sub-float v1, v16, v1

    float-to-int v1, v1

    .line 169
    .end local p1    # "parentWidth":I
    .local v1, "parentWidth":I
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentX:F

    move/from16 v16, v2

    int-to-float v2, v1

    mul-float v2, v2, v16

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    goto :goto_2

    .line 167
    .end local v1    # "parentWidth":I
    .restart local p1    # "parentWidth":I
    :cond_2
    move/from16 v2, p1

    move v1, v2

    .line 171
    .end local p1    # "parentWidth":I
    .restart local v1    # "parentWidth":I
    :goto_2
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_3

    .line 172
    move/from16 v2, p2

    move/from16 p1, v1

    .end local v1    # "parentWidth":I
    .restart local p1    # "parentWidth":I
    int-to-float v1, v2

    move/from16 v16, v1

    iget v1, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    sub-float v1, v16, v1

    float-to-int v1, v1

    .line 173
    .end local p2    # "parentHeight":I
    .local v1, "parentHeight":I
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPercentY:F

    move/from16 v16, v2

    int-to-float v2, v1

    mul-float v2, v2, v16

    float-to-int v2, v2

    int-to-float v2, v2

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    goto :goto_3

    .line 171
    .end local p1    # "parentWidth":I
    .local v1, "parentWidth":I
    .restart local p2    # "parentHeight":I
    :cond_3
    move/from16 v2, p2

    move/from16 p1, v1

    .end local v1    # "parentWidth":I
    .restart local p1    # "parentWidth":I
    move v1, v2

    .line 176
    .end local p2    # "parentHeight":I
    .local v1, "parentHeight":I
    :goto_3
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mTransitionEasing:Ljava/lang/String;

    invoke-static {v2}, Landroidx/constraintlayout/motion/utils/Easing;->getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/Easing;

    move-result-object v2

    iput-object v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mKeyFrameEasing:Landroidx/constraintlayout/motion/utils/Easing;

    .line 177
    iget v2, v0, Landroidx/constraintlayout/motion/widget/KeyPosition;->mPathMotionArc:I

    iput v2, v4, Landroidx/constraintlayout/motion/widget/MotionPaths;->mPathMotionArc:I

    .line 178
    return-void
.end method

.method setBounds(FFFF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "w"    # F
    .param p4, "h"    # F

    .line 668
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 669
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 670
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 671
    iput p4, p0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 672
    return-void
.end method

.method setDpDt(FF[F[I[D[D)V
    .locals 20
    .param p1, "locationX"    # F
    .param p2, "locationY"    # F
    .param p3, "mAnchorDpDt"    # [F
    .param p4, "toUse"    # [I
    .param p5, "deltaData"    # [D
    .param p6, "data"    # [D

    .line 559
    move-object/from16 v0, p4

    const/4 v1, 0x0

    .line 560
    .local v1, "d_x":F
    const/4 v2, 0x0

    .line 561
    .local v2, "d_y":F
    const/4 v3, 0x0

    .line 562
    .local v3, "d_width":F
    const/4 v4, 0x0

    .line 564
    .local v4, "d_height":F
    const/4 v5, 0x0

    .line 565
    .local v5, "deltaScaleX":F
    const/4 v6, 0x0

    .line 567
    .local v6, "deltaScaleY":F
    const/high16 v7, 0x7fc00000    # Float.NaN

    .line 568
    .local v7, "mPathRotate":F
    const/4 v8, 0x0

    .line 569
    .local v8, "deltaTranslationX":F
    const/4 v9, 0x0

    .line 571
    .local v9, "deltaTranslationY":F
    const-string v10, " dd = "

    .line 572
    .local v10, "mod":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    array-length v12, v0

    if-ge v11, v12, :cond_0

    .line 573
    aget-wide v12, p5, v11

    double-to-float v12, v12

    .line 574
    .local v12, "deltaV":F
    aget-wide v13, p6, v11

    double-to-float v13, v13

    .line 578
    .local v13, "value":F
    aget v14, v0, v11

    packed-switch v14, :pswitch_data_0

    goto :goto_1

    .line 591
    :pswitch_0
    move v4, v12

    goto :goto_1

    .line 588
    :pswitch_1
    move v3, v12

    .line 589
    goto :goto_1

    .line 585
    :pswitch_2
    move v2, v12

    .line 586
    goto :goto_1

    .line 582
    :pswitch_3
    move v1, v12

    .line 583
    goto :goto_1

    .line 580
    :pswitch_4
    nop

    .line 572
    .end local v12    # "deltaV":F
    .end local v13    # "value":F
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 601
    .end local v11    # "i":I
    :cond_0
    mul-float v11, v5, v3

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    sub-float v11, v1, v11

    .line 602
    .local v11, "deltaX":F
    mul-float v13, v6, v4

    div-float/2addr v13, v12

    sub-float v12, v2, v13

    .line 603
    .local v12, "deltaY":F
    const/high16 v13, 0x3f800000    # 1.0f

    add-float v14, v5, v13

    mul-float/2addr v14, v3

    .line 604
    .local v14, "deltaWidth":F
    add-float v15, v6, v13

    mul-float/2addr v15, v4

    .line 605
    .local v15, "deltaHeight":F
    add-float v16, v11, v14

    .line 606
    .local v16, "deltaRight":F
    add-float v17, v12, v15

    .line 629
    .local v17, "deltaBottom":F
    sub-float v18, v13, p1

    mul-float v18, v18, v11

    mul-float v19, v16, p1

    add-float v18, v18, v19

    add-float v18, v18, v8

    const/16 v19, 0x0

    aput v18, p3, v19

    .line 630
    sub-float v13, v13, p2

    mul-float/2addr v13, v12

    mul-float v18, v17, p2

    add-float v13, v13, v18

    add-float/2addr v13, v9

    const/16 v18, 0x1

    aput v13, p3, v18

    .line 631
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setView(Landroid/view/View;[I[D[D[D)V
    .locals 25
    .param p1, "view"    # Landroid/view/View;
    .param p2, "toUse"    # [I
    .param p3, "data"    # [D
    .param p4, "slope"    # [D
    .param p5, "cycle"    # [D

    .line 313
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->x:F

    .line 314
    .local v3, "v_x":F
    iget v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->y:F

    .line 315
    .local v4, "v_y":F
    iget v5, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->width:F

    .line 316
    .local v5, "v_width":F
    iget v6, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->height:F

    .line 317
    .local v6, "v_height":F
    const/4 v7, 0x0

    .line 318
    .local v7, "dv_x":F
    const/4 v8, 0x0

    .line 319
    .local v8, "dv_y":F
    const/4 v9, 0x0

    .line 320
    .local v9, "dv_width":F
    const/4 v10, 0x0

    .line 321
    .local v10, "dv_height":F
    const/4 v11, 0x0

    .line 322
    .local v11, "delta_path":F
    const/high16 v12, 0x7fc00000    # Float.NaN

    .line 323
    .local v12, "view_rotate":F
    const/high16 v13, 0x7fc00000    # Float.NaN

    .line 329
    .local v13, "path_rotate":F
    array-length v14, v2

    if-eqz v14, :cond_0

    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    array-length v14, v14

    const/16 v16, 0x1

    array-length v15, v2

    add-int/lit8 v15, v15, -0x1

    aget v15, v2, v15

    if-gt v14, v15, :cond_1

    .line 330
    array-length v14, v2

    add-int/lit8 v14, v14, -0x1

    aget v14, v2, v14

    add-int/lit8 v14, v14, 0x1

    .line 331
    .local v14, "scratch_data_length":I
    new-array v15, v14, [D

    iput-object v15, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    .line 332
    new-array v15, v14, [D

    iput-object v15, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    goto :goto_0

    .line 329
    .end local v14    # "scratch_data_length":I
    :cond_0
    const/16 v16, 0x1

    .line 334
    :cond_1
    :goto_0
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    move v15, v3

    move/from16 v17, v4

    .end local v3    # "v_x":F
    .end local v4    # "v_y":F
    .local v15, "v_x":F
    .local v17, "v_y":F
    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v14, v3, v4}, Ljava/util/Arrays;->fill([DD)V

    .line 335
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 336
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget v14, v2, v3

    aget-wide v18, p3, v3

    aput-wide v18, v4, v14

    .line 337
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    aget v14, v2, v3

    aget-wide v18, p4, v3

    aput-wide v18, v4, v14

    .line 335
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 340
    .end local v3    # "i":I
    :cond_2
    const/4 v3, 0x0

    move/from16 v4, v17

    .end local v17    # "v_y":F
    .restart local v3    # "i":I
    .restart local v4    # "v_y":F
    :goto_2
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    array-length v14, v14

    if-ge v3, v14, :cond_7

    .line 341
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget-wide v17, v14, v3

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->isNaN(D)Z

    move-result v14

    const-wide/16 v17, 0x0

    if-eqz v14, :cond_4

    if-eqz p5, :cond_3

    aget-wide v19, p5, v3

    cmpl-double v14, v19, v17

    if-nez v14, :cond_4

    .line 342
    move v14, v3

    goto/16 :goto_4

    .line 341
    :cond_3
    move v14, v3

    goto :goto_4

    .line 344
    :cond_4
    if-eqz p5, :cond_5

    aget-wide v17, p5, v3

    .line 345
    .local v17, "deltaCycle":D
    :cond_5
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget-wide v19, v14, v3

    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->isNaN(D)Z

    move-result v14

    if-eqz v14, :cond_6

    move v14, v3

    move-wide/from16 v2, v17

    goto :goto_3

    :cond_6
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempValue:[D

    aget-wide v19, v14, v3

    add-double v19, v19, v17

    move v14, v3

    move-wide/from16 v2, v19

    .end local v3    # "i":I
    .local v14, "i":I
    :goto_3
    double-to-float v2, v2

    .line 346
    .local v2, "value":F
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/MotionPaths;->mTempDelta:[D

    move/from16 v19, v2

    .end local v2    # "value":F
    .local v19, "value":F
    aget-wide v2, v3, v14

    double-to-float v2, v2

    .line 350
    .local v2, "dvalue":F
    packed-switch v14, :pswitch_data_0

    goto :goto_4

    .line 372
    :pswitch_0
    move/from16 v3, v19

    move v13, v3

    .end local v13    # "path_rotate":F
    .local v3, "path_rotate":F
    goto :goto_4

    .line 368
    .end local v3    # "path_rotate":F
    .restart local v13    # "path_rotate":F
    :pswitch_1
    move/from16 v3, v19

    .line 369
    .end local v6    # "v_height":F
    .local v3, "v_height":F
    move v6, v2

    .line 370
    .end local v10    # "dv_height":F
    .local v6, "dv_height":F
    move v10, v6

    move v6, v3

    goto :goto_4

    .line 364
    .end local v3    # "v_height":F
    .local v6, "v_height":F
    .restart local v10    # "dv_height":F
    :pswitch_2
    move/from16 v3, v19

    .line 365
    .end local v5    # "v_width":F
    .local v3, "v_width":F
    move v5, v2

    .line 366
    .end local v9    # "dv_width":F
    .local v5, "dv_width":F
    move v9, v5

    move v5, v3

    goto :goto_4

    .line 360
    .end local v3    # "v_width":F
    .local v5, "v_width":F
    .restart local v9    # "dv_width":F
    :pswitch_3
    move/from16 v3, v19

    .line 361
    .end local v4    # "v_y":F
    .local v3, "v_y":F
    move v4, v2

    .line 362
    .end local v8    # "dv_y":F
    .local v4, "dv_y":F
    move v8, v4

    move v4, v3

    goto :goto_4

    .line 355
    .end local v3    # "v_y":F
    .local v4, "v_y":F
    .restart local v8    # "dv_y":F
    :pswitch_4
    move/from16 v3, v19

    .line 356
    .end local v15    # "v_x":F
    .local v3, "v_x":F
    move v7, v2

    .line 358
    move v15, v3

    goto :goto_4

    .line 352
    .end local v3    # "v_x":F
    .restart local v15    # "v_x":F
    :pswitch_5
    move/from16 v3, v19

    .line 353
    .end local v11    # "delta_path":F
    .local v3, "delta_path":F
    move v11, v3

    .line 340
    .end local v2    # "dvalue":F
    .end local v3    # "delta_path":F
    .end local v17    # "deltaCycle":D
    .end local v19    # "value":F
    .restart local v11    # "delta_path":F
    :goto_4
    add-int/lit8 v3, v14, 0x1

    move-object/from16 v2, p2

    .end local v14    # "i":I
    .local v3, "i":I
    goto :goto_2

    :cond_7
    move v14, v3

    .line 377
    .end local v3    # "i":I
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 378
    invoke-static {v12}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_8

    .line 379
    invoke-virtual {v1, v12}, Landroid/view/View;->setRotation(F)V

    move/from16 v18, v4

    move/from16 v17, v5

    goto :goto_6

    .line 378
    :cond_8
    move/from16 v18, v4

    move/from16 v17, v5

    goto :goto_6

    .line 382
    :cond_9
    invoke-static {v12}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x0

    goto :goto_5

    :cond_a
    move v2, v12

    .line 383
    .local v2, "rot":F
    :goto_5
    const/high16 v3, 0x40000000    # 2.0f

    div-float v14, v9, v3

    add-float/2addr v14, v7

    .line 384
    .local v14, "dx":F
    div-float v3, v10, v3

    add-float/2addr v3, v8

    .line 391
    .local v3, "dy":F
    move/from16 v18, v4

    move/from16 v17, v5

    .end local v4    # "v_y":F
    .end local v5    # "v_width":F
    .local v17, "v_width":F
    .local v18, "v_y":F
    float-to-double v4, v2

    move-wide/from16 v19, v4

    float-to-double v4, v13

    move-wide/from16 v21, v4

    float-to-double v4, v3

    move/from16 v23, v2

    move/from16 v24, v3

    .end local v2    # "rot":F
    .end local v3    # "dy":F
    .local v23, "rot":F
    .local v24, "dy":F
    float-to-double v2, v14

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v2

    add-double v4, v21, v2

    add-double v4, v19, v4

    double-to-float v2, v4

    .line 392
    .end local v23    # "rot":F
    .restart local v2    # "rot":F
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 399
    .end local v2    # "rot":F
    .end local v14    # "dx":F
    .end local v24    # "dy":F
    :goto_6
    const/high16 v2, 0x3f000000    # 0.5f

    add-float v3, v15, v2

    float-to-int v3, v3

    .line 400
    .local v3, "l":I
    add-float v4, v18, v2

    float-to-int v4, v4

    .line 401
    .local v4, "t":I
    add-float v5, v15, v2

    add-float v5, v5, v17

    float-to-int v5, v5

    .line 402
    .local v5, "r":I
    add-float v2, v18, v2

    add-float/2addr v2, v6

    float-to-int v2, v2

    .line 403
    .local v2, "b":I
    sub-int v14, v5, v3

    .line 404
    .local v14, "i_width":I
    sub-int v0, v2, v4

    .line 414
    .local v0, "i_height":I
    move/from16 v19, v6

    .end local v6    # "v_height":F
    .local v19, "v_height":F
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    if-ne v14, v6, :cond_c

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    if-eq v0, v6, :cond_b

    goto :goto_7

    :cond_b
    const/4 v6, 0x0

    move/from16 v16, v6

    .line 416
    .local v16, "remeasure":Z
    :cond_c
    :goto_7
    if-eqz v16, :cond_d

    .line 417
    const/high16 v6, 0x40000000    # 2.0f

    move/from16 v20, v7

    .end local v7    # "dv_x":F
    .local v20, "dv_x":F
    invoke-static {v14, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 418
    .local v7, "widthMeasureSpec":I
    invoke-static {v0, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 420
    .local v6, "heightMeasureSpec":I
    invoke-virtual {v1, v7, v6}, Landroid/view/View;->measure(II)V

    goto :goto_8

    .line 416
    .end local v6    # "heightMeasureSpec":I
    .end local v20    # "dv_x":F
    .local v7, "dv_x":F
    :cond_d
    move/from16 v20, v7

    .line 423
    .end local v7    # "dv_x":F
    .restart local v20    # "dv_x":F
    :goto_8
    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/view/View;->layout(IIII)V

    .line 429
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
