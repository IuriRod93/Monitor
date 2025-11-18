.class public Landroidx/core/graphics/TypefaceCompat;
.super Ljava/lang/Object;
.source "TypefaceCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/graphics/TypefaceCompat$ResourcesCallbackAdapter;
    }
.end annotation


# static fields
.field private static final sTypefaceCache:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field private static final sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 51
    new-instance v0, Landroidx/core/graphics/TypefaceCompatApi29Impl;

    invoke-direct {v0}, Landroidx/core/graphics/TypefaceCompatApi29Impl;-><init>()V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    goto :goto_0

    .line 52
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    .line 53
    new-instance v0, Landroidx/core/graphics/TypefaceCompatApi28Impl;

    invoke-direct {v0}, Landroidx/core/graphics/TypefaceCompatApi28Impl;-><init>()V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    goto :goto_0

    .line 54
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    .line 55
    new-instance v0, Landroidx/core/graphics/TypefaceCompatApi26Impl;

    invoke-direct {v0}, Landroidx/core/graphics/TypefaceCompatApi26Impl;-><init>()V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    goto :goto_0

    .line 56
    :cond_2
    nop

    .line 57
    invoke-static {}, Landroidx/core/graphics/TypefaceCompatApi24Impl;->isUsable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 58
    new-instance v0, Landroidx/core/graphics/TypefaceCompatApi24Impl;

    invoke-direct {v0}, Landroidx/core/graphics/TypefaceCompatApi24Impl;-><init>()V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    goto :goto_0

    .line 59
    :cond_3
    nop

    .line 60
    new-instance v0, Landroidx/core/graphics/TypefaceCompatApi21Impl;

    invoke-direct {v0}, Landroidx/core/graphics/TypefaceCompatApi21Impl;-><init>()V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    .line 69
    :goto_0
    new-instance v0, Landroidx/collection/LruCache;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroidx/collection/LruCache;-><init>(I)V

    sput-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCache:Landroidx/collection/LruCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearCache()V
    .locals 1

    .line 346
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    .line 347
    return-void
.end method

