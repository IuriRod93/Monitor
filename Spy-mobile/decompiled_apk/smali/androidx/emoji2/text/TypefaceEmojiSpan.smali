.class public final Landroidx/emoji2/text/TypefaceEmojiSpan;
.super Landroidx/emoji2/text/EmojiSpan;
.source "TypefaceEmojiSpan.java"


# static fields
.field private static sDebugPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroidx/emoji2/text/EmojiMetadata;)V
    .locals 0
    .param p1, "metadata"    # Landroidx/emoji2/text/EmojiMetadata;

    .line 49
    invoke-direct {p0, p1}, Landroidx/emoji2/text/EmojiSpan;-><init>(Landroidx/emoji2/text/EmojiMetadata;)V

    .line 50
    return-void
.end method

.method private static getDebugPaint()Landroid/graphics/Paint;
    .locals 2

    .line 65
    sget-object v0, Landroidx/emoji2/text/TypefaceEmojiSpan;->sDebugPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    sput-object v0, Landroidx/emoji2/text/TypefaceEmojiSpan;->sDebugPaint:Landroid/graphics/Paint;

    .line 67
    sget-object v0, Landroidx/emoji2/text/TypefaceEmojiSpan;->sDebugPaint:Landroid/graphics/Paint;

    invoke-static {}, Landroidx/emoji2/text/EmojiCompat;->get()Landroidx/emoji2/text/EmojiCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/emoji2/text/EmojiCompat;->getEmojiSpanIndicatorColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    sget-object v0, Landroidx/emoji2/text/TypefaceEmojiSpan;->sDebugPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 70
    :cond_0
    sget-object v0, Landroidx/emoji2/text/TypefaceEmojiSpan;->sDebugPaint:Landroid/graphics/Paint;

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "x"    # F
    .param p6, "top"    # I
    .param p7, "y"    # I
    .param p8, "bottom"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .line 57
    invoke-static {}, Landroidx/emoji2/text/EmojiCompat;->get()Landroidx/emoji2/text/EmojiCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/emoji2/text/EmojiCompat;->isEmojiSpanIndicatorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    int-to-float v3, p6

    invoke-virtual {p0}, Landroidx/emoji2/text/TypefaceEmojiSpan;->getWidth()I

    move-result v0

    int-to-float v0, v0

    add-float v4, p5, v0

    int-to-float v5, p8

    invoke-static {}, Landroidx/emoji2/text/TypefaceEmojiSpan;->getDebugPaint()Landroid/graphics/Paint;

    move-result-object v6

    move-object v1, p1

    move v2, p5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 60
    :cond_0
    invoke-virtual {p0}, Landroidx/emoji2/text/TypefaceEmojiSpan;->getMetadata()Landroidx/emoji2/text/EmojiMetadata;

    move-result-object v0

    int-to-float v3, p7

    move-object/from16 v4, p9

    invoke-virtual {v0, p1, p5, v3, v4}, Landroidx/emoji2/text/EmojiMetadata;->draw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 61
    return-void
.end method
