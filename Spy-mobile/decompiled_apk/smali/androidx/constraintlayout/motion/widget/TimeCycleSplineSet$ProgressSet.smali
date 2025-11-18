.class Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;
.super Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;
.source "TimeCycleSplineSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProgressSet"
.end annotation


# instance fields
.field mNoMethod:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .line 381
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet;-><init>()V

    .line 382
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->mNoMethod:Z

    return-void
.end method


# virtual methods
.method public setProperty(Landroid/view/View;FJLandroidx/constraintlayout/motion/widget/KeyCache;)Z
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "t"    # F
    .param p3, "time"    # J
    .param p5, "cache"    # Landroidx/constraintlayout/motion/widget/KeyCache;

    .line 386
    const-string/jumbo v1, "unable to setProgress"

    const-string v2, "SplineSet"

    instance-of v0, p1, Landroidx/constraintlayout/motion/widget/MotionLayout;

    if-eqz v0, :cond_0

    .line 387
    move-object v0, p1

    check-cast v0, Landroidx/constraintlayout/motion/widget/MotionLayout;

    move-object v1, p0

    move-object v5, p1

    move v2, p2

    move-wide v3, p3

    move-object v6, p5

    .end local p1    # "view":Landroid/view/View;
    .end local p2    # "t":F
    .end local p3    # "time":J
    .end local p5    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local v2, "t":F
    .local v3, "time":J
    .local v5, "view":Landroid/view/View;
    .local v6, "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    invoke-virtual/range {v1 .. v6}, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->get(FJLandroid/view/View;Landroidx/constraintlayout/motion/widget/KeyCache;)F

    move-result p1

    move-wide p2, v3

    move-object v3, v1

    move v4, v2

    .end local v2    # "t":F
    .end local v3    # "time":J
    .local v4, "t":F
    .local p2, "time":J
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    move-wide p3, p2

    goto/16 :goto_4

    .line 389
    .end local v4    # "t":F
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .restart local p1    # "view":Landroid/view/View;
    .local p2, "t":F
    .restart local p3    # "time":J
    .restart local p5    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    :cond_0
    move-object v3, p0

    move-object v5, p1

    move v4, p2

    move-wide p2, p3

    move-object v6, p5

    .end local p1    # "view":Landroid/view/View;
    .end local p3    # "time":J
    .end local p5    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .restart local v4    # "t":F
    .restart local v5    # "view":Landroid/view/View;
    .restart local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local p2, "time":J
    iget-boolean p1, v3, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->mNoMethod:Z

    const/4 p4, 0x0

    if-eqz p1, :cond_1

    .line 390
    return p4

    .line 392
    :cond_1
    const/4 p1, 0x0

    .line 394
    .local p1, "method":Ljava/lang/reflect/Method;
    const/4 p5, 0x1

    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v7, "setProgress"

    new-array v8, p5, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, p4

    invoke-virtual {v0, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p4
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p1, p4

    .line 397
    goto :goto_0

    .line 395
    :catch_0
    move-exception v0

    move-object p4, v0

    .line 396
    .local p4, "e":Ljava/lang/NoSuchMethodException;
    iput-boolean p5, v3, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->mNoMethod:Z

    .line 398
    .end local p4    # "e":Ljava/lang/NoSuchMethodException;
    :goto_0
    if-eqz p1, :cond_2

    .line 400
    move-object v7, v5

    move-object v8, v6

    move-wide v5, p2

    .end local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .end local p2    # "time":J
    .local v5, "time":J
    .local v7, "view":Landroid/view/View;
    .local v8, "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    :try_start_1
    invoke-virtual/range {v3 .. v8}, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->get(FJLandroid/view/View;Landroidx/constraintlayout/motion/widget/KeyCache;)F

    move-result p2
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3

    move-wide p3, v5

    move-object v5, v7

    move-object v6, v8

    .end local v7    # "view":Landroid/view/View;
    .end local v8    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local v5, "view":Landroid/view/View;
    .restart local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .restart local p3    # "time":J
    :try_start_2
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v5, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 403
    :catch_1
    move-exception v0

    move-object p2, v0

    goto :goto_1

    .line 401
    :catch_2
    move-exception v0

    move-object p2, v0

    goto :goto_2

    .line 403
    .end local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .end local p3    # "time":J
    .local v5, "time":J
    .restart local v7    # "view":Landroid/view/View;
    .restart local v8    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    :catch_3
    move-exception v0

    move-wide p3, v5

    move-object v5, v7

    move-object v6, v8

    move-object p2, v0

    .line 404
    .end local v7    # "view":Landroid/view/View;
    .end local v8    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local v5, "view":Landroid/view/View;
    .restart local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local p2, "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local p3    # "time":J
    :goto_1
    invoke-static {v2, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 401
    .end local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .end local p2    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local p3    # "time":J
    .local v5, "time":J
    .restart local v7    # "view":Landroid/view/View;
    .restart local v8    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    :catch_4
    move-exception v0

    move-wide p3, v5

    move-object v5, v7

    move-object v6, v8

    move-object p2, v0

    .line 402
    .end local v7    # "view":Landroid/view/View;
    .end local v8    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local v5, "view":Landroid/view/View;
    .restart local v6    # "cache":Landroidx/constraintlayout/motion/widget/KeyCache;
    .local p2, "e":Ljava/lang/IllegalAccessException;
    .restart local p3    # "time":J
    :goto_2
    invoke-static {v2, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 405
    .end local p2    # "e":Ljava/lang/IllegalAccessException;
    :goto_3
    goto :goto_4

    .line 398
    .end local p3    # "time":J
    .local p2, "time":J
    :cond_2
    move-wide p3, p2

    .line 408
    .end local p1    # "method":Ljava/lang/reflect/Method;
    .end local p2    # "time":J
    .restart local p3    # "time":J
    :goto_4
    iget-boolean p1, v3, Landroidx/constraintlayout/motion/widget/TimeCycleSplineSet$ProgressSet;->mContinue:Z

    return p1
.end method
