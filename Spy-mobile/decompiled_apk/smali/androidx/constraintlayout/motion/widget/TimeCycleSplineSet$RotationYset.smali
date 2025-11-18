.class Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$RotationYset;
.super Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;
.source "TimeCycleSplineSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RotationYset"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 253
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;-><init>()V

    return-void
.end method


# virtual methods
.method public setProperty(Landroid/view/View;FJLandroidx/constraintlayout/motion/widget/KeyCache;)Z
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "t"    # F
    .param p3, "time"    # J
    .param p5, "cache"    # Landroidx/constraintlayout/motion/widget/KeyCache;

    .line 256
    move-object v0, p0

    move-object v4, p1

    move v1, p2

    move-wide v2, p3

    move-object v5, p5

    .end local p1    # "view":Landroid/view/View;
    .end local p2    # "t":F
    .end local p3    # "time":J
    .end local p5    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local v1, "t":F
    .local v2, "time":J
    .local v4, "view":Landroid/view/View;
    .local v5, "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$RotationYset;->get(FJLandroid/view/View;Landroidx/constraintlayout/motion/widget/KeyCache;)F

    move-result p1

    invoke-virtual {v4, p1}, Landroid/view/View;->setRotationY(F)V

    .line 257
    iget-boolean p1, v0, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$RotationYset;->mContinue:Z

    return p1
.end method
