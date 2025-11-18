.class public Landroidx/appcompat/widget/LinearLayoutCompat;
.super Landroid/view/ViewGroup;
.source "LinearLayoutCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;,
        Landroidx/appcompat/widget/LinearLayoutCompat$DividerMode;,
        Landroidx/appcompat/widget/LinearLayoutCompat$OrientationMode;
    }
.end annotation


# static fields
.field private static final ACCESSIBILITY_CLASS_NAME:Ljava/lang/String; = "androidx.appcompat.widget.LinearLayoutCompat"

.field public static final HORIZONTAL:I = 0x0

.field private static final INDEX_BOTTOM:I = 0x2

.field private static final INDEX_CENTER_VERTICAL:I = 0x0

.field private static final INDEX_FILL:I = 0x3

.field private static final INDEX_TOP:I = 0x1

.field public static final SHOW_DIVIDER_BEGINNING:I = 0x1

.field public static final SHOW_DIVIDER_END:I = 0x4

.field public static final SHOW_DIVIDER_MIDDLE:I = 0x2

.field public static final SHOW_DIVIDER_NONE:I = 0x0

.field public static final VERTICAL:I = 0x1

.field private static final VERTICAL_GRAVITY_COUNT:I = 0x4


# instance fields
.field private mBaselineAligned:Z

.field private mBaselineAlignedChildIndex:I

.field private mBaselineChildTop:I

.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerHeight:I

.field private mDividerPadding:I

.field private mDividerWidth:I

.field private mGravity:I

