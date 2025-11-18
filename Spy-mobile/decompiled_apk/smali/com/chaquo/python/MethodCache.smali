.class Lcom/chaquo/python/MethodCache;
.super Ljava/lang/Object;
.source "MethodCache.java"


# instance fields
.field private cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/chaquo/python/PyObject;",
            ">;"
        }
    .end annotation
.end field

.field private obj:Lcom/chaquo/python/PyObject;


# direct methods
.method public constructor <init>(Lcom/chaquo/python/PyObject;)V
    .locals 1
    .param p1, "obj"    # Lcom/chaquo/python/PyObject;

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/chaquo/python/MethodCache;->cache:Ljava/util/Map;

    .line 11
    iput-object p1, p0, Lcom/chaquo/python/MethodCache;->obj:Lcom/chaquo/python/PyObject;

    .line 12
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lcom/chaquo/python/PyObject;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 15
    iget-object v0, p0, Lcom/chaquo/python/MethodCache;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/chaquo/python/PyObject;

    .line 16
    .local v0, "value":Lcom/chaquo/python/PyObject;
    if-nez v0, :cond_1

    .line 17
    iget-object v1, p0, Lcom/chaquo/python/MethodCache;->obj:Lcom/chaquo/python/PyObject;

    invoke-virtual {v1, p1}, Lcom/chaquo/python/PyObject;->get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 24
    iget-object v1, p0, Lcom/chaquo/python/MethodCache;->cache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 20
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    iget-object v2, p0, Lcom/chaquo/python/MethodCache;->obj:Lcom/chaquo/python/PyObject;

    .line 22
    invoke-virtual {v2}, Lcom/chaquo/python/PyObject;->type()Lcom/chaquo/python/PyObject;

    move-result-object v2

    const-string v3, "__name__"

    invoke-virtual {v2, v3}, Lcom/chaquo/python/PyObject;->get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v2

    filled-new-array {v2, p1}, [Ljava/lang/Object;

    move-result-object v2

    .line 21
    const-string v3, "\'%s\' object has no attribute \'%s\'"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 26
    :cond_1
    :goto_0
    return-object v0
.end method
