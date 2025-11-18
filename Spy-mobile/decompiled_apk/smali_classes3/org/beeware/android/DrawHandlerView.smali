.class public Lorg/beeware/android/DrawHandlerView;
.super Landroid/view/View;
.source "DrawHandlerView.java"


# instance fields
.field private drawHandler:Lorg/beeware/android/IDrawHandler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 7
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/beeware/android/DrawHandlerView;->drawHandler:Lorg/beeware/android/IDrawHandler;

    .line 8
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 15
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 16
    iget-object v0, p0, Lorg/beeware/android/DrawHandlerView;->drawHandler:Lorg/beeware/android/IDrawHandler;

    invoke-interface {v0, p1}, Lorg/beeware/android/IDrawHandler;->handleDraw(Landroid/graphics/Canvas;)V

    .line 17
    return-void
.end method

.method public setDrawHandler(Lorg/beeware/android/IDrawHandler;)V
    .locals 0
    .param p1, "drawHandler"    # Lorg/beeware/android/IDrawHandler;

    .line 11
    iput-object p1, p0, Lorg/beeware/android/DrawHandlerView;->drawHandler:Lorg/beeware/android/IDrawHandler;

    .line 12
    return-void
.end method
