.class Landroidx/core/provider/FontProvider;
.super Ljava/lang/Object;
.source "FontProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/provider/FontProvider$Api16Impl;
    }
.end annotation


# static fields
.field private static final sByteArrayComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 197
    new-instance v0, Landroidx/core/provider/FontProvider$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/core/provider/FontProvider$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Landroidx/core/provider/FontProvider;->sByteArrayComparator:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertToByteArrayList([Landroid/content/pm/Signature;)Ljava/util/List;
    .locals 5
    .param p0, "signatures"    # [Landroid/content/pm/Signature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/content/pm/Signature;",
            ")",
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v0, "shaList":Ljava/util/List;, "Ljava/util/List<[B>;"
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 225
    .local v3, "signature":Landroid/content/pm/Signature;
    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    .end local v3    # "signature":Landroid/content/pm/Signature;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 227
    :cond_0
    return-object v0
.end method

.method private static equalsByteArrayList(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;",
            "Ljava/util/List<",
            "[B>;)Z"
        }
    .end annotation

    .line 211
    .local p0, "signatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    .local p1, "requestSignatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 212
    return v2

    .line 214
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 215
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_1

    .line 216
    return v2

    .line 214
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 219
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private static getCertificates(Landroidx/core/provider/FontRequest;Landroid/content/res/Resources;)Ljava/util/List;
    .locals 2
    .param p0, "request"    # Landroidx/core/provider/FontRequest;
    .param p1, "resources"    # Landroid/content/res/Resources;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/provider/FontRequest;",
            "Landroid/content/res/Resources;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[B>;>;"
        }
    .end annotation

    .line 190
    invoke-virtual {p0}, Landroidx/core/provider/FontRequest;->getCertificates()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Landroidx/core/provider/FontRequest;->getCertificates()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 193
    :cond_0
    invoke-virtual {p0}, Landroidx/core/provider/FontRequest;->getCertificatesArrayResId()I

    move-result v0

    .line 194
    .local v0, "resourceId":I
    invoke-static {p1, v0}, Landroidx/core/content/res/FontResourcesParserCompat;->readCerts(Landroid/content/res/Resources;I)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method static getFontFamilyResult(Landroid/content/Context;Landroidx/core/provider/FontRequest;Landroid/os/CancellationSignal;)Landroidx/core/provider/FontsContractCompat$FontFamilyResult;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Landroidx/core/provider/FontRequest;
    .param p2, "cancellationSignal"    # Landroid/os/CancellationSignal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 55
    nop

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 55
    invoke-static {v0, p1, v1}, Landroidx/core/provider/FontProvider;->getProvider(Landroid/content/pm/PackageManager;Landroidx/core/provider/FontRequest;Landroid/content/res/Resources;)Landroid/content/pm/ProviderInfo;

    move-result-object v0

    .line 57
    .local v0, "providerInfo":Landroid/content/pm/ProviderInfo;
    if-nez v0, :cond_0

    .line 58
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->create(I[Landroidx/core/provider/FontsContractCompat$FontInfo;)Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    move-result-object v1

    return-object v1

    .line 61
    :cond_0
    iget-object v1, v0, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    invoke-static {p0, p1, v1, p2}, Landroidx/core/provider/FontProvider;->query(Landroid/content/Context;Landroidx/core/provider/FontRequest;Ljava/lang/String;Landroid/os/CancellationSignal;)[Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v1

    .line 63
    .local v1, "fonts":[Landroidx/core/provider/FontsContractCompat$FontInfo;
    const/4 v2, 0x0

    invoke-static {v2, v1}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->create(I[Landroidx/core/provider/FontsContractCompat$FontInfo;)Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    move-result-object v2

    return-object v2
.end method

.method static getProvider(Landroid/content/pm/PackageManager;Landroidx/core/provider/FontRequest;Landroid/content/res/Resources;)Landroid/content/pm/ProviderInfo;
    .locals 8
    .param p0, "packageManager"    # Landroid/content/pm/PackageManager;
    .param p1, "request"    # Landroidx/core/provider/FontRequest;
    .param p2, "resources"    # Landroid/content/res/Resources;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 77
    invoke-virtual {p1}, Landroidx/core/provider/FontRequest;->getProviderAuthority()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "providerAuthority":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object v1

    .line 79
    .local v1, "info":Landroid/content/pm/ProviderInfo;
    if-eqz v1, :cond_3

    .line 84
    iget-object v2, v1, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1}, Landroidx/core/provider/FontRequest;->getProviderPackage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 93
    iget-object v2, v1, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    const/16 v3, 0x40

    invoke-virtual {p0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 95
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    invoke-static {v3}, Landroidx/core/provider/FontProvider;->convertToByteArrayList([Landroid/content/pm/Signature;)Ljava/util/List;

    move-result-object v3

    .line 96
    .local v3, "signatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    sget-object v4, Landroidx/core/provider/FontProvider;->sByteArrayComparator:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 97
    invoke-static {p1, p2}, Landroidx/core/provider/FontProvider;->getCertificates(Landroidx/core/provider/FontRequest;Landroid/content/res/Resources;)Ljava/util/List;

    move-result-object v4

    .line 98
    .local v4, "requestCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<[B>;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 100
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 101
    .local v6, "requestSignatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    sget-object v7, Landroidx/core/provider/FontProvider;->sByteArrayComparator:Ljava/util/Comparator;

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 102
    invoke-static {v3, v6}, Landroidx/core/provider/FontProvider;->equalsByteArrayList(Ljava/util/List;Ljava/util/List;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 103
    return-object v1

    .line 98
    .end local v6    # "requestSignatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 106
    .end local v5    # "i":I
    :cond_1
    const/4 v5, 0x0

    return-object v5

    .line 85
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "signatures":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v4    # "requestCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<[B>;>;"
    :cond_2
    new-instance v2, Landroid/content/pm/PackageManager$NameNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Found content provider "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", but package was not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 87
    invoke-virtual {p1}, Landroidx/core/provider/FontRequest;->getProviderPackage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_3
    new-instance v2, Landroid/content/pm/PackageManager$NameNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No package found for authority: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static synthetic lambda$static$0([B[B)I
    .locals 3
    .param p0, "l"    # [B
    .param p1, "r"    # [B

    .line 198
    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_0

    .line 199
    array-length v0, p0

    array-length v1, p1

    sub-int/2addr v0, v1

    return v0

    .line 201
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_2

    .line 202
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    if-eq v1, v2, :cond_1

    .line 203
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    sub-int/2addr v1, v2

    return v1

    .line 201
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 206
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method static query(Landroid/content/Context;Landroidx/core/provider/FontRequest;Ljava/lang/String;Landroid/os/CancellationSignal;)[Landroidx/core/provider/FontsContractCompat$FontInfo;
    .locals 22
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Landroidx/core/provider/FontRequest;
    .param p2, "authority"    # Ljava/lang/String;
    .param p3, "cancellationSignal"    # Landroid/os/CancellationSignal;

    .line 120
    move-object/from16 v1, p2

    const-string v0, "result_code"

    const-string v2, "font_italic"

    const-string v3, "font_weight"

    const-string v4, "font_ttc_index"

    const-string v5, "file_id"

    const-string v6, "_id"

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v7, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/core/provider/FontsContractCompat$FontInfo;>;"
    new-instance v8, Landroid/net/Uri$Builder;

    invoke-direct {v8}, Landroid/net/Uri$Builder;-><init>()V

    const-string v9, "content"

    invoke-virtual {v8, v9}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 122
    invoke-virtual {v8, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 123
    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v11

    .line 124
    .local v11, "uri":Landroid/net/Uri;
    new-instance v8, Landroid/net/Uri$Builder;

    invoke-direct {v8}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v8, v9}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 125
    invoke-virtual {v8, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 126
    const-string v9, "file"

    invoke-virtual {v8, v9}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 127
    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v8

    .line 128
    .local v8, "fileBaseUri":Landroid/net/Uri;
    const/4 v9, 0x0

    .line 130
    .local v9, "cursor":Landroid/database/Cursor;
    const/4 v10, 0x7

    :try_start_0
    new-array v12, v10, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v6, v12, v10

    const/4 v13, 0x1

    aput-object v5, v12, v13

    const/4 v14, 0x2

    aput-object v4, v12, v14

    const-string v14, "font_variation_settings"

    const/4 v15, 0x3

    aput-object v14, v12, v15

    const/4 v14, 0x4

    aput-object v3, v12, v14

    const/4 v14, 0x5

    aput-object v2, v12, v14

    const/4 v14, 0x6

    aput-object v0, v12, v14

    .line 137
    .local v12, "projection":[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    .line 138
    .local v14, "resolver":Landroid/content/ContentResolver;
    nop

    .line 139
    const-string v15, "query = ?"

    move/from16 v16, v10

    move-object v10, v14

    .end local v14    # "resolver":Landroid/content/ContentResolver;
    .local v10, "resolver":Landroid/content/ContentResolver;
    new-array v14, v13, [Ljava/lang/String;

    .line 140
    invoke-virtual/range {p1 .. p1}, Landroidx/core/provider/FontRequest;->getQuery()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v14, v16

    .line 139
    move/from16 v17, v13

    move-object v13, v15

    const/4 v15, 0x0

    move-object/from16 v16, p3

    move/from16 v1, v17

    invoke-static/range {v10 .. v16}, Landroidx/core/provider/FontProvider$Api16Impl;->query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Landroid/database/Cursor;

    move-result-object v13

    move-object v9, v13

    .line 147
    if-eqz v9, :cond_7

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v13

    if-lez v13, :cond_7

    .line 148
    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 150
    .local v0, "resultCodeColumnIndex":I
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v13

    .line 151
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 152
    .local v6, "idColumnIndex":I
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 154
    .local v5, "fileIdColumnIndex":I
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 156
    .local v4, "ttcIndexColumnIndex":I
    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 158
    .local v3, "weightColumnIndex":I
    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 160
    .local v2, "italicColumnIndex":I
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 161
    const/4 v13, -0x1

    if-eq v0, v13, :cond_0

    .line 162
    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    goto :goto_1

    .line 163
    :cond_0
    const/4 v14, 0x0

    :goto_1
    nop

    .line 164
    .local v14, "resultCode":I
    if-eq v4, v13, :cond_1

    .line 165
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    goto :goto_2

    :cond_1
    const/4 v15, 0x0

    .line 167
    .local v15, "ttcIndex":I
    :goto_2
    if-ne v5, v13, :cond_2

    .line 168
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    move-wide/from16 v20, v18

    .line 169
    .local v20, "id":J
    move/from16 v18, v2

    move-wide/from16 v1, v20

    .end local v2    # "italicColumnIndex":I
    .end local v20    # "id":J
    .local v1, "id":J
    .local v18, "italicColumnIndex":I
    invoke-static {v11, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v19

    .line 170
    .end local v1    # "id":J
    .local v19, "fileUri":Landroid/net/Uri;
    move-object/from16 v1, v19

    goto :goto_3

    .line 171
    .end local v18    # "italicColumnIndex":I
    .end local v19    # "fileUri":Landroid/net/Uri;
    .restart local v2    # "italicColumnIndex":I
    :cond_2
    move/from16 v18, v2

    .end local v2    # "italicColumnIndex":I
    .restart local v18    # "italicColumnIndex":I
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 172
    .restart local v1    # "id":J
    invoke-static {v8, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v19

    move-object/from16 v1, v19

    .line 175
    .local v1, "fileUri":Landroid/net/Uri;
    :goto_3
    if-eq v3, v13, :cond_3

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    goto :goto_4

    :cond_3
    const/16 v2, 0x190

    .line 176
    .local v2, "weight":I
    :goto_4
    move/from16 v19, v0

    move/from16 v0, v18

    .end local v18    # "italicColumnIndex":I
    .local v0, "italicColumnIndex":I
    .local v19, "resultCodeColumnIndex":I
    if-eq v0, v13, :cond_4

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    move/from16 v18, v0

    const/4 v0, 0x1

    .end local v0    # "italicColumnIndex":I
    .restart local v18    # "italicColumnIndex":I
    if-ne v13, v0, :cond_5

    move v13, v0

    goto :goto_5

    .end local v18    # "italicColumnIndex":I
    .restart local v0    # "italicColumnIndex":I
    :cond_4
    move/from16 v18, v0

    const/4 v0, 0x1

    .end local v0    # "italicColumnIndex":I
    .restart local v18    # "italicColumnIndex":I
    :cond_5
    const/4 v13, 0x0

    .line 178
    .local v13, "italic":Z
    :goto_5
    invoke-static {v1, v15, v2, v13, v14}, Landroidx/core/provider/FontsContractCompat$FontInfo;->create(Landroid/net/Uri;IIZI)Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    move/from16 v2, v18

    move/from16 v0, v19

    const/4 v1, 0x1

    .end local v1    # "fileUri":Landroid/net/Uri;
    .end local v2    # "weight":I
    .end local v13    # "italic":Z
    .end local v14    # "resultCode":I
    .end local v15    # "ttcIndex":I
    goto :goto_0

    .line 160
    .end local v18    # "italicColumnIndex":I
    .end local v19    # "resultCodeColumnIndex":I
    .local v0, "resultCodeColumnIndex":I
    .local v2, "italicColumnIndex":I
    :cond_6
    move/from16 v19, v0

    move/from16 v18, v2

    .line 182
    .end local v0    # "resultCodeColumnIndex":I
    .end local v2    # "italicColumnIndex":I
    .end local v3    # "weightColumnIndex":I
    .end local v4    # "ttcIndexColumnIndex":I
    .end local v5    # "fileIdColumnIndex":I
    .end local v6    # "idColumnIndex":I
    .end local v10    # "resolver":Landroid/content/ContentResolver;
    .end local v12    # "projection":[Ljava/lang/String;
    :cond_7
    if-eqz v9, :cond_8

    .line 183
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 186
    :cond_8
    const/4 v0, 0x0

    new-array v0, v0, [Landroidx/core/provider/FontsContractCompat$FontInfo;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/core/provider/FontsContractCompat$FontInfo;

    return-object v0

    .line 182
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_9

    .line 183
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 185
    :cond_9
    throw v0
.end method
