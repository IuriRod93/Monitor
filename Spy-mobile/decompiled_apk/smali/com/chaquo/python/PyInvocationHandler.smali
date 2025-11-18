.class public Lcom/chaquo/python/PyInvocationHandler;
.super Ljava/lang/Object;
.source "PyInvocationHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field private dict:Lcom/chaquo/python/PyObject;

.field private type:Lcom/chaquo/python/PyObject;


# direct methods
.method public constructor <init>(Lcom/chaquo/python/PyObject;)V
    .locals 0
    .param p1, "type"    # Lcom/chaquo/python/PyObject;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/chaquo/python/PyInvocationHandler;->type:Lcom/chaquo/python/PyObject;

    .line 13
    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 17
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "methodName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v1, "_chaquopyGetType"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_1

    :sswitch_1
    const-string v1, "_chaquopyGetDict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_2
    const-string v1, "_chaquopySetDict"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    .line 27
    invoke-static {p1}, Lcom/chaquo/python/PyObject;->fromJava(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v1

    .line 28
    .local v1, "self":Lcom/chaquo/python/PyObject;
    if-nez p3, :cond_1

    .line 29
    new-array p3, v2, [Ljava/lang/Object;

    goto :goto_2

    .line 24
    .end local v1    # "self":Lcom/chaquo/python/PyObject;
    :pswitch_0
    aget-object v1, p3, v2

    check-cast v1, Lcom/chaquo/python/PyObject;

    iput-object v1, p0, Lcom/chaquo/python/PyInvocationHandler;->dict:Lcom/chaquo/python/PyObject;

    .line 25
    return-object v3

    .line 22
    :pswitch_1
    iget-object v1, p0, Lcom/chaquo/python/PyInvocationHandler;->dict:Lcom/chaquo/python/PyObject;

    return-object v1

    .line 20
    :pswitch_2
    iget-object v1, p0, Lcom/chaquo/python/PyInvocationHandler;->type:Lcom/chaquo/python/PyObject;

    return-object v1

    .line 31
    .restart local v1    # "self":Lcom/chaquo/python/PyObject;
    :cond_1
    :goto_2
    invoke-virtual {v1, v0, p3}, Lcom/chaquo/python/PyObject;->callAttrThrows(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v2

    .line 32
    .local v2, "result":Lcom/chaquo/python/PyObject;
    if-nez v2, :cond_2

    goto :goto_3

    :cond_2
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/chaquo/python/PyObject;->toJava(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    :goto_3
    return-object v3

    :sswitch_data_0
    .sparse-switch
        -0x3a9cdd1f -> :sswitch_2
        0x4a985bd5 -> :sswitch_1
        0x4a9fdf59 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
