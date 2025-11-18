.class Lcom/chaquo/python/PyMap;
.super Ljava/util/AbstractMap;
.source "PyMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap<",
        "Lcom/chaquo/python/PyObject;",
        "Lcom/chaquo/python/PyObject;",
        ">;"
    }
.end annotation


# instance fields
.field private final methods:Lcom/chaquo/python/MethodCache;

.field private final obj:Lcom/chaquo/python/PyObject;


# direct methods
.method public constructor <init>(Lcom/chaquo/python/PyObject;)V
    .locals 2
    .param p1, "obj"    # Lcom/chaquo/python/PyObject;

    .line 11
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/chaquo/python/PyMap;->obj:Lcom/chaquo/python/PyObject;

    .line 13
    new-instance v0, Lcom/chaquo/python/MethodCache;

    invoke-direct {v0, p1}, Lcom/chaquo/python/MethodCache;-><init>(Lcom/chaquo/python/PyObject;)V

    iput-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    .line 14
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__contains__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    .line 15
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__getitem__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    .line 16
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__iter__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    .line 17
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__len__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    .line 18
    return-void
.end method

.method static synthetic access$000(Lcom/chaquo/python/PyMap;)Lcom/chaquo/python/MethodCache;
    .locals 1
    .param p0, "x0"    # Lcom/chaquo/python/PyMap;

    .line 7
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    return-object v0
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 50
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__contains__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chaquo/python/PyObject;->call([Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chaquo/python/PyObject;->toBoolean()Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/chaquo/python/PyObject;",
            "Lcom/chaquo/python/PyObject;",
            ">;>;"
        }
    .end annotation

    .line 21
    new-instance v0, Lcom/chaquo/python/PyMap$1;

    invoke-direct {v0, p0}, Lcom/chaquo/python/PyMap$1;-><init>(Lcom/chaquo/python/PyMap;)V

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 58
    :try_start_0
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "__getitem__"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chaquo/python/PyObject;->call([Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0
    :try_end_0
    .catch Lcom/chaquo/python/PyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lcom/chaquo/python/PyException;
    invoke-virtual {v0}, Lcom/chaquo/python/PyException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "KeyError:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 61
    const/4 v1, 0x0

    return-object v1

    .line 63
    :cond_0
    throw v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/chaquo/python/PyMap;->get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object p1

    return-object p1
.end method

.method public put(Lcom/chaquo/python/PyObject;Lcom/chaquo/python/PyObject;)Lcom/chaquo/python/PyObject;
    .locals 3
    .param p1, "key"    # Lcom/chaquo/python/PyObject;
    .param p2, "value"    # Lcom/chaquo/python/PyObject;

    .line 74
    invoke-virtual {p0, p1}, Lcom/chaquo/python/PyMap;->get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    .line 75
    .local v0, "oldElement":Lcom/chaquo/python/PyObject;
    iget-object v1, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v2, "__setitem__"

    invoke-virtual {v1, v2}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v1

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/chaquo/python/PyObject;->call([Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 76
    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 7
    check-cast p1, Lcom/chaquo/python/PyObject;

    check-cast p2, Lcom/chaquo/python/PyObject;

    invoke-virtual {p0, p1, p2}, Lcom/chaquo/python/PyMap;->put(Lcom/chaquo/python/PyObject;Lcom/chaquo/python/PyObject;)Lcom/chaquo/python/PyObject;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 80
    iget-object v0, p0, Lcom/chaquo/python/PyMap;->methods:Lcom/chaquo/python/MethodCache;

    const-string v1, "pop"

    invoke-virtual {v0, v1}, Lcom/chaquo/python/MethodCache;->get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    const/4 v1, 0x0

    filled-new-array {p1, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chaquo/python/PyObject;->call([Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/chaquo/python/PyMap;->remove(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object p1

    return-object p1
.end method
