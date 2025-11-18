.class public Lcom/chaquo/python/Python$Platform;
.super Ljava/lang/Object;
.source "Python.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chaquo/python/Python;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Platform"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .locals 1

    .line 18
    const/4 v0, 0x0

    return-object v0
.end method

.method public onStart(Lcom/chaquo/python/Python;)V
    .locals 0
    .param p1, "py"    # Lcom/chaquo/python/Python;

    .line 21
    return-void
.end method