.field private mMaxAscent:[I

.field private mMaxDescent:[I

.field private mOrientation:I

.field private mShowDividers:I

.field private mTotalLength:I

.field private mUseLargestChild:Z

.field private mWeightSum:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 153
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 158
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 162
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 113
    const/4 v1, -0x1

    iput v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    .line 120
    const/4 v2, 0x0

    iput v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    .line 124
    const v3, 0x800033

    iput v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 164
    sget-object v3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat:[I

    invoke-static {p1, p2, v3, p3, v2}, Landroidx/appcompat/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/TintTypedArray;

    move-result-object v3

    .line 166
    .local v3, "a":Landroidx/appcompat/widget/TintTypedArray;
    sget-object v6, Landroidx/appcompat/R$styleable;->LinearLayoutCompat:[I

    .line 168
    invoke-virtual {v3}, Landroidx/appcompat/widget/TintTypedArray;->getWrappedTypeArray()Landroid/content/res/TypedArray;

    move-result-object v8

    .line 166
    const/4 v10, 0x0

    move-object v4, p0

    move-object v5, p1

    move-object v7, p2

    move v9, p3

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyleAttr":I
    .local v5, "context":Landroid/content/Context;
    .local v7, "attrs":Landroid/util/AttributeSet;
    .local v9, "defStyleAttr":I
    invoke-static/range {v4 .. v10}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 170
    sget p1, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_android_orientation:I

    invoke-virtual {v3, p1, v1}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    .line 171
    .local p1, "index":I
    if-ltz p1, :cond_0

    .line 172
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->setOrientation(I)V

    .line 175
    :cond_0
    sget p2, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_android_gravity:I

    invoke-virtual {v3, p2, v1}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    .line 176
    if-ltz p1, :cond_1

    .line 177
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->setGravity(I)V

    .line 180
    :cond_1
    sget p2, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_android_baselineAligned:I

    invoke-virtual {v3, p2, v0}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result p2

    .line 181
    .local p2, "baselineAligned":Z
    if-nez p2, :cond_2

    .line 182
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->setBaselineAligned(Z)V

    .line 185
    :cond_2
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_android_weightSum:I

    const/high16 v0, -0x40800000    # -1.0f

    invoke-virtual {v3, p3, v0}, Landroidx/appcompat/widget/TintTypedArray;->getFloat(IF)F

    move-result p3

    iput p3, v4, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    .line 187
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_android_baselineAlignedChildIndex:I

    .line 188
    invoke-virtual {v3, p3, v1}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p3

    iput p3, v4, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    .line 190
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_measureWithLargestChild:I

    invoke-virtual {v3, p3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, v4, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    .line 192
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_divider:I

    invoke-virtual {v3, p3}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/LinearLayoutCompat;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 193
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_showDividers:I

    invoke-virtual {v3, p3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p3

    iput p3, v4, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    .line 194
    sget p3, Landroidx/appcompat/R$styleable;->LinearLayoutCompat_dividerPadding:I

    invoke-virtual {v3, p3, v2}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, v4, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    .line 196
    invoke-virtual {v3}, Landroidx/appcompat/widget/TintTypedArray;->recycle()V

    .line 197
    return-void
.end method

.method private forceUniformHeight(II)V
    .locals 9
    .param p1, "count"    # I
    .param p2, "widthMeasureSpec"    # I

    .line 1341
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getMeasuredHeight()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 1343
    .local v6, "uniformMeasureSpec":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_2

    .line 1344
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1345
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1

    .line 1346
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1348
    .local v1, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v2, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 1351
    iget v8, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    .line 1352
    .local v8, "oldWidth":I
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iput v2, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    .line 1355
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move v4, p2

    .end local p2    # "widthMeasureSpec":I
    .local v4, "widthMeasureSpec":I
    invoke-virtual/range {v2 .. v7}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 1356
    iput v8, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    goto :goto_1

    .line 1348
    .end local v4    # "widthMeasureSpec":I
    .end local v8    # "oldWidth":I
    .restart local p2    # "widthMeasureSpec":I
    :cond_0
    move v4, p2

    .end local p2    # "widthMeasureSpec":I
    .restart local v4    # "widthMeasureSpec":I
    goto :goto_1

    .line 1345
    .end local v1    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v4    # "widthMeasureSpec":I
    .restart local p2    # "widthMeasureSpec":I
    :cond_1
    move v4, p2

    .line 1343
    .end local v3    # "child":Landroid/view/View;
    .end local p2    # "widthMeasureSpec":I
    .restart local v4    # "widthMeasureSpec":I
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move p2, v4

    goto :goto_0

    .line 1360
    .end local v0    # "i":I
    .end local v4    # "widthMeasureSpec":I
    .restart local p2    # "widthMeasureSpec":I
    :cond_2
    return-void
.end method

.method private forceUniformWidth(II)V
    .locals 9
    .param p1, "count"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 919
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getMeasuredWidth()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 921
    .local v4, "uniformMeasureSpec":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_2

    .line 922
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 923
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1

    .line 924
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 926
    .local v1, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v2, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    .line 929
    iget v8, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    .line 930
    .local v8, "oldHeight":I
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    iput v2, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    .line 933
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move v6, p2

    .end local p2    # "heightMeasureSpec":I
    .local v6, "heightMeasureSpec":I
    invoke-virtual/range {v2 .. v7}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 934
    iput v8, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    goto :goto_1

    .line 926
    .end local v6    # "heightMeasureSpec":I
    .end local v8    # "oldHeight":I
    .restart local p2    # "heightMeasureSpec":I
    :cond_0
    move v6, p2

    .end local p2    # "heightMeasureSpec":I
    .restart local v6    # "heightMeasureSpec":I
    goto :goto_1

    .line 923
    .end local v1    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v6    # "heightMeasureSpec":I
    .restart local p2    # "heightMeasureSpec":I
    :cond_1
    move v6, p2

    .line 921
    .end local v3    # "child":Landroid/view/View;
    .end local p2    # "heightMeasureSpec":I
    .restart local v6    # "heightMeasureSpec":I
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move p2, v6

    goto :goto_0

    .line 938
    .end local v0    # "i":I
    .end local v6    # "heightMeasureSpec":I
    .restart local p2    # "heightMeasureSpec":I
    :cond_2
    return-void
.end method

.method private setChildFrame(Landroid/view/View;IIII)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .line 1669
    add-int v0, p2, p4

    add-int v1, p3, p5

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 1670
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1781
    instance-of v0, p1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    return v0
.end method

.method drawDividersHorizontal(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 342
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v0

    .line 343
    .local v0, "count":I
    invoke-static {p0}, Landroidx/appcompat/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v1

    .line 344
    .local v1, "isLayoutRtl":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 345
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 347
    .local v3, "child":Landroid/view/View;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_1

    .line 348
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 349
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 351
    .local v4, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    if-eqz v1, :cond_0

    .line 352
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v5

    iget v6, v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v5, v6

    .local v5, "position":I
    goto :goto_1

    .line 354
    .end local v5    # "position":I
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v5

    iget v6, v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    sub-int/2addr v5, v6

    iget v6, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    sub-int/2addr v5, v6

    .line 356
    .restart local v5    # "position":I
    :goto_1
    invoke-virtual {p0, p1, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 344
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v5    # "position":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 361
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 362
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 364
    .local v2, "child":Landroid/view/View;
    if-nez v2, :cond_4

    .line 365
    if-eqz v1, :cond_3

    .line 366
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v3

    .local v3, "position":I
    goto :goto_2

    .line 368
    .end local v3    # "position":I
    :cond_3
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    sub-int/2addr v3, v4

    .restart local v3    # "position":I
    goto :goto_2

    .line 371
    .end local v3    # "position":I
    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 372
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    if-eqz v1, :cond_5

    .line 373
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v4

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    sub-int/2addr v4, v5

    move v3, v4

    .local v4, "position":I
    goto :goto_2

    .line 375
    .end local v4    # "position":I
    :cond_5
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v4

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    move v3, v4

    .line 378
    .local v3, "position":I
    :goto_2
    invoke-virtual {p0, p1, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 380
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "position":I
    :cond_6
    return-void
.end method

.method drawDividersVertical(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 315
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v0

    .line 316
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 317
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 319
    .local v2, "child":Landroid/view/View;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_0

    .line 320
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 321
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 322
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v4

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    sub-int/2addr v4, v5

    .line 323
    .local v4, "top":I
    invoke-virtual {p0, p1, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 316
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v4    # "top":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 328
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 329
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 330
    .local v1, "child":Landroid/view/View;
    const/4 v2, 0x0

    .line 331
    .local v2, "bottom":I
    if-nez v1, :cond_2

    .line 332
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    sub-int/2addr v3, v4

    .end local v2    # "bottom":I
    .local v3, "bottom":I
    goto :goto_1

    .line 334
    .end local v3    # "bottom":I
    .restart local v2    # "bottom":I
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 335
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v4

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int v2, v4, v5

    move v3, v2

    .line 337
    .end local v2    # "bottom":I
    .local v3, "bottom":I
    :goto_1
    invoke-virtual {p0, p1, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 339
    .end local v1    # "child":Landroid/view/View;
    .end local v3    # "bottom":I
    :cond_3
    return-void
.end method

.method drawHorizontalDivider(Landroid/graphics/Canvas;I)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "top"    # I

    .line 383
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    add-int/2addr v1, v2

    .line 384
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    sub-int/2addr v2, v3

    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v3, p2

    .line 383
    invoke-virtual {v0, v1, p2, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 385
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 386
    return-void
.end method

.method drawVerticalDivider(Landroid/graphics/Canvas;I)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "left"    # I

    .line 389
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v1

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    add-int/2addr v1, v2

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v2, p2

    .line 390
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    sub-int/2addr v3, v4

    .line 389
    invoke-virtual {v0, p2, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 391
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 392
    return-void
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 61
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateDefaultLayoutParams()Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateDefaultLayoutParams()Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 3

    .line 1764
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v1, -0x2

    if-nez v0, :cond_0

    .line 1765
    new-instance v0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(II)V

    return-object v0

    .line 1766
    :cond_0
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 1767
    new-instance v0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(II)V

    return-object v0

    .line 1769
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 1751
    new-instance v0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1774
    new-instance v0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getBaseline()I
    .locals 6

    .line 445
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-gez v0, :cond_0

    .line 446
    invoke-super {p0}, Landroid/view/ViewGroup;->getBaseline()I

    move-result v0

    return v0

    .line 449
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildCount()I

    move-result v0

    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-le v0, v1, :cond_4

    .line 454
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 455
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v1

    .line 457
    .local v1, "childBaseline":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 458
    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-nez v3, :cond_1

    .line 460
    return v2

    .line 464
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "mBaselineAlignedChildIndex of LinearLayout points to a View that doesn\'t know how to get its baseline."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 474
    :cond_2
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    .line 476
    .local v2, "childTop":I
    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 477
    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v3, v3, 0x70

    .line 478
    .local v3, "majorGravity":I
    const/16 v4, 0x30

    if-eq v3, v4, :cond_3

    .line 479
    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 481
    :sswitch_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int v2, v4, v5

    .line 482
    goto :goto_0

    .line 485
    :sswitch_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v2, v4

    .line 492
    .end local v3    # "majorGravity":I
    :cond_3
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 493
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v4, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int/2addr v4, v2

    add-int/2addr v4, v1

    return v4

    .line 450
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childBaseline":I
    .end local v2    # "childTop":I
    .end local v3    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public getBaselineAlignedChildIndex()I
    .locals 1

    .line 503
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    return v0
.end method

.method getChildrenSkipCount(Landroid/view/View;I)I
    .locals 1
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I

    .line 1371
    const/4 v0, 0x0

    return v0
.end method

.method public getDividerDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 240
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDividerPadding()I
    .locals 1

    .line 288
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    return v0
.end method

.method public getDividerWidth()I
    .locals 1

    .line 298
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    return v0
.end method

.method public getGravity()I
    .locals 1

    .line 1730
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    return v0
.end method

.method getLocationOffset(Landroid/view/View;)I
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 1413
    const/4 v0, 0x0

    return v0
.end method

.method getNextLocationOffset(Landroid/view/View;)I
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 1425
    const/4 v0, 0x0

    return v0
.end method

.method public getOrientation()I
    .locals 1

    .line 1695
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    return v0
.end method

.method public getShowDividers()I
    .locals 1

    .line 230
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    return v0
.end method

.method getVirtualChildAt(I)Landroid/view/View;
    .locals 1
    .param p1, "index"    # I

    .line 528
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getVirtualChildCount()I
    .locals 1

    .line 541
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getWeightSum()F
    .locals 1

    .line 553
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    return v0
.end method

.method protected hasDividerBeforeChildAt(I)Z
    .locals 4
    .param p1, "childIndex"    # I

    .line 590
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 591
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/2addr v2, v1

    if-eqz v2, :cond_0

    move v0, v1

    :cond_0
    return v0

    .line 592
    :cond_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildCount()I

    move-result v2

    if-ne p1, v2, :cond_3

    .line 593
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_2

    move v0, v1

    :cond_2
    return v0

    .line 594
    :cond_3
    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_6

    .line 595
    const/4 v0, 0x0

    .line 596
    .local v0, "hasVisibleViewBefore":Z
    add-int/lit8 v1, p1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_5

    .line 597
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_4

    .line 598
    const/4 v0, 0x1

    .line 599
    goto :goto_1

    .line 596
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 602
    .end local v1    # "i":I
    :cond_5
    :goto_1
    return v0

    .line 604
    .end local v0    # "hasVisibleViewBefore":Z
    :cond_6
    return v0
.end method

.method public isBaselineAligned()Z
    .locals 1

    .line 402
    iget-boolean v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    return v0
.end method

.method public isMeasureWithLargestChildEnabled()Z
    .locals 1

    .line 426
    iget-boolean v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    return v0
.end method

.method layoutHorizontal(IIII)V
    .locals 30
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 1545
    move-object/from16 v0, p0

    invoke-static {v0}, Landroidx/appcompat/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v6

    .line 1546
    .local v6, "isLayoutRtl":Z
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v7

    .line 1552
    .local v7, "paddingTop":I
    sub-int v8, p4, p2

    .line 1553
    .local v8, "height":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v1

    sub-int v9, v8, v1

    .line 1556
    .local v9, "childBottom":I
    sub-int v1, v8, v7

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v2

    sub-int v10, v1, v2

    .line 1558
    .local v10, "childSpace":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v11

    .line 1560
    .local v11, "count":I
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    const v2, 0x800007

    and-int v12, v1, v2

    .line 1561
    .local v12, "majorGravity":I
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v13, v1, 0x70

    .line 1563
    .local v13, "minorGravity":I
    iget-boolean v14, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 1565
    .local v14, "baselineAligned":Z
    iget-object v15, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    .line 1566
    .local v15, "maxAscent":[I
    iget-object v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    .line 1568
    .local v1, "maxDescent":[I
    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v2

    .line 1569
    .local v2, "layoutDirection":I
    invoke-static {v12, v2}, Landroidx/core/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v3

    const/16 v16, 0x2

    sparse-switch v3, :sswitch_data_0

    .line 1582
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v3

    .local v3, "childLeft":I
    goto :goto_0

    .line 1572
    .end local v3    # "childLeft":I
    :sswitch_0
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v3

    add-int v3, v3, p3

    sub-int v3, v3, p1

    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v3, v4

    .line 1573
    .restart local v3    # "childLeft":I
    goto :goto_0

    .line 1577
    .end local v3    # "childLeft":I
    :sswitch_1
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v3

    sub-int v4, p3, p1

    iget v5, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    .line 1578
    .restart local v3    # "childLeft":I
    nop

    .line 1586
    :goto_0
    const/4 v4, 0x0

    .line 1587
    .local v4, "start":I
    const/4 v5, 0x1

    .line 1589
    .local v5, "dir":I
    if-eqz v6, :cond_0

    .line 1590
    add-int/lit8 v4, v11, -0x1

    .line 1591
    const/4 v5, -0x1

    move/from16 v17, v4

    move/from16 v18, v5

    goto :goto_1

    .line 1589
    :cond_0
    move/from16 v17, v4

    move/from16 v18, v5

    .line 1594
    .end local v4    # "start":I
    .end local v5    # "dir":I
    .local v17, "start":I
    .local v18, "dir":I
    :goto_1
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-ge v4, v11, :cond_9

    .line 1595
    mul-int v5, v18, v4

    add-int v5, v17, v5

    .line 1596
    .local v5, "childIndex":I
    move-object/from16 v19, v1

    .end local v1    # "maxDescent":[I
    .local v19, "maxDescent":[I
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1598
    .local v1, "child":Landroid/view/View;
    const/16 v20, 0x1

    if-nez v1, :cond_1

    .line 1599
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v21

    add-int v3, v3, v21

    move/from16 v21, v2

    move/from16 v25, v6

    move/from16 v23, v7

    goto/16 :goto_7

    .line 1600
    :cond_1
    move/from16 v21, v2

    .end local v2    # "layoutDirection":I
    .local v21, "layoutDirection":I
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    move/from16 v22, v3

    .end local v3    # "childLeft":I
    .local v22, "childLeft":I
    const/16 v3, 0x8

    if-eq v2, v3, :cond_8

    .line 1601
    move v2, v4

    .end local v4    # "i":I
    .local v2, "i":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 1602
    .local v4, "childWidth":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    .line 1603
    .local v3, "childHeight":I
    const/16 v23, -0x1

    .line 1605
    .local v23, "childBaseline":I
    nop

    .line 1606
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v24

    move/from16 v25, v6

    .end local v6    # "isLayoutRtl":Z
    .local v25, "isLayoutRtl":Z
    move-object/from16 v6, v24

    check-cast v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1608
    .local v6, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    move/from16 v24, v2

    .end local v2    # "i":I
    .local v24, "i":I
    const/4 v2, -0x1

    if-eqz v14, :cond_2

    move/from16 v26, v3

    .end local v3    # "childHeight":I
    .local v26, "childHeight":I
    iget v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    if-eq v3, v2, :cond_3

    .line 1609
    invoke-virtual {v1}, Landroid/view/View;->getBaseline()I

    move-result v23

    move/from16 v3, v23

    goto :goto_3

    .line 1608
    .end local v26    # "childHeight":I
    .restart local v3    # "childHeight":I
    :cond_2
    move/from16 v26, v3

    .line 1612
    .end local v3    # "childHeight":I
    .restart local v26    # "childHeight":I
    :cond_3
    move/from16 v3, v23

    .end local v23    # "childBaseline":I
    .local v3, "childBaseline":I
    :goto_3
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    .line 1613
    .local v2, "gravity":I
    if-gez v2, :cond_4

    .line 1614
    move v2, v13

    move/from16 v27, v2

    goto :goto_4

    .line 1613
    :cond_4
    move/from16 v27, v2

    .line 1617
    .end local v2    # "gravity":I
    .local v27, "gravity":I
    :goto_4
    and-int/lit8 v2, v27, 0x70

    sparse-switch v2, :sswitch_data_1

    .line 1649
    move v2, v7

    .local v2, "childTop":I
    goto :goto_5

    .line 1642
    .end local v2    # "childTop":I
    :sswitch_2
    sub-int v2, v9, v26

    move/from16 v28, v2

    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    sub-int v2, v28, v2

    .line 1643
    .restart local v2    # "childTop":I
    move/from16 v28, v2

    const/4 v2, -0x1

    .end local v2    # "childTop":I
    .local v28, "childTop":I
    if-eq v3, v2, :cond_5

    .line 1644
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    sub-int/2addr v2, v3

    .line 1645
    .local v2, "descent":I
    aget v23, v19, v16

    sub-int v23, v23, v2

    sub-int v2, v28, v23

    .line 1646
    .end local v28    # "childTop":I
    .local v2, "childTop":I
    goto :goto_5

    .line 1643
    .end local v2    # "childTop":I
    .restart local v28    # "childTop":I
    :cond_5
    move/from16 v2, v28

    goto :goto_5

    .line 1619
    .end local v28    # "childTop":I
    :sswitch_3
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int/2addr v2, v7

    .line 1620
    .restart local v2    # "childTop":I
    move/from16 v28, v2

    const/4 v2, -0x1

    .end local v2    # "childTop":I
    .restart local v28    # "childTop":I
    if-eq v3, v2, :cond_6

    .line 1621
    aget v2, v15, v20

    sub-int/2addr v2, v3

    add-int v2, v28, v2

    .end local v28    # "childTop":I
    .restart local v2    # "childTop":I
    goto :goto_5

    .line 1620
    .end local v2    # "childTop":I
    .restart local v28    # "childTop":I
    :cond_6
    move/from16 v2, v28

    goto :goto_5

    .line 1637
    .end local v28    # "childTop":I
    :sswitch_4
    sub-int v2, v10, v26

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v7

    move/from16 v23, v2

    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int v2, v23, v2

    move/from16 v23, v2

    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    sub-int v2, v23, v2

    .line 1639
    .restart local v2    # "childTop":I
    nop

    .line 1653
    :goto_5
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v23

    if-eqz v23, :cond_7

    .line 1654
    move/from16 v23, v2

    .end local v2    # "childTop":I
    .local v23, "childTop":I
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int v2, v22, v2

    .end local v22    # "childLeft":I
    .local v2, "childLeft":I
    goto :goto_6

    .line 1653
    .end local v23    # "childTop":I
    .local v2, "childTop":I
    .restart local v22    # "childLeft":I
    :cond_7
    move/from16 v23, v2

    .end local v2    # "childTop":I
    .restart local v23    # "childTop":I
    move/from16 v2, v22

    .line 1657
    .end local v22    # "childLeft":I
    .local v2, "childLeft":I
    :goto_6
    move/from16 v22, v2

    .end local v2    # "childLeft":I
    .restart local v22    # "childLeft":I
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int v22, v22, v2

    .line 1658
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getLocationOffset(Landroid/view/View;)I

    move-result v2

    add-int v2, v22, v2

    move/from16 v29, v26

    move/from16 v26, v3

    move/from16 v3, v23

    move/from16 v23, v7

    move v7, v5

    move/from16 v5, v29

    .local v3, "childTop":I
    .local v5, "childHeight":I
    .local v7, "childIndex":I
    .local v23, "paddingTop":I
    .local v26, "childBaseline":I
    invoke-direct/range {v0 .. v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->setChildFrame(Landroid/view/View;IIII)V

    .line 1660
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v2, v4

    .line 1661
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v28

    add-int v2, v2, v28

    add-int v22, v22, v2

    .line 1663
    invoke-virtual {v0, v1, v7}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v2

    add-int v2, v24, v2

    move v4, v2

    move/from16 v3, v22

    .end local v24    # "i":I
    .local v2, "i":I
    goto :goto_7

    .line 1600
    .end local v2    # "i":I
    .end local v3    # "childTop":I
    .end local v23    # "paddingTop":I
    .end local v25    # "isLayoutRtl":Z
    .end local v26    # "childBaseline":I
    .end local v27    # "gravity":I
    .local v4, "i":I
    .local v5, "childIndex":I
    .local v6, "isLayoutRtl":Z
    .local v7, "paddingTop":I
    :cond_8
    move/from16 v24, v4

    move/from16 v25, v6

    move/from16 v23, v7

    move v7, v5

    .end local v4    # "i":I
    .end local v5    # "childIndex":I
    .end local v6    # "isLayoutRtl":Z
    .local v7, "childIndex":I
    .restart local v23    # "paddingTop":I
    .restart local v24    # "i":I
    .restart local v25    # "isLayoutRtl":Z
    move/from16 v3, v22

    .line 1594
    .end local v1    # "child":Landroid/view/View;
    .end local v7    # "childIndex":I
    .end local v22    # "childLeft":I
    .end local v24    # "i":I
    .local v3, "childLeft":I
    .restart local v4    # "i":I
    :goto_7
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, v19

    move/from16 v2, v21

    move/from16 v7, v23

    move/from16 v6, v25

    goto/16 :goto_2

    .line 1666
    .end local v4    # "i":I
    .end local v19    # "maxDescent":[I
    .end local v21    # "layoutDirection":I
    .end local v23    # "paddingTop":I
    .end local v25    # "isLayoutRtl":Z
    .local v1, "maxDescent":[I
    .local v2, "layoutDirection":I
    .restart local v6    # "isLayoutRtl":Z
    .local v7, "paddingTop":I
    :cond_9
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x5 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x10 -> :sswitch_4
        0x30 -> :sswitch_3
        0x50 -> :sswitch_2
    .end sparse-switch
.end method

.method layoutVertical(IIII)V
    .locals 21
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 1450
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v6

    .line 1456
    .local v6, "paddingLeft":I
    sub-int v7, p3, p1

    .line 1457
    .local v7, "width":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v1

    sub-int v8, v7, v1

    .line 1460
    .local v8, "childRight":I
    sub-int v1, v7, v6

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v2

    sub-int v9, v1, v2

    .line 1462
    .local v9, "childSpace":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v10

    .line 1464
    .local v10, "count":I
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v11, v1, 0x70

    .line 1465
    .local v11, "majorGravity":I
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    const v2, 0x800007

    and-int v12, v1, v2

    .line 1467
    .local v12, "minorGravity":I
    sparse-switch v11, :sswitch_data_0

    .line 1480
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v1

    .local v1, "childTop":I
    goto :goto_0

    .line 1470
    .end local v1    # "childTop":I
    :sswitch_0
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v1

    add-int v1, v1, p4

    sub-int v1, v1, p2

    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v1, v2

    .line 1471
    .restart local v1    # "childTop":I
    goto :goto_0

    .line 1475
    .end local v1    # "childTop":I
    :sswitch_1
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v1

    sub-int v2, p4, p2

    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    .line 1476
    .restart local v1    # "childTop":I
    nop

    .line 1484
    :goto_0
    const/4 v2, 0x0

    move v13, v2

    .local v13, "i":I
    :goto_1
    if-ge v13, v10, :cond_4

    .line 1485
    move v2, v1

    .end local v1    # "childTop":I
    .local v2, "childTop":I
    invoke-virtual {v0, v13}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1486
    .local v1, "child":Landroid/view/View;
    if-nez v1, :cond_0

    .line 1487
    invoke-virtual {v0, v13}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v3

    add-int/2addr v2, v3

    move v1, v2

    goto/16 :goto_5

    .line 1488
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_3

    .line 1489
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 1490
    .local v4, "childWidth":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 1492
    .local v5, "childHeight":I
    nop

    .line 1493
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1495
    .local v14, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v3, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    .line 1496
    .local v3, "gravity":I
    if-gez v3, :cond_1

    .line 1497
    move v3, v12

    move v15, v3

    goto :goto_2

    .line 1496
    :cond_1
    move v15, v3

    .line 1499
    .end local v3    # "gravity":I
    .local v15, "gravity":I
    :goto_2
    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v3

    .line 1500
    .local v3, "layoutDirection":I
    invoke-static {v15, v3}, Landroidx/core/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v16

    .line 1502
    .local v16, "absoluteGravity":I
    and-int/lit8 v17, v16, 0x7

    sparse-switch v17, :sswitch_data_1

    .line 1514
    move/from16 v18, v2

    .end local v2    # "childTop":I
    .local v18, "childTop":I
    iget v2, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int v17, v6, v2

    move/from16 v2, v17

    .local v17, "childLeft":I
    goto :goto_3

    .line 1509
    .end local v17    # "childLeft":I
    .end local v18    # "childTop":I
    .restart local v2    # "childTop":I
    :sswitch_2
    sub-int v17, v8, v4

    move/from16 v18, v2

    .end local v2    # "childTop":I
    .restart local v18    # "childTop":I
    iget v2, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    sub-int v17, v17, v2

    .line 1510
    .restart local v17    # "childLeft":I
    move/from16 v2, v17

    goto :goto_3

    .line 1504
    .end local v17    # "childLeft":I
    .end local v18    # "childTop":I
    .restart local v2    # "childTop":I
    :sswitch_3
    move/from16 v18, v2

    .end local v2    # "childTop":I
    .restart local v18    # "childTop":I
    sub-int v2, v9, v4

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v6

    move/from16 v17, v2

    iget v2, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int v2, v17, v2

    move/from16 v17, v2

    iget v2, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    sub-int v17, v17, v2

    .line 1506
    .restart local v17    # "childLeft":I
    move/from16 v2, v17

    .line 1518
    .end local v17    # "childLeft":I
    .local v2, "childLeft":I
    :goto_3
    invoke-virtual {v0, v13}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 1519
    move/from16 v17, v2

    .end local v2    # "childLeft":I
    .restart local v17    # "childLeft":I
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int v2, v18, v2

    move/from16 v18, v2

    .end local v18    # "childTop":I
    .local v2, "childTop":I
    goto :goto_4

    .line 1518
    .end local v17    # "childLeft":I
    .local v2, "childLeft":I
    .restart local v18    # "childTop":I
    :cond_2
    move/from16 v17, v2

    .line 1522
    .end local v2    # "childLeft":I
    .restart local v17    # "childLeft":I
    :goto_4
    iget v2, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int v18, v18, v2

    .line 1523
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getLocationOffset(Landroid/view/View;)I

    move-result v2

    add-int v2, v18, v2

    move/from16 v20, v3

    move v3, v2

    move/from16 v2, v17

    move/from16 v17, v20

    .end local v3    # "layoutDirection":I
    .restart local v2    # "childLeft":I
    .local v17, "layoutDirection":I
    invoke-direct/range {v0 .. v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->setChildFrame(Landroid/view/View;IIII)V

    .line 1525
    iget v3, v14, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int/2addr v3, v5

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v19

    add-int v3, v3, v19

    add-int v18, v18, v3

    .line 1527
    invoke-virtual {v0, v1, v13}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v3

    add-int/2addr v13, v3

    move/from16 v1, v18

    goto :goto_5

    .line 1488
    .end local v4    # "childWidth":I
    .end local v5    # "childHeight":I
    .end local v14    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v15    # "gravity":I
    .end local v16    # "absoluteGravity":I
    .end local v17    # "layoutDirection":I
    .end local v18    # "childTop":I
    .local v2, "childTop":I
    :cond_3
    move/from16 v18, v2

    .end local v2    # "childTop":I
    .restart local v18    # "childTop":I
    move/from16 v1, v18

    .line 1484
    .end local v18    # "childTop":I
    .local v1, "childTop":I
    :goto_5
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 1530
    .end local v13    # "i":I
    :cond_4
    return-void

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x1 -> :sswitch_3
        0x5 -> :sswitch_2
    .end sparse-switch
.end method

.method measureChildBeforeLayout(Landroid/view/View;IIIII)V
    .locals 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "childIndex"    # I
    .param p3, "widthMeasureSpec"    # I
    .param p4, "totalWidth"    # I
    .param p5, "heightMeasureSpec"    # I
    .param p6, "totalHeight"    # I

    .line 1401
    move-object v0, p0

    move-object v1, p1

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    .end local p1    # "child":Landroid/view/View;
    .end local p3    # "widthMeasureSpec":I
    .end local p4    # "totalWidth":I
    .end local p5    # "heightMeasureSpec":I
    .end local p6    # "totalHeight":I
    .local v1, "child":Landroid/view/View;
    .local v2, "widthMeasureSpec":I
    .local v3, "totalWidth":I
    .local v4, "heightMeasureSpec":I
    .local v5, "totalHeight":I
    invoke-virtual/range {v0 .. v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 1403
    return-void
.end method

.method measureHorizontal(II)V
    .locals 46
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 952
    move-object/from16 v0, p0

    const/4 v7, 0x0

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 953
    const/4 v1, 0x0

    .line 954
    .local v1, "maxHeight":I
    const/4 v2, 0x0

    .line 955
    .local v2, "childState":I
    const/4 v3, 0x0

    .line 956
    .local v3, "alternativeMaxHeight":I
    const/4 v4, 0x0

    .line 957
    .local v4, "weightedMaxHeight":I
    const/4 v5, 0x1

    .line 958
    .local v5, "allFillParent":Z
    const/4 v6, 0x0

    .line 960
    .local v6, "totalWeight":F
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v8

    .line 962
    .local v8, "count":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 963
    .local v9, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 965
    .local v10, "heightMode":I
    const/4 v11, 0x0

    .line 966
    .local v11, "matchHeight":Z
    const/4 v12, 0x0

    .line 968
    .local v12, "skippedMeasure":Z
    iget-object v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    if-eqz v13, :cond_0

    iget-object v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    if-nez v13, :cond_1

    .line 969
    :cond_0
    const/4 v13, 0x4

    new-array v14, v13, [I

    iput-object v14, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    .line 970
    new-array v13, v13, [I

    iput-object v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    .line 973
    :cond_1
    iget-object v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    .line 974
    .local v13, "maxAscent":[I
    iget-object v14, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    .line 976
    .local v14, "maxDescent":[I
    const/16 v16, 0x3

    const/4 v15, -0x1

    aput v15, v13, v16

    const/16 v17, 0x2

    aput v15, v13, v17

    const/16 v18, 0x1

    aput v15, v13, v18

    aput v15, v13, v7

    .line 977
    aput v15, v14, v16

    aput v15, v14, v17

    aput v15, v14, v18

    aput v15, v14, v7

    .line 979
    iget-boolean v15, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 980
    .local v15, "baselineAligned":Z
    move/from16 v20, v6

    .end local v6    # "totalWeight":F
    .local v20, "totalWeight":F
    iget-boolean v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    .line 982
    .local v6, "useLargestChild":Z
    move/from16 v21, v6

    .end local v6    # "useLargestChild":Z
    .local v21, "useLargestChild":Z
    const/high16 v6, 0x40000000    # 2.0f

    if-ne v9, v6, :cond_2

    move/from16 v22, v18

    goto :goto_0

    :cond_2
    move/from16 v22, v7

    .line 984
    .local v22, "isExactly":Z
    :goto_0
    const/16 v23, 0x0

    .line 987
    .local v23, "largestChildWidth":I
    const/16 v24, 0x0

    move/from16 v45, v11

    move v11, v1

    move/from16 v1, v20

    move/from16 v20, v5

    move/from16 v5, v24

    move/from16 v24, v12

    move v12, v2

    move/from16 v2, v23

    move/from16 v23, v45

    .local v1, "totalWeight":F
    .local v2, "largestChildWidth":I
    .local v5, "i":I
    .local v11, "maxHeight":I
    .local v12, "childState":I
    .local v20, "allFillParent":Z
    .local v23, "matchHeight":Z
    .local v24, "skippedMeasure":Z
    :goto_1
    const/16 v7, 0x8

    const/16 v28, 0x0

    if-ge v5, v8, :cond_16

    .line 988
    move/from16 v29, v1

    .end local v1    # "totalWeight":F
    .local v29, "totalWeight":F
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 990
    .local v1, "child":Landroid/view/View;
    if-nez v1, :cond_3

    .line 991
    iget v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v26

    add-int v7, v7, v26

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 992
    move v6, v5

    move/from16 v34, v8

    move/from16 v32, v9

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v31, v21

    move/from16 v1, v29

    move/from16 v5, p2

    move-object/from16 v21, v14

    move v14, v3

    move/from16 v3, p1

    goto/16 :goto_c

    .line 995
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-ne v6, v7, :cond_4

    .line 996
    invoke-virtual {v0, v1, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v6

    add-int/2addr v5, v6

    .line 997
    move v6, v5

    move/from16 v34, v8

    move/from16 v32, v9

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v31, v21

    move/from16 v1, v29

    move/from16 v5, p2

    move-object/from16 v21, v14

    move v14, v3

    move/from16 v3, p1

    goto/16 :goto_c

    .line 1000
    :cond_4
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1001
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v6, v7

    iput v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1004
    :cond_5
    nop

    .line 1005
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1007
    .local v7, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    add-float v29, v29, v6

    .line 1009
    const/high16 v6, 0x40000000    # 2.0f

    if-ne v9, v6, :cond_8

    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    if-nez v6, :cond_8

    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v6, v6, v28

    if-lez v6, :cond_8

    .line 1013
    if-eqz v22, :cond_6

    .line 1014
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v31, v2

    .end local v2    # "largestChildWidth":I
    .local v31, "largestChildWidth":I
    iget v2, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    move/from16 v26, v2

    iget v2, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int v2, v26, v2

    add-int/2addr v6, v2

    iput v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v32, v3

    goto :goto_2

    .line 1016
    .end local v31    # "largestChildWidth":I
    .restart local v2    # "largestChildWidth":I
    :cond_6
    move/from16 v31, v2

    .end local v2    # "largestChildWidth":I
    .restart local v31    # "largestChildWidth":I
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1017
    .local v2, "totalLength":I
    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v6, v2

    move/from16 v32, v3

    .end local v3    # "alternativeMaxHeight":I
    .local v32, "alternativeMaxHeight":I
    iget v3, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v6, v3

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1026
    .end local v2    # "totalLength":I
    :goto_2
    if-eqz v15, :cond_7

    .line 1027
    const/4 v2, 0x0

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 1028
    .local v3, "freeSpec":I
    invoke-virtual {v1, v3, v3}, Landroid/view/View;->measure(II)V

    .line 1029
    .end local v3    # "freeSpec":I
    move/from16 v3, p1

    move v2, v5

    move/from16 v34, v8

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v13, v31

    move/from16 v5, p2

    move v15, v4

    move/from16 v31, v21

    move-object/from16 v21, v14

    move/from16 v14, v32

    move/from16 v32, v9

    goto/16 :goto_5

    .line 1030
    :cond_7
    const/16 v24, 0x1

    move/from16 v3, p1

    move v2, v5

    move/from16 v34, v8

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v13, v31

    move/from16 v5, p2

    move v15, v4

    move/from16 v31, v21

    move-object/from16 v21, v14

    move/from16 v14, v32

    move/from16 v32, v9

    goto/16 :goto_5

    .line 1009
    .end local v31    # "largestChildWidth":I
    .end local v32    # "alternativeMaxHeight":I
    .local v2, "largestChildWidth":I
    .local v3, "alternativeMaxHeight":I
    :cond_8
    move/from16 v31, v2

    move/from16 v32, v3

    .line 1033
    .end local v2    # "largestChildWidth":I
    .end local v3    # "alternativeMaxHeight":I
    .restart local v31    # "largestChildWidth":I
    .restart local v32    # "alternativeMaxHeight":I
    const/high16 v2, -0x80000000

    .line 1035
    .local v2, "oldWidth":I
    iget v3, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    if-nez v3, :cond_9

    iget v3, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v3, v3, v28

    if-lez v3, :cond_9

    .line 1040
    const/4 v2, 0x0

    .line 1041
    const/4 v3, -0x2

    iput v3, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    .line 1048
    :cond_9
    nop

    .line 1049
    cmpl-float v3, v29, v28

    if-nez v3, :cond_a

    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v45, v4

    move v4, v3

    move/from16 v3, v45

    goto :goto_3

    :cond_a
    move v3, v4

    const/4 v4, 0x0

    .line 1048
    .end local v4    # "weightedMaxHeight":I
    .local v3, "weightedMaxHeight":I
    :goto_3
    const/4 v6, 0x0

    move/from16 v34, v8

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v13, v31

    const/high16 v8, 0x40000000    # 2.0f

    move v15, v3

    move/from16 v31, v21

    move/from16 v3, p1

    move-object/from16 v21, v14

    move/from16 v14, v32

    move/from16 v32, v9

    move v9, v2

    move v2, v5

    move/from16 v5, p2

    .end local v3    # "weightedMaxHeight":I
    .end local v5    # "i":I
    .end local v8    # "count":I
    .local v2, "i":I
    .local v9, "oldWidth":I
    .local v13, "largestChildWidth":I
    .local v14, "alternativeMaxHeight":I
    .local v15, "weightedMaxHeight":I
    .local v21, "maxDescent":[I
    .local v30, "baselineAligned":Z
    .local v31, "useLargestChild":Z
    .local v32, "widthMode":I
    .local v33, "maxAscent":[I
    .local v34, "count":I
    invoke-virtual/range {v0 .. v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildBeforeLayout(Landroid/view/View;IIIII)V

    .line 1052
    const/high16 v4, -0x80000000

    if-eq v9, v4, :cond_b

    .line 1053
    iput v9, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    .line 1056
    :cond_b
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 1057
    .local v4, "childWidth":I
    if-eqz v22, :cond_c

    .line 1058
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v8, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v8, v4

    move/from16 v26, v6

    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v8, v6

    .line 1059
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v6

    add-int/2addr v8, v6

    add-int v6, v26, v8

    iput v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_4

    .line 1061
    :cond_c
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1062
    .local v6, "totalLength":I
    add-int v8, v6, v4

    move/from16 v26, v8

    iget v8, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int v8, v26, v8

    move/from16 v26, v8

    iget v8, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int v8, v26, v8

    .line 1063
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v26

    add-int v8, v8, v26

    .line 1062
    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    iput v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1066
    .end local v6    # "totalLength":I
    :goto_4
    if-eqz v31, :cond_d

    .line 1067
    invoke-static {v4, v13}, Ljava/lang/Math;->max(II)I

    move-result v6

    move v13, v6

    .line 1071
    .end local v4    # "childWidth":I
    .end local v9    # "oldWidth":I
    :cond_d
    :goto_5
    const/4 v4, 0x0

    .line 1072
    .local v4, "matchHeightLocally":Z
    const/high16 v6, 0x40000000    # 2.0f

    if-eq v10, v6, :cond_e

    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    const/4 v8, -0x1

    if-ne v6, v8, :cond_e

    .line 1076
    const/16 v23, 0x1

    .line 1077
    const/4 v4, 0x1

    .line 1080
    :cond_e
    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    iget v8, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int/2addr v6, v8

    .line 1081
    .local v6, "margin":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v8, v6

    .line 1082
    .local v8, "childHeight":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    move-result v9

    invoke-static {v12, v9}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v9

    .line 1084
    .end local v12    # "childState":I
    .local v9, "childState":I
    if-eqz v30, :cond_11

    .line 1085
    invoke-virtual {v1}, Landroid/view/View;->getBaseline()I

    move-result v12

    .line 1086
    .local v12, "childBaseline":I
    move/from16 v26, v4

    const/4 v4, -0x1

    .end local v4    # "matchHeightLocally":Z
    .local v26, "matchHeightLocally":Z
    if-eq v12, v4, :cond_10

    .line 1089
    iget v4, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v4, :cond_f

    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    goto :goto_6

    :cond_f
    iget v4, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    :goto_6
    and-int/lit8 v4, v4, 0x70

    .line 1091
    .local v4, "gravity":I
    shr-int/lit8 v35, v4, 0x4

    const/16 v27, -0x2

    and-int/lit8 v27, v35, -0x2

    shr-int/lit8 v27, v27, 0x1

    .line 1094
    .local v27, "index":I
    move/from16 v35, v4

    .end local v4    # "gravity":I
    .local v35, "gravity":I
    aget v4, v33, v27

    invoke-static {v4, v12}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, v33, v27

    .line 1095
    aget v4, v21, v27

    move/from16 v36, v6

    .end local v6    # "margin":I
    .local v36, "margin":I
    sub-int v6, v8, v12

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    aput v4, v21, v27

    goto :goto_7

    .line 1086
    .end local v27    # "index":I
    .end local v35    # "gravity":I
    .end local v36    # "margin":I
    .restart local v6    # "margin":I
    :cond_10
    move/from16 v36, v6

    .end local v6    # "margin":I
    .restart local v36    # "margin":I
    goto :goto_7

    .line 1084
    .end local v12    # "childBaseline":I
    .end local v26    # "matchHeightLocally":Z
    .end local v36    # "margin":I
    .local v4, "matchHeightLocally":Z
    .restart local v6    # "margin":I
    :cond_11
    move/from16 v26, v4

    move/from16 v36, v6

    .line 1099
    .end local v4    # "matchHeightLocally":Z
    .end local v6    # "margin":I
    .restart local v26    # "matchHeightLocally":Z
    .restart local v36    # "margin":I
    :goto_7
    invoke-static {v11, v8}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1101
    .end local v11    # "maxHeight":I
    .local v4, "maxHeight":I
    if-eqz v20, :cond_12

    iget v6, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    const/4 v11, -0x1

    if-ne v6, v11, :cond_12

    move/from16 v6, v18

    goto :goto_8

    :cond_12
    const/4 v6, 0x0

    .line 1102
    .end local v20    # "allFillParent":Z
    .local v6, "allFillParent":Z
    :goto_8
    iget v11, v7, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v11, v11, v28

    if-lez v11, :cond_14

    .line 1107
    nop

    .line 1108
    if-eqz v26, :cond_13

    move/from16 v11, v36

    goto :goto_9

    :cond_13
    move v11, v8

    .line 1107
    :goto_9
    invoke-static {v15, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    move v15, v11

    .end local v15    # "weightedMaxHeight":I
    .local v11, "weightedMaxHeight":I
    goto :goto_b

    .line 1110
    .end local v11    # "weightedMaxHeight":I
    .restart local v15    # "weightedMaxHeight":I
    :cond_14
    nop

    .line 1111
    if-eqz v26, :cond_15

    move/from16 v11, v36

    goto :goto_a

    :cond_15
    move v11, v8

    .line 1110
    :goto_a
    invoke-static {v14, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    move v14, v11

    .line 1114
    :goto_b
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v11

    add-int/2addr v2, v11

    move v11, v4

    move/from16 v20, v6

    move v12, v9

    move v4, v15

    move/from16 v1, v29

    move v6, v2

    move v2, v13

    .line 987
    .end local v7    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v8    # "childHeight":I
    .end local v9    # "childState":I
    .end local v13    # "largestChildWidth":I
    .end local v15    # "weightedMaxHeight":I
    .end local v26    # "matchHeightLocally":Z
    .end local v29    # "totalWeight":F
    .end local v36    # "margin":I
    .local v1, "totalWeight":F
    .local v2, "largestChildWidth":I
    .local v4, "weightedMaxHeight":I
    .local v6, "i":I
    .local v11, "maxHeight":I
    .local v12, "childState":I
    .restart local v20    # "allFillParent":Z
    :goto_c
    add-int/lit8 v6, v6, 0x1

    move v5, v6

    move v3, v14

    move-object/from16 v14, v21

    move/from16 v15, v30

    move/from16 v21, v31

    move/from16 v9, v32

    move-object/from16 v13, v33

    move/from16 v8, v34

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v7, 0x0

    goto/16 :goto_1

    .end local v6    # "i":I
    .end local v30    # "baselineAligned":Z
    .end local v31    # "useLargestChild":Z
    .end local v32    # "widthMode":I
    .end local v33    # "maxAscent":[I
    .end local v34    # "count":I
    .local v3, "alternativeMaxHeight":I
    .restart local v5    # "i":I
    .local v8, "count":I
    .local v9, "widthMode":I
    .local v13, "maxAscent":[I
    .local v14, "maxDescent":[I
    .local v15, "baselineAligned":Z
    .local v21, "useLargestChild":Z
    :cond_16
    move/from16 v29, v1

    move/from16 v34, v8

    move/from16 v32, v9

    move-object/from16 v33, v13

    move/from16 v30, v15

    move/from16 v31, v21

    move v13, v2

    move v15, v4

    move v2, v5

    move-object/from16 v21, v14

    move/from16 v5, p2

    move v14, v3

    move/from16 v3, p1

    .line 1117
    .end local v1    # "totalWeight":F
    .end local v2    # "largestChildWidth":I
    .end local v3    # "alternativeMaxHeight":I
    .end local v4    # "weightedMaxHeight":I
    .end local v5    # "i":I
    .end local v8    # "count":I
    .end local v9    # "widthMode":I
    .local v13, "largestChildWidth":I
    .local v14, "alternativeMaxHeight":I
    .local v15, "weightedMaxHeight":I
    .local v21, "maxDescent":[I
    .restart local v29    # "totalWeight":F
    .restart local v30    # "baselineAligned":Z
    .restart local v31    # "useLargestChild":Z
    .restart local v32    # "widthMode":I
    .restart local v33    # "maxAscent":[I
    .restart local v34    # "count":I
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    if-lez v1, :cond_17

    move/from16 v1, v34

    .end local v34    # "count":I
    .local v1, "count":I
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 1118
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v2, v4

    iput v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_d

    .line 1117
    .end local v1    # "count":I
    .restart local v34    # "count":I
    :cond_17
    move/from16 v1, v34

    .line 1123
    .end local v34    # "count":I
    .restart local v1    # "count":I
    :cond_18
    :goto_d
    aget v2, v33, v18

    const/4 v4, -0x1

    if-ne v2, v4, :cond_19

    const/16 v25, 0x0

    aget v2, v33, v25

    if-ne v2, v4, :cond_19

    aget v2, v33, v17

    if-ne v2, v4, :cond_19

    aget v2, v33, v16

    if-eq v2, v4, :cond_1a

    .line 1127
    :cond_19
    aget v2, v33, v16

    const/16 v25, 0x0

    aget v4, v33, v25

    aget v6, v33, v18

    aget v8, v33, v17

    .line 1129
    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1128
    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1127
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1130
    .local v2, "ascent":I
    aget v4, v21, v16

    aget v6, v21, v25

    aget v8, v21, v18

    aget v9, v21, v17

    .line 1132
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 1131
    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1130
    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1133
    .local v4, "descent":I
    add-int v6, v2, v4

    invoke-static {v11, v6}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 1136
    .end local v2    # "ascent":I
    .end local v4    # "descent":I
    :cond_1a
    if-eqz v31, :cond_20

    move/from16 v2, v32

    const/high16 v4, -0x80000000

    .end local v32    # "widthMode":I
    .local v2, "widthMode":I
    if-eq v2, v4, :cond_1b

    if-nez v2, :cond_21

    .line 1138
    :cond_1b
    const/4 v4, 0x0

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1140
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_e
    if-ge v4, v1, :cond_1f

    .line 1141
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1143
    .local v6, "child":Landroid/view/View;
    if-nez v6, :cond_1c

    .line 1144
    iget v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v9

    add-int/2addr v8, v9

    iput v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1145
    move/from16 v32, v4

    goto :goto_f

    .line 1148
    :cond_1c
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-ne v8, v7, :cond_1d

    .line 1149
    invoke-virtual {v0, v6, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v8

    add-int/2addr v4, v8

    .line 1150
    goto :goto_10

    .line 1153
    :cond_1d
    nop

    .line 1154
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1155
    .local v8, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    if-eqz v22, :cond_1e

    .line 1156
    iget v9, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v7, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v7, v13

    move/from16 v32, v4

    .end local v4    # "i":I
    .local v32, "i":I
    iget v4, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v7, v4

    .line 1157
    invoke-virtual {v0, v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v4

    add-int/2addr v7, v4

    add-int/2addr v9, v7

    iput v9, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_f

    .line 1159
    .end local v32    # "i":I
    .restart local v4    # "i":I
    :cond_1e
    move/from16 v32, v4

    .end local v4    # "i":I
    .restart local v32    # "i":I
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1160
    .local v4, "totalLength":I
    add-int v7, v4, v13

    iget v9, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v7, v9

    iget v9, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v7, v9

    .line 1161
    invoke-virtual {v0, v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v9

    add-int/2addr v7, v9

    .line 1160
    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1140
    .end local v6    # "child":Landroid/view/View;
    .end local v8    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v32    # "i":I
    .local v4, "i":I
    :goto_f
    move/from16 v4, v32

    :goto_10
    add-int/lit8 v4, v4, 0x1

    const/16 v7, 0x8

    goto :goto_e

    :cond_1f
    move/from16 v32, v4

    .end local v4    # "i":I
    .restart local v32    # "i":I
    goto :goto_11

    .line 1136
    .end local v2    # "widthMode":I
    .local v32, "widthMode":I
    :cond_20
    move/from16 v2, v32

    .line 1167
    .end local v32    # "widthMode":I
    .restart local v2    # "widthMode":I
    :cond_21
    :goto_11
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v6

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v7

    add-int/2addr v6, v7

    add-int/2addr v4, v6

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1169
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1172
    .local v4, "widthSize":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getSuggestedMinimumWidth()I

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1175
    const/4 v6, 0x0

    invoke-static {v4, v3, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 1176
    .local v7, "widthSizeAndState":I
    const v6, 0xffffff

    and-int v4, v7, v6

    .line 1181
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int v6, v4, v6

    .line 1182
    .local v6, "delta":I
    if-nez v24, :cond_28

    if-eqz v6, :cond_22

    cmpl-float v9, v29, v28

    if-lez v9, :cond_22

    move/from16 v34, v4

    move/from16 v35, v6

    move/from16 v36, v7

    const/high16 v32, -0x1000000

    goto/16 :goto_15

    .line 1293
    :cond_22
    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 1297
    .end local v14    # "alternativeMaxHeight":I
    .local v9, "alternativeMaxHeight":I
    if-eqz v31, :cond_27

    const/high16 v14, 0x40000000    # 2.0f

    if-eq v2, v14, :cond_27

    .line 1298
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_12
    if-ge v14, v1, :cond_26

    .line 1299
    const/high16 v32, -0x1000000

    invoke-virtual {v0, v14}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1301
    .local v8, "child":Landroid/view/View;
    if-eqz v8, :cond_25

    move/from16 v34, v4

    .end local v4    # "widthSize":I
    .local v34, "widthSize":I
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v4

    move/from16 v35, v6

    const/16 v6, 0x8

    .end local v6    # "delta":I
    .local v35, "delta":I
    if-ne v4, v6, :cond_23

    .line 1302
    move/from16 v36, v7

    goto :goto_13

    .line 1305
    :cond_23
    nop

    .line 1306
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1308
    .local v4, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v6, v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    .line 1309
    .local v6, "childExtra":F
    cmpl-float v16, v6, v28

    if-lez v16, :cond_24

    .line 1310
    nop

    .line 1311
    move-object/from16 v16, v4

    move/from16 v17, v6

    const/high16 v4, 0x40000000    # 2.0f

    .end local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v6    # "childExtra":F
    .local v16, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .local v17, "childExtra":F
    invoke-static {v13, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 1312
    move/from16 v36, v7

    .end local v7    # "widthSizeAndState":I
    .local v36, "widthSizeAndState":I
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    invoke-static {v7, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1310
    invoke-virtual {v8, v6, v7}, Landroid/view/View;->measure(II)V

    goto :goto_13

    .line 1309
    .end local v16    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v17    # "childExtra":F
    .end local v36    # "widthSizeAndState":I
    .restart local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .restart local v6    # "childExtra":F
    .restart local v7    # "widthSizeAndState":I
    :cond_24
    move-object/from16 v16, v4

    move/from16 v17, v6

    move/from16 v36, v7

    .end local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v6    # "childExtra":F
    .end local v7    # "widthSizeAndState":I
    .restart local v16    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .restart local v17    # "childExtra":F
    .restart local v36    # "widthSizeAndState":I
    goto :goto_13

    .line 1301
    .end local v16    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v17    # "childExtra":F
    .end local v34    # "widthSize":I
    .end local v35    # "delta":I
    .end local v36    # "widthSizeAndState":I
    .local v4, "widthSize":I
    .local v6, "delta":I
    .restart local v7    # "widthSizeAndState":I
    :cond_25
    move/from16 v34, v4

    move/from16 v35, v6

    move/from16 v36, v7

    .line 1298
    .end local v4    # "widthSize":I
    .end local v6    # "delta":I
    .end local v7    # "widthSizeAndState":I
    .end local v8    # "child":Landroid/view/View;
    .restart local v34    # "widthSize":I
    .restart local v35    # "delta":I
    .restart local v36    # "widthSizeAndState":I
    :goto_13
    add-int/lit8 v14, v14, 0x1

    move/from16 v4, v34

    move/from16 v6, v35

    move/from16 v7, v36

    goto :goto_12

    .end local v34    # "widthSize":I
    .end local v35    # "delta":I
    .end local v36    # "widthSizeAndState":I
    .restart local v4    # "widthSize":I
    .restart local v6    # "delta":I
    .restart local v7    # "widthSizeAndState":I
    :cond_26
    move/from16 v34, v4

    move/from16 v35, v6

    move/from16 v36, v7

    const/high16 v32, -0x1000000

    .end local v4    # "widthSize":I
    .end local v6    # "delta":I
    .end local v7    # "widthSizeAndState":I
    .restart local v34    # "widthSize":I
    .restart local v35    # "delta":I
    .restart local v36    # "widthSizeAndState":I
    goto :goto_14

    .line 1297
    .end local v14    # "i":I
    .end local v34    # "widthSize":I
    .end local v35    # "delta":I
    .end local v36    # "widthSizeAndState":I
    .restart local v4    # "widthSize":I
    .restart local v6    # "delta":I
    .restart local v7    # "widthSizeAndState":I
    :cond_27
    move/from16 v34, v4

    move/from16 v35, v6

    move/from16 v36, v7

    const/high16 v32, -0x1000000

    .line 1319
    .end local v4    # "widthSize":I
    .end local v6    # "delta":I
    .end local v7    # "widthSizeAndState":I
    .restart local v34    # "widthSize":I
    .restart local v35    # "delta":I
    .restart local v36    # "widthSizeAndState":I
    :goto_14
    move/from16 v40, v2

    move/from16 v6, v35

    goto/16 :goto_26

    .line 1182
    .end local v9    # "alternativeMaxHeight":I
    .end local v34    # "widthSize":I
    .end local v35    # "delta":I
    .end local v36    # "widthSizeAndState":I
    .restart local v4    # "widthSize":I
    .restart local v6    # "delta":I
    .restart local v7    # "widthSizeAndState":I
    .local v14, "alternativeMaxHeight":I
    :cond_28
    move/from16 v34, v4

    move/from16 v35, v6

    move/from16 v36, v7

    const/high16 v32, -0x1000000

    .line 1183
    .end local v4    # "widthSize":I
    .end local v6    # "delta":I
    .end local v7    # "widthSizeAndState":I
    .restart local v34    # "widthSize":I
    .restart local v35    # "delta":I
    .restart local v36    # "widthSizeAndState":I
    :goto_15
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    cmpl-float v4, v4, v28

    if-lez v4, :cond_29

    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    goto :goto_16

    :cond_29
    move/from16 v4, v29

    .line 1185
    .local v4, "weightSum":F
    :goto_16
    const/16 v19, -0x1

    aput v19, v33, v16

    aput v19, v33, v17

    aput v19, v33, v18

    const/4 v6, 0x0

    aput v19, v33, v6

    .line 1186
    aput v19, v21, v16

    aput v19, v21, v17

    aput v19, v21, v18

    aput v19, v21, v6

    .line 1187
    const/4 v7, -0x1

    .line 1189
    .end local v11    # "maxHeight":I
    .local v7, "maxHeight":I
    iput v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1191
    const/4 v6, 0x0

    move v8, v7

    move/from16 v7, v35

    .end local v35    # "delta":I
    .local v6, "i":I
    .local v7, "delta":I
    .local v8, "maxHeight":I
    :goto_17
    if-ge v6, v1, :cond_39

    .line 1192
    invoke-virtual {v0, v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 1194
    .local v9, "child":Landroid/view/View;
    if-eqz v9, :cond_38

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v11

    move/from16 v35, v4

    const/16 v4, 0x8

    .end local v4    # "weightSum":F
    .local v35, "weightSum":F
    if-ne v11, v4, :cond_2a

    .line 1195
    move/from16 v40, v2

    move/from16 v38, v6

    const/16 v27, -0x2

    goto/16 :goto_22

    .line 1198
    :cond_2a
    nop

    .line 1199
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 1201
    .local v11, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    .line 1202
    .local v4, "childExtra":F
    cmpl-float v37, v4, v28

    if-lez v37, :cond_2f

    .line 1204
    move/from16 v37, v4

    .end local v4    # "childExtra":F
    .local v37, "childExtra":F
    int-to-float v4, v7

    mul-float v4, v4, v37

    div-float v4, v4, v35

    float-to-int v4, v4

    .line 1205
    .local v4, "share":I
    sub-float v35, v35, v37

    .line 1206
    sub-int/2addr v7, v4

    .line 1208
    nop

    .line 1210
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v38

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v39

    add-int v38, v38, v39

    move/from16 v39, v4

    .end local v4    # "share":I
    .local v39, "share":I
    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int v38, v38, v4

    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int v4, v38, v4

    move/from16 v38, v6

    .end local v6    # "i":I
    .local v38, "i":I
    iget v6, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    .line 1208
    invoke-static {v5, v4, v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildMeasureSpec(III)I

    move-result v4

    .line 1215
    .local v4, "childHeightMeasureSpec":I
    iget v6, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    if-nez v6, :cond_2d

    const/high16 v6, 0x40000000    # 2.0f

    if-eq v2, v6, :cond_2b

    move/from16 v40, v2

    goto :goto_19

    .line 1228
    :cond_2b
    nop

    .line 1229
    if-lez v39, :cond_2c

    move/from16 v6, v39

    goto :goto_18

    :cond_2c
    const/4 v6, 0x0

    .line 1228
    :goto_18
    move/from16 v40, v2

    const/high16 v2, 0x40000000    # 2.0f

    .end local v2    # "widthMode":I
    .local v40, "widthMode":I
    invoke-static {v6, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v9, v6, v4}, Landroid/view/View;->measure(II)V

    move/from16 v41, v7

    goto :goto_1a

    .line 1215
    .end local v40    # "widthMode":I
    .restart local v2    # "widthMode":I
    :cond_2d
    move/from16 v40, v2

    .line 1218
    .end local v2    # "widthMode":I
    .restart local v40    # "widthMode":I
    :goto_19
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int v2, v2, v39

    .line 1219
    .local v2, "childWidth":I
    if-gez v2, :cond_2e

    .line 1220
    const/4 v2, 0x0

    .line 1223
    :cond_2e
    nop

    .line 1224
    move/from16 v41, v7

    const/high16 v6, 0x40000000    # 2.0f

    .end local v7    # "delta":I
    .local v41, "delta":I
    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1223
    invoke-virtual {v9, v7, v4}, Landroid/view/View;->measure(II)V

    .line 1226
    .end local v2    # "childWidth":I
    nop

    .line 1234
    :goto_1a
    nop

    .line 1235
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredState()I

    move-result v2

    and-int v2, v2, v32

    .line 1234
    invoke-static {v12, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v12

    move/from16 v7, v41

    move/from16 v4, v35

    goto :goto_1b

    .line 1202
    .end local v37    # "childExtra":F
    .end local v38    # "i":I
    .end local v39    # "share":I
    .end local v40    # "widthMode":I
    .end local v41    # "delta":I
    .local v2, "widthMode":I
    .local v4, "childExtra":F
    .restart local v6    # "i":I
    .restart local v7    # "delta":I
    :cond_2f
    move/from16 v40, v2

    move/from16 v37, v4

    move/from16 v38, v6

    .end local v2    # "widthMode":I
    .end local v4    # "childExtra":F
    .end local v6    # "i":I
    .restart local v37    # "childExtra":F
    .restart local v38    # "i":I
    .restart local v40    # "widthMode":I
    move/from16 v4, v35

    .line 1238
    .end local v35    # "weightSum":F
    .local v4, "weightSum":F
    :goto_1b
    if-eqz v22, :cond_30

    .line 1239
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    move/from16 v35, v2

    iget v2, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v6, v2

    iget v2, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v6, v2

    .line 1240
    invoke-virtual {v0, v9}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v2

    add-int/2addr v6, v2

    add-int v2, v35, v6

    iput v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v35, v4

    goto :goto_1c

    .line 1242
    :cond_30
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1243
    .local v2, "totalLength":I
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    add-int/2addr v6, v2

    move/from16 v35, v4

    .end local v4    # "weightSum":F
    .restart local v35    # "weightSum":F
    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int/2addr v6, v4

    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v6, v4

    .line 1244
    invoke-virtual {v0, v9}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v4

    add-int/2addr v6, v4

    .line 1243
    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1247
    .end local v2    # "totalLength":I
    :goto_1c
    const/high16 v6, 0x40000000    # 2.0f

    if-eq v10, v6, :cond_31

    iget v2, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_31

    move/from16 v2, v18

    goto :goto_1d

    :cond_31
    const/4 v2, 0x0

    .line 1250
    .local v2, "matchHeightLocally":Z
    :goto_1d
    iget v4, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    iget v6, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int/2addr v4, v6

    .line 1251
    .local v4, "margin":I
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    add-int/2addr v6, v4

    .line 1252
    .local v6, "childHeight":I
    invoke-static {v8, v6}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 1253
    nop

    .line 1254
    move/from16 v39, v2

    if-eqz v2, :cond_32

    move v2, v4

    goto :goto_1e

    :cond_32
    move v2, v6

    .line 1253
    .end local v2    # "matchHeightLocally":Z
    .local v39, "matchHeightLocally":Z
    :goto_1e
    invoke-static {v14, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1256
    .end local v14    # "alternativeMaxHeight":I
    .local v2, "alternativeMaxHeight":I
    if-eqz v20, :cond_33

    iget v14, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    move/from16 v41, v2

    const/4 v2, -0x1

    .end local v2    # "alternativeMaxHeight":I
    .local v41, "alternativeMaxHeight":I
    if-ne v14, v2, :cond_34

    move/from16 v2, v18

    goto :goto_1f

    .end local v41    # "alternativeMaxHeight":I
    .restart local v2    # "alternativeMaxHeight":I
    :cond_33
    move/from16 v41, v2

    .end local v2    # "alternativeMaxHeight":I
    .restart local v41    # "alternativeMaxHeight":I
    :cond_34
    const/4 v2, 0x0

    .line 1258
    .end local v20    # "allFillParent":Z
    .local v2, "allFillParent":Z
    :goto_1f
    if-eqz v30, :cond_37

    .line 1259
    invoke-virtual {v9}, Landroid/view/View;->getBaseline()I

    move-result v14

    .line 1260
    .local v14, "childBaseline":I
    move/from16 v20, v2

    const/4 v2, -0x1

    .end local v2    # "allFillParent":Z
    .restart local v20    # "allFillParent":Z
    if-eq v14, v2, :cond_36

    .line 1262
    iget v2, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v2, :cond_35

    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    goto :goto_20

    :cond_35
    iget v2, v11, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    :goto_20
    and-int/lit8 v2, v2, 0x70

    .line 1264
    .local v2, "gravity":I
    shr-int/lit8 v42, v2, 0x4

    const/16 v27, -0x2

    and-int/lit8 v42, v42, -0x2

    shr-int/lit8 v42, v42, 0x1

    .line 1267
    .local v42, "index":I
    move/from16 v43, v2

    .end local v2    # "gravity":I
    .local v43, "gravity":I
    aget v2, v33, v42

    invoke-static {v2, v14}, Ljava/lang/Math;->max(II)I

    move-result v2

    aput v2, v33, v42

    .line 1268
    aget v2, v21, v42

    move/from16 v44, v4

    .end local v4    # "margin":I
    .local v44, "margin":I
    sub-int v4, v6, v14

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    aput v2, v21, v42

    goto :goto_21

    .line 1260
    .end local v42    # "index":I
    .end local v43    # "gravity":I
    .end local v44    # "margin":I
    .restart local v4    # "margin":I
    :cond_36
    move/from16 v44, v4

    const/16 v27, -0x2

    .end local v4    # "margin":I
    .restart local v44    # "margin":I
    goto :goto_21

    .line 1258
    .end local v14    # "childBaseline":I
    .end local v20    # "allFillParent":Z
    .end local v44    # "margin":I
    .local v2, "allFillParent":Z
    .restart local v4    # "margin":I
    :cond_37
    move/from16 v20, v2

    move/from16 v44, v4

    const/16 v27, -0x2

    .line 1191
    .end local v2    # "allFillParent":Z
    .end local v4    # "margin":I
    .end local v6    # "childHeight":I
    .end local v9    # "child":Landroid/view/View;
    .end local v11    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v37    # "childExtra":F
    .end local v39    # "matchHeightLocally":Z
    .restart local v20    # "allFillParent":Z
    :goto_21
    move/from16 v14, v41

    move/from16 v4, v35

    goto :goto_23

    .line 1194
    .end local v35    # "weightSum":F
    .end local v38    # "i":I
    .end local v40    # "widthMode":I
    .end local v41    # "alternativeMaxHeight":I
    .local v2, "widthMode":I
    .local v4, "weightSum":F
    .local v6, "i":I
    .restart local v9    # "child":Landroid/view/View;
    .local v14, "alternativeMaxHeight":I
    :cond_38
    move/from16 v40, v2

    move/from16 v35, v4

    move/from16 v38, v6

    const/16 v27, -0x2

    .line 1191
    .end local v2    # "widthMode":I
    .end local v4    # "weightSum":F
    .end local v6    # "i":I
    .end local v9    # "child":Landroid/view/View;
    .restart local v35    # "weightSum":F
    .restart local v38    # "i":I
    .restart local v40    # "widthMode":I
    :goto_22
    move/from16 v4, v35

    .end local v35    # "weightSum":F
    .restart local v4    # "weightSum":F
    :goto_23
    add-int/lit8 v6, v38, 0x1

    move/from16 v2, v40

    .end local v38    # "i":I
    .restart local v6    # "i":I
    goto/16 :goto_17

    .end local v40    # "widthMode":I
    .restart local v2    # "widthMode":I
    :cond_39
    move/from16 v40, v2

    move/from16 v35, v4

    move/from16 v38, v6

    .line 1275
    .end local v2    # "widthMode":I
    .end local v4    # "weightSum":F
    .end local v6    # "i":I
    .restart local v35    # "weightSum":F
    .restart local v40    # "widthMode":I
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v6

    add-int/2addr v4, v6

    add-int/2addr v2, v4

    iput v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 1280
    aget v2, v33, v18

    const/4 v4, -0x1

    if-ne v2, v4, :cond_3b

    const/16 v25, 0x0

    aget v2, v33, v25

    if-ne v2, v4, :cond_3b

    aget v2, v33, v17

    if-ne v2, v4, :cond_3b

    aget v2, v33, v16

    if-eq v2, v4, :cond_3a

    goto :goto_24

    :cond_3a
    move v11, v8

    goto :goto_25

    .line 1284
    :cond_3b
    :goto_24
    aget v2, v33, v16

    const/16 v25, 0x0

    aget v4, v33, v25

    aget v6, v33, v18

    aget v9, v33, v17

    .line 1286
    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1285
    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1284
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1287
    .local v2, "ascent":I
    aget v4, v21, v16

    aget v6, v21, v25

    aget v9, v21, v18

    aget v11, v21, v17

    .line 1289
    invoke-static {v9, v11}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 1288
    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 1287
    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1290
    .local v4, "descent":I
    add-int v6, v2, v4

    invoke-static {v8, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    move v11, v6

    .line 1292
    .end local v2    # "ascent":I
    .end local v4    # "descent":I
    .end local v8    # "maxHeight":I
    .end local v35    # "weightSum":F
    .local v11, "maxHeight":I
    :goto_25
    move v6, v7

    move v9, v14

    .line 1319
    .end local v7    # "delta":I
    .end local v14    # "alternativeMaxHeight":I
    .local v6, "delta":I
    .local v9, "alternativeMaxHeight":I
    :goto_26
    if-nez v20, :cond_3c

    const/high16 v14, 0x40000000    # 2.0f

    if-eq v10, v14, :cond_3c

    .line 1320
    move v11, v9

    .line 1323
    :cond_3c
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v4

    add-int/2addr v2, v4

    add-int/2addr v11, v2

    .line 1326
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getSuggestedMinimumHeight()I

    move-result v2

    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1328
    .end local v11    # "maxHeight":I
    .local v2, "maxHeight":I
    and-int v4, v12, v32

    or-int v4, v36, v4

    shl-int/lit8 v7, v12, 0x10

    .line 1329
    invoke-static {v2, v5, v7}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    .line 1328
    invoke-virtual {v0, v4, v7}, Landroidx/appcompat/widget/LinearLayoutCompat;->setMeasuredDimension(II)V

    .line 1332
    if-eqz v23, :cond_3d

    .line 1333
    invoke-direct {v0, v1, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->forceUniformHeight(II)V

    .line 1335
    :cond_3d
    return-void
.end method

.method measureNullChild(I)I
    .locals 1
    .param p1, "childIndex"    # I

    .line 1382
    const/4 v0, 0x0

    return v0
.end method

.method measureVertical(II)V
    .locals 38
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 619
    move-object/from16 v0, p0

    const/4 v7, 0x0

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 620
    const/4 v1, 0x0

    .line 621
    .local v1, "maxWidth":I
    const/4 v2, 0x0

    .line 622
    .local v2, "childState":I
    const/4 v3, 0x0

    .line 623
    .local v3, "alternativeMaxWidth":I
    const/4 v4, 0x0

    .line 624
    .local v4, "weightedMaxWidth":I
    const/4 v5, 0x1

    .line 625
    .local v5, "allFillParent":Z
    const/4 v6, 0x0

    .line 627
    .local v6, "totalWeight":F
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildCount()I

    move-result v8

    .line 629
    .local v8, "count":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 630
    .local v9, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 632
    .local v10, "heightMode":I
    const/4 v11, 0x0

    .line 633
    .local v11, "matchWidth":Z
    const/4 v12, 0x0

    .line 635
    .local v12, "skippedMeasure":Z
    iget v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    .line 636
    .local v13, "baselineChildIndex":I
    iget-boolean v14, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    .line 638
    .local v14, "useLargestChild":Z
    const/4 v15, 0x0

    .line 641
    .local v15, "largestChildHeight":I
    const/16 v16, 0x0

    move/from16 v17, v11

    move/from16 v18, v12

    move v11, v1

    move v12, v2

    move v1, v15

    move/from16 v2, v16

    move v15, v3

    move/from16 v16, v5

    .end local v3    # "alternativeMaxWidth":I
    .end local v5    # "allFillParent":Z
    .local v1, "largestChildHeight":I
    .local v2, "i":I
    .local v11, "maxWidth":I
    .local v12, "childState":I
    .local v15, "alternativeMaxWidth":I
    .local v16, "allFillParent":Z
    .local v17, "matchWidth":Z
    .local v18, "skippedMeasure":Z
    :goto_0
    const/16 v3, 0x8

    const/16 v20, 0x1

    const/16 v21, 0x0

    const/high16 v7, 0x40000000    # 2.0f

    if-ge v2, v8, :cond_12

    .line 642
    move/from16 v23, v1

    .end local v1    # "largestChildHeight":I
    .local v23, "largestChildHeight":I
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 644
    .local v1, "child":Landroid/view/View;
    if-nez v1, :cond_0

    .line 645
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v5

    add-int/2addr v3, v5

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 646
    move/from16 v1, p1

    move/from16 v5, p2

    move/from16 v19, v10

    move/from16 v27, v14

    move/from16 v14, v23

    move/from16 v23, v8

    goto/16 :goto_a

    .line 649
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-ne v5, v3, :cond_1

    .line 650
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v3

    add-int/2addr v2, v3

    .line 651
    move/from16 v1, p1

    move/from16 v5, p2

    move/from16 v19, v10

    move/from16 v27, v14

    move/from16 v14, v23

    move/from16 v23, v8

    goto/16 :goto_a

    .line 654
    :cond_1
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 655
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v5, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v3, v5

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 658
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 660
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    add-float v25, v6, v5

    .line 662
    .end local v6    # "totalWeight":F
    .local v25, "totalWeight":F
    if-ne v10, v7, :cond_3

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    if-nez v5, :cond_3

    iget v5, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v5, v5, v21

    if-lez v5, :cond_3

    .line 666
    iget v5, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 667
    .local v5, "totalLength":I
    iget v6, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int/2addr v6, v5

    iget v7, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    iput v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 668
    const/16 v18, 0x1

    .line 669
    .end local v5    # "totalLength":I
    move/from16 v5, p2

    move/from16 v19, v10

    move/from16 v27, v14

    move/from16 v24, v15

    move/from16 v14, v23

    move v10, v4

    move/from16 v23, v8

    move-object v8, v3

    move-object v3, v1

    move/from16 v1, p1

    goto/16 :goto_3

    .line 670
    :cond_3
    const/high16 v5, -0x80000000

    .line 672
    .local v5, "oldHeight":I
    iget v6, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    if-nez v6, :cond_4

    iget v6, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v6, v6, v21

    if-lez v6, :cond_4

    .line 677
    const/4 v5, 0x0

    .line 678
    const/4 v6, -0x2

    iput v6, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    move v7, v5

    goto :goto_1

    .line 685
    :cond_4
    move v7, v5

    .end local v5    # "oldHeight":I
    .local v7, "oldHeight":I
    :goto_1
    nop

    .line 687
    cmpl-float v5, v25, v21

    if-nez v5, :cond_5

    iget v5, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v6, v5

    goto :goto_2

    :cond_5
    const/4 v6, 0x0

    .line 685
    :goto_2
    move v5, v4

    .end local v4    # "weightedMaxWidth":I
    .local v5, "weightedMaxWidth":I
    const/4 v4, 0x0

    move/from16 v19, v10

    move/from16 v27, v14

    move/from16 v24, v15

    move/from16 v14, v23

    const/high16 v15, -0x80000000

    move v10, v5

    move/from16 v23, v8

    move/from16 v5, p2

    move-object v8, v3

    move/from16 v3, p1

    .end local v3    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v5    # "weightedMaxWidth":I
    .end local v15    # "alternativeMaxWidth":I
    .local v8, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .local v10, "weightedMaxWidth":I
    .local v14, "largestChildHeight":I
    .local v19, "heightMode":I
    .local v23, "count":I
    .local v24, "alternativeMaxWidth":I
    .local v27, "useLargestChild":Z
    invoke-virtual/range {v0 .. v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildBeforeLayout(Landroid/view/View;IIIII)V

    .line 689
    move/from16 v37, v3

    move-object v3, v1

    move/from16 v1, v37

    .end local v1    # "child":Landroid/view/View;
    .local v3, "child":Landroid/view/View;
    if-eq v7, v15, :cond_6

    .line 690
    iput v7, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    .line 693
    :cond_6
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    .line 694
    .local v4, "childHeight":I
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 695
    .local v6, "totalLength":I
    add-int v15, v6, v4

    move/from16 v29, v7

    .end local v7    # "oldHeight":I
    .local v29, "oldHeight":I
    iget v7, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int/2addr v15, v7

    iget v7, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int/2addr v15, v7

    .line 696
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v7

    add-int/2addr v15, v7

    .line 695
    invoke-static {v6, v15}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 698
    if-eqz v27, :cond_7

    .line 699
    invoke-static {v4, v14}, Ljava/lang/Math;->max(II)I

    move-result v7

    move v14, v7

    .line 707
    .end local v4    # "childHeight":I
    .end local v6    # "totalLength":I
    .end local v29    # "oldHeight":I
    :cond_7
    :goto_3
    if-ltz v13, :cond_8

    add-int/lit8 v4, v2, 0x1

    if-ne v13, v4, :cond_8

    .line 708
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    .line 714
    :cond_8
    if-ge v2, v13, :cond_a

    iget v4, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v4, v4, v21

    if-gtz v4, :cond_9

    goto :goto_4

    .line 715
    :cond_9
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v6, "A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won\'t work.  Either remove the weight, or don\'t set mBaselineAlignedChildIndex."

    invoke-direct {v4, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 721
    :cond_a
    :goto_4
    const/4 v4, 0x0

    .line 722
    .local v4, "matchWidthLocally":Z
    const/high16 v6, 0x40000000    # 2.0f

    if-eq v9, v6, :cond_b

    iget v6, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    const/4 v7, -0x1

    if-ne v6, v7, :cond_c

    .line 727
    const/16 v17, 0x1

    .line 728
    const/4 v4, 0x1

    goto :goto_5

    .line 722
    :cond_b
    const/4 v7, -0x1

    .line 731
    :cond_c
    :goto_5
    iget v6, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    iget v15, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v6, v15

    .line 732
    .local v6, "margin":I
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v15, v6

    .line 733
    .local v15, "measuredWidth":I
    invoke-static {v11, v15}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 734
    nop

    .line 735
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredState()I

    move-result v7

    .line 734
    invoke-static {v12, v7}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v7

    .line 737
    .end local v12    # "childState":I
    .local v7, "childState":I
    if-eqz v16, :cond_d

    iget v12, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    move/from16 v26, v4

    const/4 v4, -0x1

    .end local v4    # "matchWidthLocally":Z
    .local v26, "matchWidthLocally":Z
    if-ne v12, v4, :cond_e

    move/from16 v4, v20

    goto :goto_6

    .end local v26    # "matchWidthLocally":Z
    .restart local v4    # "matchWidthLocally":Z
    :cond_d
    move/from16 v26, v4

    .end local v4    # "matchWidthLocally":Z
    .restart local v26    # "matchWidthLocally":Z
    :cond_e
    const/4 v4, 0x0

    .line 738
    .end local v16    # "allFillParent":Z
    .local v4, "allFillParent":Z
    :goto_6
    iget v12, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v12, v12, v21

    if-lez v12, :cond_10

    .line 743
    nop

    .line 744
    if-eqz v26, :cond_f

    move v12, v6

    goto :goto_7

    :cond_f
    move v12, v15

    .line 743
    :goto_7
    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v10

    move/from16 v28, v15

    move/from16 v15, v24

    goto :goto_9

    .line 746
    :cond_10
    nop

    .line 747
    if-eqz v26, :cond_11

    move v12, v6

    goto :goto_8

    :cond_11
    move v12, v15

    .line 746
    :goto_8
    move/from16 v28, v15

    move/from16 v15, v24

    .end local v24    # "alternativeMaxWidth":I
    .local v15, "alternativeMaxWidth":I
    .local v28, "measuredWidth":I
    invoke-static {v15, v12}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 750
    :goto_9
    invoke-virtual {v0, v3, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v12

    add-int/2addr v2, v12

    move/from16 v16, v4

    move v12, v7

    move v4, v10

    move/from16 v6, v25

    .line 641
    .end local v3    # "child":Landroid/view/View;
    .end local v7    # "childState":I
    .end local v8    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v10    # "weightedMaxWidth":I
    .end local v25    # "totalWeight":F
    .end local v26    # "matchWidthLocally":Z
    .end local v28    # "measuredWidth":I
    .local v4, "weightedMaxWidth":I
    .local v6, "totalWeight":F
    .restart local v12    # "childState":I
    .restart local v16    # "allFillParent":Z
    :goto_a
    add-int/lit8 v2, v2, 0x1

    move v1, v14

    move/from16 v10, v19

    move/from16 v8, v23

    move/from16 v14, v27

    const/4 v7, 0x0

    goto/16 :goto_0

    .end local v19    # "heightMode":I
    .end local v23    # "count":I
    .end local v27    # "useLargestChild":Z
    .local v1, "largestChildHeight":I
    .local v8, "count":I
    .local v10, "heightMode":I
    .local v14, "useLargestChild":Z
    :cond_12
    move/from16 v5, p2

    move/from16 v23, v8

    move/from16 v19, v10

    move/from16 v27, v14

    move v14, v1

    move v10, v4

    const/high16 v4, -0x80000000

    move/from16 v1, p1

    .line 753
    .end local v1    # "largestChildHeight":I
    .end local v2    # "i":I
    .end local v4    # "weightedMaxWidth":I
    .end local v8    # "count":I
    .local v10, "weightedMaxWidth":I
    .local v14, "largestChildHeight":I
    .restart local v19    # "heightMode":I
    .restart local v23    # "count":I
    .restart local v27    # "useLargestChild":Z
    iget v2, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    if-lez v2, :cond_13

    move/from16 v2, v23

    .end local v23    # "count":I
    .local v2, "count":I
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 754
    iget v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v7, v8

    iput v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_b

    .line 753
    .end local v2    # "count":I
    .restart local v23    # "count":I
    :cond_13
    move/from16 v2, v23

    .line 757
    .end local v23    # "count":I
    .restart local v2    # "count":I
    :cond_14
    :goto_b
    if-eqz v27, :cond_1a

    move/from16 v7, v19

    .end local v19    # "heightMode":I
    .local v7, "heightMode":I
    if-eq v7, v4, :cond_16

    if-nez v7, :cond_15

    goto :goto_c

    :cond_15
    move/from16 v23, v6

    goto :goto_10

    .line 759
    :cond_16
    :goto_c
    const/4 v4, 0x0

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 761
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    if-ge v4, v2, :cond_19

    .line 762
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 764
    .local v8, "child":Landroid/view/View;
    if-nez v8, :cond_17

    .line 765
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild(I)I

    move-result v23

    add-int v3, v3, v23

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 766
    move/from16 v25, v4

    move/from16 v23, v6

    goto :goto_e

    .line 769
    :cond_17
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v3

    move/from16 v23, v6

    const/16 v6, 0x8

    .end local v6    # "totalWeight":F
    .local v23, "totalWeight":F
    if-ne v3, v6, :cond_18

    .line 770
    invoke-virtual {v0, v8, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount(Landroid/view/View;I)I

    move-result v3

    add-int/2addr v4, v3

    .line 771
    goto :goto_f

    .line 774
    :cond_18
    nop

    .line 775
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 777
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v6, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 778
    .local v6, "totalLength":I
    add-int v24, v6, v14

    move/from16 v25, v4

    .end local v4    # "i":I
    .local v25, "i":I
    iget v4, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int v24, v24, v4

    iget v4, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int v24, v24, v4

    .line 779
    invoke-virtual {v0, v8}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v4

    add-int v4, v24, v4

    .line 778
    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 761
    .end local v3    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v8    # "child":Landroid/view/View;
    .end local v23    # "totalWeight":F
    .end local v25    # "i":I
    .restart local v4    # "i":I
    .local v6, "totalWeight":F
    :goto_e
    move/from16 v4, v25

    .end local v6    # "totalWeight":F
    .restart local v23    # "totalWeight":F
    :goto_f
    add-int/lit8 v4, v4, 0x1

    move/from16 v6, v23

    const/16 v3, 0x8

    goto :goto_d

    .end local v23    # "totalWeight":F
    .restart local v6    # "totalWeight":F
    :cond_19
    move/from16 v25, v4

    move/from16 v23, v6

    .end local v4    # "i":I
    .end local v6    # "totalWeight":F
    .restart local v23    # "totalWeight":F
    .restart local v25    # "i":I
    goto :goto_10

    .line 757
    .end local v7    # "heightMode":I
    .end local v23    # "totalWeight":F
    .end local v25    # "i":I
    .restart local v6    # "totalWeight":F
    .restart local v19    # "heightMode":I
    :cond_1a
    move/from16 v23, v6

    move/from16 v7, v19

    .line 784
    .end local v6    # "totalWeight":F
    .end local v19    # "heightMode":I
    .restart local v7    # "heightMode":I
    .restart local v23    # "totalWeight":F
    :goto_10
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v6

    add-int/2addr v4, v6

    add-int/2addr v3, v4

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 786
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 789
    .local v3, "heightSize":I
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getSuggestedMinimumHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 792
    const/4 v4, 0x0

    invoke-static {v3, v5, v4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v6

    .line 793
    .local v6, "heightSizeAndState":I
    const v4, 0xffffff

    and-int v3, v6, v4

    .line 798
    iget v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int v4, v3, v4

    .line 799
    .local v4, "delta":I
    if-nez v18, :cond_21

    if-eqz v4, :cond_1b

    cmpl-float v8, v23, v21

    if-lez v8, :cond_1b

    move/from16 v24, v3

    move/from16 v25, v4

    move/from16 v29, v10

    goto/16 :goto_14

    .line 871
    :cond_1b
    invoke-static {v15, v10}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 877
    .end local v15    # "alternativeMaxWidth":I
    .local v8, "alternativeMaxWidth":I
    if-eqz v27, :cond_20

    const/high16 v15, 0x40000000    # 2.0f

    if-eq v7, v15, :cond_20

    .line 878
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_11
    if-ge v15, v2, :cond_1f

    .line 879
    move/from16 v24, v3

    .end local v3    # "heightSize":I
    .local v24, "heightSize":I
    invoke-virtual {v0, v15}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 881
    .local v3, "child":Landroid/view/View;
    if-eqz v3, :cond_1e

    move/from16 v25, v4

    .end local v4    # "delta":I
    .local v25, "delta":I
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    move/from16 v20, v8

    const/16 v8, 0x8

    .end local v8    # "alternativeMaxWidth":I
    .local v20, "alternativeMaxWidth":I
    if-ne v4, v8, :cond_1c

    .line 882
    move/from16 v29, v10

    goto :goto_12

    .line 885
    :cond_1c
    nop

    .line 886
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 888
    .local v4, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v8, v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    .line 889
    .local v8, "childExtra":F
    cmpl-float v22, v8, v21

    if-lez v22, :cond_1d

    .line 890
    nop

    .line 891
    move-object/from16 v22, v4

    .end local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .local v22, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    move/from16 v28, v8

    const/high16 v8, 0x40000000    # 2.0f

    .end local v8    # "childExtra":F
    .local v28, "childExtra":F
    invoke-static {v4, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 893
    move/from16 v29, v10

    .end local v10    # "weightedMaxWidth":I
    .local v29, "weightedMaxWidth":I
    invoke-static {v14, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 890
    invoke-virtual {v3, v4, v10}, Landroid/view/View;->measure(II)V

    goto :goto_12

    .line 889
    .end local v22    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v28    # "childExtra":F
    .end local v29    # "weightedMaxWidth":I
    .restart local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .restart local v8    # "childExtra":F
    .restart local v10    # "weightedMaxWidth":I
    :cond_1d
    move-object/from16 v22, v4

    move/from16 v28, v8

    move/from16 v29, v10

    .end local v4    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v8    # "childExtra":F
    .end local v10    # "weightedMaxWidth":I
    .restart local v22    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .restart local v28    # "childExtra":F
    .restart local v29    # "weightedMaxWidth":I
    goto :goto_12

    .line 881
    .end local v20    # "alternativeMaxWidth":I
    .end local v22    # "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .end local v25    # "delta":I
    .end local v28    # "childExtra":F
    .end local v29    # "weightedMaxWidth":I
    .local v4, "delta":I
    .local v8, "alternativeMaxWidth":I
    .restart local v10    # "weightedMaxWidth":I
    :cond_1e
    move/from16 v25, v4

    move/from16 v20, v8

    move/from16 v29, v10

    .line 878
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "delta":I
    .end local v8    # "alternativeMaxWidth":I
    .end local v10    # "weightedMaxWidth":I
    .restart local v20    # "alternativeMaxWidth":I
    .restart local v25    # "delta":I
    .restart local v29    # "weightedMaxWidth":I
    :goto_12
    add-int/lit8 v15, v15, 0x1

    move/from16 v8, v20

    move/from16 v3, v24

    move/from16 v4, v25

    move/from16 v10, v29

    goto :goto_11

    .end local v20    # "alternativeMaxWidth":I
    .end local v24    # "heightSize":I
    .end local v25    # "delta":I
    .end local v29    # "weightedMaxWidth":I
    .local v3, "heightSize":I
    .restart local v4    # "delta":I
    .restart local v8    # "alternativeMaxWidth":I
    .restart local v10    # "weightedMaxWidth":I
    :cond_1f
    move/from16 v24, v3

    move/from16 v25, v4

    move/from16 v20, v8

    move/from16 v29, v10

    .end local v3    # "heightSize":I
    .end local v4    # "delta":I
    .end local v8    # "alternativeMaxWidth":I
    .end local v10    # "weightedMaxWidth":I
    .restart local v20    # "alternativeMaxWidth":I
    .restart local v24    # "heightSize":I
    .restart local v25    # "delta":I
    .restart local v29    # "weightedMaxWidth":I
    goto :goto_13

    .line 877
    .end local v15    # "i":I
    .end local v20    # "alternativeMaxWidth":I
    .end local v24    # "heightSize":I
    .end local v25    # "delta":I
    .end local v29    # "weightedMaxWidth":I
    .restart local v3    # "heightSize":I
    .restart local v4    # "delta":I
    .restart local v8    # "alternativeMaxWidth":I
    .restart local v10    # "weightedMaxWidth":I
    :cond_20
    move/from16 v24, v3

    move/from16 v25, v4

    move/from16 v20, v8

    move/from16 v29, v10

    .line 900
    .end local v3    # "heightSize":I
    .end local v4    # "delta":I
    .end local v8    # "alternativeMaxWidth":I
    .end local v10    # "weightedMaxWidth":I
    .restart local v20    # "alternativeMaxWidth":I
    .restart local v24    # "heightSize":I
    .restart local v25    # "delta":I
    .restart local v29    # "weightedMaxWidth":I
    :goto_13
    move/from16 v34, v7

    move/from16 v35, v13

    move/from16 v8, v20

    move/from16 v4, v25

    goto/16 :goto_1f

    .line 799
    .end local v20    # "alternativeMaxWidth":I
    .end local v24    # "heightSize":I
    .end local v25    # "delta":I
    .end local v29    # "weightedMaxWidth":I
    .restart local v3    # "heightSize":I
    .restart local v4    # "delta":I
    .restart local v10    # "weightedMaxWidth":I
    .local v15, "alternativeMaxWidth":I
    :cond_21
    move/from16 v24, v3

    move/from16 v25, v4

    move/from16 v29, v10

    .line 800
    .end local v3    # "heightSize":I
    .end local v4    # "delta":I
    .end local v10    # "weightedMaxWidth":I
    .restart local v24    # "heightSize":I
    .restart local v25    # "delta":I
    .restart local v29    # "weightedMaxWidth":I
    :goto_14
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    cmpl-float v3, v3, v21

    if-lez v3, :cond_22

    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    goto :goto_15

    :cond_22
    move/from16 v3, v23

    .line 802
    .local v3, "weightSum":F
    :goto_15
    const/4 v4, 0x0

    iput v4, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 804
    const/4 v8, 0x0

    move v10, v8

    move/from16 v8, v25

    .end local v25    # "delta":I
    .local v8, "delta":I
    .local v10, "i":I
    :goto_16
    if-ge v10, v2, :cond_2e

    .line 805
    invoke-virtual {v0, v10}, Landroidx/appcompat/widget/LinearLayoutCompat;->getVirtualChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 807
    .local v4, "child":Landroid/view/View;
    move/from16 v25, v3

    .end local v3    # "weightSum":F
    .local v25, "weightSum":F
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v3

    move/from16 v30, v10

    const/16 v10, 0x8

    .end local v10    # "i":I
    .local v30, "i":I
    if-ne v3, v10, :cond_23

    .line 808
    move/from16 v34, v7

    move/from16 v35, v13

    move/from16 v3, v25

    goto/16 :goto_1e

    .line 811
    :cond_23
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 813
    .local v3, "lp":Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    iget v10, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    .line 814
    .local v10, "childExtra":F
    cmpl-float v31, v10, v21

    if-lez v31, :cond_28

    .line 816
    move/from16 v31, v10

    .end local v10    # "childExtra":F
    .local v31, "childExtra":F
    int-to-float v10, v8

    mul-float v10, v10, v31

    div-float v10, v10, v25

    float-to-int v10, v10

    .line 817
    .local v10, "share":I
    sub-float v25, v25, v31

    .line 818
    sub-int/2addr v8, v10

    .line 820
    nop

    .line 821
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v32

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v33

    add-int v32, v32, v33

    move/from16 v33, v8

    .end local v8    # "delta":I
    .local v33, "delta":I
    iget v8, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    add-int v32, v32, v8

    iget v8, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int v8, v32, v8

    move/from16 v32, v10

    .end local v10    # "share":I
    .local v32, "share":I
    iget v10, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    .line 820
    invoke-static {v1, v8, v10}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildMeasureSpec(III)I

    move-result v8

    .line 826
    .local v8, "childWidthMeasureSpec":I
    iget v10, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->height:I

    if-nez v10, :cond_26

    const/high16 v10, 0x40000000    # 2.0f

    if-eq v7, v10, :cond_24

    move/from16 v34, v7

    goto :goto_18

    .line 839
    :cond_24
    nop

    .line 840
    move/from16 v34, v7

    if-lez v32, :cond_25

    move/from16 v7, v32

    goto :goto_17

    :cond_25
    const/4 v7, 0x0

    .end local v7    # "heightMode":I
    .local v34, "heightMode":I
    :goto_17
    invoke-static {v7, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 839
    invoke-virtual {v4, v8, v7}, Landroid/view/View;->measure(II)V

    move/from16 v35, v13

    goto :goto_19

    .line 826
    .end local v34    # "heightMode":I
    .restart local v7    # "heightMode":I
    :cond_26
    move/from16 v34, v7

    .line 829
    .end local v7    # "heightMode":I
    .restart local v34    # "heightMode":I
    :goto_18
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int v7, v7, v32

    .line 830
    .local v7, "childHeight":I
    if-gez v7, :cond_27

    .line 831
    const/4 v7, 0x0

    .line 834
    :cond_27
    nop

    .line 835
    move/from16 v35, v13

    const/high16 v10, 0x40000000    # 2.0f

    .end local v13    # "baselineChildIndex":I
    .local v35, "baselineChildIndex":I
    invoke-static {v7, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 834
    invoke-virtual {v4, v8, v13}, Landroid/view/View;->measure(II)V

    .line 836
    .end local v7    # "childHeight":I
    nop

    .line 845
    :goto_19
    nop

    .line 846
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredState()I

    move-result v7

    and-int/lit16 v7, v7, -0x100

    .line 845
    invoke-static {v12, v7}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v12

    move/from16 v8, v33

    goto :goto_1a

    .line 814
    .end local v31    # "childExtra":F
    .end local v32    # "share":I
    .end local v33    # "delta":I
    .end local v34    # "heightMode":I
    .end local v35    # "baselineChildIndex":I
    .local v7, "heightMode":I
    .local v8, "delta":I
    .local v10, "childExtra":F
    .restart local v13    # "baselineChildIndex":I
    :cond_28
    move/from16 v34, v7

    move/from16 v31, v10

    move/from16 v35, v13

    .line 850
    .end local v7    # "heightMode":I
    .end local v10    # "childExtra":F
    .end local v13    # "baselineChildIndex":I
    .restart local v31    # "childExtra":F
    .restart local v34    # "heightMode":I
    .restart local v35    # "baselineChildIndex":I
    :goto_1a
    iget v7, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->leftMargin:I

    iget v10, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->rightMargin:I

    add-int/2addr v7, v10

    .line 851
    .local v7, "margin":I
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v10, v7

    .line 852
    .local v10, "measuredWidth":I
    invoke-static {v11, v10}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 854
    const/high16 v13, 0x40000000    # 2.0f

    if-eq v9, v13, :cond_29

    iget v13, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    move/from16 v32, v7

    const/4 v7, -0x1

    .end local v7    # "margin":I
    .local v32, "margin":I
    if-ne v13, v7, :cond_2a

    move/from16 v7, v20

    goto :goto_1b

    .end local v32    # "margin":I
    .restart local v7    # "margin":I
    :cond_29
    move/from16 v32, v7

    .end local v7    # "margin":I
    .restart local v32    # "margin":I
    :cond_2a
    const/4 v7, 0x0

    .line 857
    .local v7, "matchWidthLocally":Z
    :goto_1b
    nop

    .line 858
    if-eqz v7, :cond_2b

    move/from16 v13, v32

    goto :goto_1c

    :cond_2b
    move v13, v10

    .line 857
    :goto_1c
    invoke-static {v15, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 860
    .end local v15    # "alternativeMaxWidth":I
    .local v13, "alternativeMaxWidth":I
    if-eqz v16, :cond_2c

    iget v15, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->width:I

    move/from16 v33, v7

    const/4 v7, -0x1

    .end local v7    # "matchWidthLocally":Z
    .local v33, "matchWidthLocally":Z
    if-ne v15, v7, :cond_2d

    move/from16 v15, v20

    goto :goto_1d

    .end local v33    # "matchWidthLocally":Z
    .restart local v7    # "matchWidthLocally":Z
    :cond_2c
    move/from16 v33, v7

    const/4 v7, -0x1

    .end local v7    # "matchWidthLocally":Z
    .restart local v33    # "matchWidthLocally":Z
    :cond_2d
    const/4 v15, 0x0

    .line 862
    .end local v16    # "allFillParent":Z
    .local v15, "allFillParent":Z
    :goto_1d
    iget v7, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 863
    .local v7, "totalLength":I
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v16, v7, v16

    move/from16 v36, v8

    .end local v8    # "delta":I
    .local v36, "delta":I
    iget v8, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->topMargin:I

    add-int v16, v16, v8

    iget v8, v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->bottomMargin:I

    add-int v16, v16, v8

    .line 864
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset(Landroid/view/View;)I

    move-result v8

    add-int v8, v16, v8

    .line 863
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    iput v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v16, v15

    move/from16 v8, v36

    move v15, v13

    move/from16 v3, v25

    .line 804
    .end local v4    # "child":Landroid/view/View;
    .end local v7    # "totalLength":I
    .end local v10    # "measuredWidth":I
    .end local v13    # "alternativeMaxWidth":I
    .end local v25    # "weightSum":F
    .end local v31    # "childExtra":F
    .end local v32    # "margin":I
    .end local v33    # "matchWidthLocally":Z
    .end local v36    # "delta":I
    .local v3, "weightSum":F
    .restart local v8    # "delta":I
    .local v15, "alternativeMaxWidth":I
    .restart local v16    # "allFillParent":Z
    :goto_1e
    add-int/lit8 v10, v30, 0x1

    move/from16 v7, v34

    move/from16 v13, v35

    const/4 v4, 0x0

    .end local v30    # "i":I
    .local v10, "i":I
    goto/16 :goto_16

    .end local v34    # "heightMode":I
    .end local v35    # "baselineChildIndex":I
    .local v7, "heightMode":I
    .local v13, "baselineChildIndex":I
    :cond_2e
    move/from16 v25, v3

    move/from16 v34, v7

    move/from16 v30, v10

    move/from16 v35, v13

    .line 868
    .end local v3    # "weightSum":F
    .end local v7    # "heightMode":I
    .end local v10    # "i":I
    .end local v13    # "baselineChildIndex":I
    .restart local v25    # "weightSum":F
    .restart local v34    # "heightMode":I
    .restart local v35    # "baselineChildIndex":I
    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingBottom()I

    move-result v7

    add-int/2addr v4, v7

    add-int/2addr v3, v4

    iput v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 870
    .end local v25    # "weightSum":F
    move v4, v8

    move v8, v15

    .line 900
    .end local v15    # "alternativeMaxWidth":I
    .local v4, "delta":I
    .local v8, "alternativeMaxWidth":I
    :goto_1f
    if-nez v16, :cond_2f

    const/high16 v10, 0x40000000    # 2.0f

    if-eq v9, v10, :cond_2f

    .line 901
    move v11, v8

    .line 904
    :cond_2f
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingLeft()I

    move-result v3

    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getPaddingRight()I

    move-result v7

    add-int/2addr v3, v7

    add-int/2addr v11, v3

    .line 907
    invoke-virtual {v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v11, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 909
    .end local v11    # "maxWidth":I
    .local v3, "maxWidth":I
    invoke-static {v3, v1, v12}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v7

    invoke-virtual {v0, v7, v6}, Landroidx/appcompat/widget/LinearLayoutCompat;->setMeasuredDimension(II)V

    .line 912
    if-eqz v17, :cond_30

    .line 913
    invoke-direct {v0, v2, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->forceUniformWidth(II)V

    .line 915
    :cond_30
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 303
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 304
    return-void

    .line 307
    :cond_0
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 308
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawDividersVertical(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 310
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawDividersHorizontal(Landroid/graphics/Canvas;)V

    .line 312
    :goto_0
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 1786
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1787
    const-string v0, "androidx.appcompat.widget.LinearLayoutCompat"

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 1788
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 1792
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 1793
    const-string v0, "androidx.appcompat.widget.LinearLayoutCompat"

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1794
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .line 1430
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1431
    invoke-virtual {p0, p2, p3, p4, p5}, Landroidx/appcompat/widget/LinearLayoutCompat;->layoutVertical(IIII)V

    goto :goto_0

    .line 1433
    :cond_0
    invoke-virtual {p0, p2, p3, p4, p5}, Landroidx/appcompat/widget/LinearLayoutCompat;->layoutHorizontal(IIII)V

    .line 1435
    :goto_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 574
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 575
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureVertical(II)V

    goto :goto_0

    .line 577
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureHorizontal(II)V

    .line 579
    :goto_0
    return-void
.end method

.method public setBaselineAligned(Z)V
    .locals 0
    .param p1, "baselineAligned"    # Z

    .line 413
    iput-boolean p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 414
    return-void
.end method

.method public setBaselineAlignedChildIndex(I)V
    .locals 3
    .param p1, "i"    # I

    .line 511
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 515
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    .line 516
    return-void

    .line 512
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "base aligned child index out of range (0, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 513
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDividerDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .line 251
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 252
    return-void

    .line 254
    :cond_0
    iput-object p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 255
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 256
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    iput v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    .line 257
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iput v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    goto :goto_0

    .line 259
    :cond_1
    iput v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    .line 260
    iput v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    .line 262
    :goto_0
    if-nez p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->setWillNotDraw(Z)V

    .line 263
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 264
    return-void
.end method

.method public setDividerPadding(I)V
    .locals 0
    .param p1, "padding"    # I

    .line 276
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    .line 277
    return-void
.end method

.method public setGravity(I)V
    .locals 1
    .param p1, "gravity"    # I

    .line 1707
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    if-eq v0, p1, :cond_2

    .line 1708
    const v0, 0x800007

    and-int/2addr v0, p1

    if-nez v0, :cond_0

    .line 1709
    const v0, 0x800003

    or-int/2addr p1, v0

    .line 1712
    :cond_0
    and-int/lit8 v0, p1, 0x70

    if-nez v0, :cond_1

    .line 1713
    or-int/lit8 p1, p1, 0x30

    .line 1716
    :cond_1
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 1717
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 1719
    :cond_2
    return-void
.end method

.method public setHorizontalGravity(I)V
    .locals 3
    .param p1, "horizontalGravity"    # I

    .line 1734
    const v0, 0x800007

    and-int v1, p1, v0

    .line 1735
    .local v1, "gravity":I
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/2addr v0, v2

    if-eq v0, v1, :cond_0

    .line 1736
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    const v2, -0x800008

    and-int/2addr v0, v2

    or-int/2addr v0, v1

    iput v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 1737
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 1739
    :cond_0
    return-void
.end method

.method public setMeasureWithLargestChildEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 440
    iput-boolean p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    .line 441
    return-void
.end method

.method public setOrientation(I)V
    .locals 1
    .param p1, "orientation"    # I

    .line 1678
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    if-eq v0, p1, :cond_0

    .line 1679
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    .line 1680
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 1682
    :cond_0
    return-void
.end method

.method public setShowDividers(I)V
    .locals 1
    .param p1, "showDividers"    # I

    .line 207
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    if-eq p1, v0, :cond_0

    .line 208
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 210
    :cond_0
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    .line 211
    return-void
.end method

.method public setVerticalGravity(I)V
    .locals 2
    .param p1, "verticalGravity"    # I

    .line 1742
    and-int/lit8 v0, p1, 0x70

    .line 1743
    .local v0, "gravity":I
    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v1, v1, 0x70

    if-eq v1, v0, :cond_0

    .line 1744
    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v1, v1, -0x71

    or-int/2addr v1, v0

    iput v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 1745
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->requestLayout()V

    .line 1747
    :cond_0
    return-void
.end method

.method public setWeightSum(F)V
    .locals 1
    .param p1, "weightSum"    # F

    .line 569
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    .line 570
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 1

    .line 215
    const/4 v0, 0x0

    return v0
.end method