.method public static create(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "family"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .line 278
    if-eqz p0, :cond_0

    .line 282
    const/4 v0, 0x0

    .line 283
    .local v0, "typefaceFromFamily":Landroid/graphics/Typeface;
    nop

    .line 290
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    return-object v1

    .line 279
    .end local v0    # "typefaceFromFamily":Landroid/graphics/Typeface;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static create(Landroid/content/Context;Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "family"    # Landroid/graphics/Typeface;
    .param p2, "weight"    # I
    .param p3, "italic"    # Z

    .line 331
    if-eqz p0, :cond_1

    .line 334
    const/16 v0, 0x3e8

    const-string/jumbo v1, "weight"

    const/4 v2, 0x1

    invoke-static {p2, v2, v0, v1}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    .line 335
    if-nez p1, :cond_0

    .line 336
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 338
    :cond_0
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createWeightStyle(Landroid/content/Context;Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0

    .line 332
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createFromFontInfo(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroid/graphics/Typeface;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cancellationSignal"    # Landroid/os/CancellationSignal;
    .param p2, "fonts"    # [Landroidx/core/provider/FontsContractCompat$FontInfo;
    .param p3, "style"    # I

    .line 248
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createFromFontInfo(Landroid/content/Context;Landroid/os/CancellationSignal;[Landroidx/core/provider/FontsContractCompat$FontInfo;I)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public static createFromResourcesFamilyXml(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FamilyResourceEntry;Landroid/content/res/Resources;IILandroidx/core/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "entry"    # Landroidx/core/content/res/FontResourcesParserCompat$FamilyResourceEntry;
    .param p2, "resources"    # Landroid/content/res/Resources;
    .param p3, "id"    # I
    .param p4, "style"    # I
    .param p5, "fontCallback"    # Landroidx/core/content/res/ResourcesCompat$FontCallback;
    .param p6, "handler"    # Landroid/os/Handler;
    .param p7, "isRequestFromLayoutInflator"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 206
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v6, p4

    move-object v7, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    invoke-static/range {v0 .. v9}, Landroidx/core/graphics/TypefaceCompat;->createFromResourcesFamilyXml(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FamilyResourceEntry;Landroid/content/res/Resources;ILjava/lang/String;IILandroidx/core/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object v4

    return-object v4
.end method

.method public static createFromResourcesFamilyXml(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FamilyResourceEntry;Landroid/content/res/Resources;ILjava/lang/String;IILandroidx/core/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "entry"    # Landroidx/core/content/res/FontResourcesParserCompat$FamilyResourceEntry;
    .param p2, "resources"    # Landroid/content/res/Resources;
    .param p3, "id"    # I
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "cookie"    # I
    .param p6, "style"    # I
    .param p7, "fontCallback"    # Landroidx/core/content/res/ResourcesCompat$FontCallback;
    .param p8, "handler"    # Landroid/os/Handler;
    .param p9, "isRequestFromLayoutInflator"    # Z

    .line 149
    move-object/from16 v0, p7

    move-object/from16 v1, p8

    instance-of v2, p1, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;

    if-eqz v2, :cond_6

    .line 150
    move-object v2, p1

    check-cast v2, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;

    .line 152
    .local v2, "providerEntry":Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;
    nop

    .line 153
    invoke-virtual {v2}, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;->getSystemFontFamilyName()Ljava/lang/String;

    move-result-object v3

    .line 152
    invoke-static {v3}, Landroidx/core/graphics/TypefaceCompat;->getSystemFontFamily(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v3

    .line 154
    .local v3, "fontFamilyTypeface":Landroid/graphics/Typeface;
    if-eqz v3, :cond_1

    .line 155
    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {v0, v3, v1}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->callbackSuccessAsync(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    .line 158
    :cond_0
    return-object v3

    .line 161
    :cond_1
    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz p9, :cond_3

    .line 163
    nop

    .line 162
    invoke-virtual {v2}, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;->getFetchStrategy()I

    move-result v6

    if-nez v6, :cond_2

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_0

    .line 164
    :cond_3
    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    move v4, v5

    :goto_0
    move v8, v4

    .line 165
    .local v8, "isBlocking":Z
    if-eqz p9, :cond_5

    invoke-virtual {v2}, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;->getTimeout()I

    move-result v4

    move v9, v4

    goto :goto_1

    .line 166
    :cond_5
    const/4 v4, -0x1

    move v9, v4

    :goto_1
    nop

    .line 168
    .local v9, "timeout":I
    invoke-static {v1}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->getHandler(Landroid/os/Handler;)Landroid/os/Handler;

    move-result-object v10

    .line 169
    .local v10, "newHandler":Landroid/os/Handler;
    new-instance v11, Landroidx/core/graphics/TypefaceCompat$ResourcesCallbackAdapter;

    invoke-direct {v11, v0}, Landroidx/core/graphics/TypefaceCompat$ResourcesCallbackAdapter;-><init>(Landroidx/core/content/res/ResourcesCompat$FontCallback;)V

    .line 170
    .local v11, "newCallback":Landroidx/core/graphics/TypefaceCompat$ResourcesCallbackAdapter;
    invoke-virtual {v2}, Landroidx/core/content/res/FontResourcesParserCompat$ProviderResourceEntry;->getRequest()Landroidx/core/provider/FontRequest;

    move-result-object v6

    move-object v5, p0

    move/from16 v7, p6

    invoke-static/range {v5 .. v11}, Landroidx/core/provider/FontsContractCompat;->requestFont(Landroid/content/Context;Landroidx/core/provider/FontRequest;IZILandroid/os/Handler;Landroidx/core/provider/FontsContractCompat$FontRequestCallback;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 172
    .end local v3    # "fontFamilyTypeface":Landroid/graphics/Typeface;
    .end local v8    # "isBlocking":Z
    .end local v9    # "timeout":I
    .end local v10    # "newHandler":Landroid/os/Handler;
    .end local v11    # "newCallback":Landroidx/core/graphics/TypefaceCompat$ResourcesCallbackAdapter;
    .local v2, "typeface":Landroid/graphics/Typeface;
    goto :goto_2

    .line 173
    .end local v2    # "typeface":Landroid/graphics/Typeface;
    :cond_6
    sget-object v2, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    move-object v3, p1

    check-cast v3, Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;

    move/from16 v7, p6

    invoke-virtual {v2, p0, v3, p2, v7}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createFromFontFamilyFilesResourceEntry(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 175
    .restart local v2    # "typeface":Landroid/graphics/Typeface;
    if-eqz v0, :cond_8

    .line 176
    if-eqz v2, :cond_7

    .line 177
    invoke-virtual {v0, v2, v1}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->callbackSuccessAsync(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    goto :goto_2

    .line 179
    :cond_7
    const/4 v3, -0x3

    invoke-virtual {v0, v3, v1}, Landroidx/core/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V

    .line 185
    :cond_8
    :goto_2
    if-eqz v2, :cond_9

    .line 186
    sget-object v3, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-static/range {p2 .. p6}, Landroidx/core/graphics/TypefaceCompat;->createResourceUid(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    :cond_9
    return-object v2
.end method

.method public static createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "id"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "style"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 238
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v5, p4

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "resources":Landroid/content/res/Resources;
    .end local p2    # "id":I
    .end local p3    # "path":Ljava/lang/String;
    .end local p4    # "style":I
    .local v0, "context":Landroid/content/Context;
    .local v1, "resources":Landroid/content/res/Resources;
    .local v2, "id":I
    .local v3, "path":Ljava/lang/String;
    .local v5, "style":I
    invoke-static/range {v0 .. v5}, Landroidx/core/graphics/TypefaceCompat;->createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "id"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "cookie"    # I
    .param p5, "style"    # I

    .line 218
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p5

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "resources":Landroid/content/res/Resources;
    .end local p2    # "id":I
    .end local p3    # "path":Ljava/lang/String;
    .end local p5    # "style":I
    .local v1, "context":Landroid/content/Context;
    .local v2, "resources":Landroid/content/res/Resources;
    .local v3, "id":I
    .local v4, "path":Ljava/lang/String;
    .local v5, "style":I
    invoke-virtual/range {v0 .. v5}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    .line 220
    .local p0, "typeface":Landroid/graphics/Typeface;
    if-eqz p0, :cond_0

    .line 221
    invoke-static {v2, v3, v4, p4, v5}, Landroidx/core/graphics/TypefaceCompat;->createResourceUid(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    move-result-object p1

    .line 222
    .local p1, "resourceUid":Ljava/lang/String;
    sget-object p2, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {p2, p1, p0}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .end local p1    # "resourceUid":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method private static createResourceUid(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 2
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "cookie"    # I
    .param p4, "style"    # I

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 111
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 113
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 115
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 117
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    return-object v0
.end method

.method public static findFromCache(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "style"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 95
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Landroidx/core/graphics/TypefaceCompat;->findFromCache(Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public static findFromCache(Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "cookie"    # I
    .param p4, "style"    # I

    .line 82
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-static {p0, p1, p2, p3, p4}, Landroidx/core/graphics/TypefaceCompat;->createResourceUid(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Typeface;

    return-object v0
.end method

.method private static getBestFontFromFamily(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .line 257
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    invoke-virtual {v0, p1}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->getFontFamily(Landroid/graphics/Typeface;)Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;

    move-result-object v0

    .line 258
    .local v0, "families":Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;
    if-nez v0, :cond_0

    .line 259
    const/4 v1, 0x0

    return-object v1

    .line 262
    :cond_0
    sget-object v1, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    .line 263
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 262
    invoke-virtual {v1, p0, v0, v2, p2}, Landroidx/core/graphics/TypefaceCompatBaseImpl;->createFromFontFamilyFilesResourceEntry(Landroid/content/Context;Landroidx/core/content/res/FontResourcesParserCompat$FontFamilyFilesResourceEntry;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object v1

    return-object v1
.end method

.method private static getSystemFontFamily(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 4
    .param p0, "familyName"    # Ljava/lang/String;

    .line 129
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 130
    :cond_0
    const/4 v1, 0x0

    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 131
    .local v2, "typeface":Landroid/graphics/Typeface;
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    .line 132
    .local v1, "defaultTypeface":Landroid/graphics/Typeface;
    if-eqz v2, :cond_1

    invoke-virtual {v2, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    move-object v0, v2

    :cond_1
    return-object v0

    .line 129
    .end local v1    # "defaultTypeface":Landroid/graphics/Typeface;
    .end local v2    # "typeface":Landroid/graphics/Typeface;
    :cond_2
    :goto_0
    return-object v0
.end method
