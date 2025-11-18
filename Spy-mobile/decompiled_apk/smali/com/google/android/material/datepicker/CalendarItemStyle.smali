.class final Lcom/google/android/material/datepicker/CalendarItemStyle;
.super Ljava/lang/Object;
.source "CalendarItemStyle.java"


# instance fields
.field private final backgroundColor:Landroid/content/res/ColorStateList;

.field private final insets:Landroid/graphics/Rect;

.field private final itemShape:Lcom/google/android/material/shape/ShapeAppearanceModel;

.field private final strokeColor:Landroid/content/res/ColorStateList;

.field private final strokeWidth:I

.field private final textColor:Landroid/content/res/ColorStateList;


# direct methods
.method private constructor <init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILcom/google/android/material/shape/ShapeAppearanceModel;Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "backgroundColor"    # Landroid/content/res/ColorStateList;
    .param p2, "textColor"    # Landroid/content/res/ColorStateList;
    .param p3, "strokeColor"    # Landroid/content/res/ColorStateList;
    .param p4, "strokeWidth"    # I
    .param p5, "itemShape"    # Lcom/google/android/material/shape/ShapeAppearanceModel;
    .param p6, "insets"    # Landroid/graphics/Rect;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iget v0, p6, Landroid/graphics/Rect;->left:I

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    .line 69
    iget v0, p6, Landroid/graphics/Rect;->top:I

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    .line 70
    iget v0, p6, Landroid/graphics/Rect;->right:I

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    .line 71
    iget v0, p6, Landroid/graphics/Rect;->bottom:I

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    .line 73
    iput-object p6, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    .line 74
    iput-object p2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->textColor:Landroid/content/res/ColorStateList;

    .line 75
    iput-object p1, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->backgroundColor:Landroid/content/res/ColorStateList;

    .line 76
    iput-object p3, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->strokeColor:Landroid/content/res/ColorStateList;

    .line 77
    iput p4, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->strokeWidth:I

    .line 78
    iput-object p5, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->itemShape:Lcom/google/android/material/shape/ShapeAppearanceModel;

    .line 79
    return-void
.end method

.method static create(Landroid/content/Context;I)Lcom/google/android/material/datepicker/CalendarItemStyle;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "materialCalendarItemStyle"    # I

    .line 88
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string v2, "Cannot create a CalendarItemStyle with a styleResId of 0"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 91
    sget-object v1, Lcom/google/android/material/R$styleable;->MaterialCalendarItem:[I

    .line 92
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 93
    .local v1, "styleableArray":Landroid/content/res/TypedArray;
    sget v2, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_android_insetLeft:I

    .line 94
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    .line 96
    .local v2, "insetLeft":I
    sget v3, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_android_insetTop:I

    .line 97
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    .line 99
    .local v3, "insetTop":I
    sget v4, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_android_insetRight:I

    .line 100
    invoke-virtual {v1, v4, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    .line 102
    .local v4, "insetRight":I
    sget v5, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_android_insetBottom:I

    .line 103
    invoke-virtual {v1, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    .line 105
    .local v5, "insetBottom":I
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v13, v6

    .line 107
    .local v13, "insets":Landroid/graphics/Rect;
    sget v6, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemFillColor:I

    .line 108
    invoke-static {p0, v1, v6}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 110
    .local v8, "backgroundColor":Landroid/content/res/ColorStateList;
    sget v6, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemTextColor:I

    .line 111
    invoke-static {p0, v1, v6}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v9

    .line 113
    .local v9, "textColor":Landroid/content/res/ColorStateList;
    sget v6, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemStrokeColor:I

    .line 114
    invoke-static {p0, v1, v6}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v10

    .line 116
    .local v10, "strokeColor":Landroid/content/res/ColorStateList;
    sget v6, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemStrokeWidth:I

    .line 117
    invoke-virtual {v1, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    .line 119
    .local v11, "strokeWidth":I
    sget v6, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemShapeAppearance:I

    .line 120
    invoke-virtual {v1, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 121
    .local v6, "shapeAppearanceResId":I
    sget v7, Lcom/google/android/material/R$styleable;->MaterialCalendarItem_itemShapeAppearanceOverlay:I

    .line 122
    invoke-virtual {v1, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    .line 125
    .local v0, "shapeAppearanceOverlayResId":I
    nop

    .line 126
    invoke-static {p0, v6, v0}, Lcom/google/android/material/shape/ShapeAppearanceModel;->builder(Landroid/content/Context;II)Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;

    move-result-object v7

    .line 127
    invoke-virtual {v7}, Lcom/google/android/material/shape/ShapeAppearanceModel$Builder;->build()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v12

    .line 129
    .local v12, "itemShape":Lcom/google/android/material/shape/ShapeAppearanceModel;
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 131
    new-instance v7, Lcom/google/android/material/datepicker/CalendarItemStyle;

    invoke-direct/range {v7 .. v13}, Lcom/google/android/material/datepicker/CalendarItemStyle;-><init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILcom/google/android/material/shape/ShapeAppearanceModel;Landroid/graphics/Rect;)V

    return-object v7
.end method


# virtual methods
.method getBottomInset()I
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    return v0
.end method

.method getLeftInset()I
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    return v0
.end method

.method getRightInset()I
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    return v0
.end method

.method getTopInset()I
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    return v0
.end method

.method styleItem(Landroid/widget/TextView;)V
    .locals 1
    .param p1, "item"    # Landroid/widget/TextView;

    .line 140
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/google/android/material/datepicker/CalendarItemStyle;->styleItem(Landroid/widget/TextView;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 141
    return-void
.end method

.method styleItem(Landroid/widget/TextView;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V
    .locals 10
    .param p1, "item"    # Landroid/widget/TextView;
    .param p2, "backgroundColorOverride"    # Landroid/content/res/ColorStateList;
    .param p3, "textColorOverride"    # Landroid/content/res/ColorStateList;

    .line 151
    new-instance v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v0}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    .line 152
    .local v0, "backgroundDrawable":Lcom/google/android/material/shape/MaterialShapeDrawable;
    new-instance v1, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    .line 153
    .local v1, "shapeMask":Lcom/google/android/material/shape/MaterialShapeDrawable;
    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->itemShape:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-virtual {v0, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 154
    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->itemShape:Lcom/google/android/material/shape/ShapeAppearanceModel;

    invoke-virtual {v1, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 155
    nop

    .line 156
    if-eqz p2, :cond_0

    move-object v2, p2

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->backgroundColor:Landroid/content/res/ColorStateList;

    .line 155
    :goto_0
    invoke-virtual {v0, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 157
    iget v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->strokeWidth:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->strokeColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setStroke(FLandroid/content/res/ColorStateList;)V

    .line 158
    if-eqz p3, :cond_1

    move-object v2, p3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->textColor:Landroid/content/res/ColorStateList;

    :goto_1
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 160
    nop

    .line 161
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget-object v3, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->textColor:Landroid/content/res/ColorStateList;

    const/16 v4, 0x1e

    invoke-virtual {v3, v4}, Landroid/content/res/ColorStateList;->withAlpha(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v2, v3, v0, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    move-object v5, v2

    .line 165
    .local v5, "d":Landroid/graphics/drawable/Drawable;
    new-instance v4, Landroid/graphics/drawable/InsetDrawable;

    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v6, v2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v7, v2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v8, v2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/google/android/material/datepicker/CalendarItemStyle;->insets:Landroid/graphics/Rect;

    iget v9, v2, Landroid/graphics/Rect;->bottom:I

    invoke-direct/range {v4 .. v9}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-static {p1, v4}, Landroidx/core/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 167
    return-void
.end method
