.class Landroidx/activity/ComponentActivity$1;
.super Landroidx/activity/result/ActivityResultRegistry;
.source "ComponentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/ComponentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/activity/ComponentActivity;


# direct methods
.method constructor <init>(Landroidx/activity/ComponentActivity;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/activity/ComponentActivity;

    .line 172
    iput-object p1, p0, Landroidx/activity/ComponentActivity$1;->this$0:Landroidx/activity/ComponentActivity;

    invoke-direct {p0}, Landroidx/activity/result/ActivityResultRegistry;-><init>()V

    return-void
.end method


# virtual methods
.method public onLaunch(ILandroidx/activity/result/contract/ActivityResultContract;Ljava/lang/Object;Landroidx/core/app/ActivityOptionsCompat;)V
    .locals 14
    .param p1, "requestCode"    # I
    .param p4, "options"    # Landroidx/core/app/ActivityOptionsCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(I",
            "Landroidx/activity/result/contract/ActivityResultContract<",
            "TI;TO;>;TI;",
            "Landroidx/core/app/ActivityOptionsCompat;",
            ")V"
        }
    .end annotation

    .line 181
    .local p2, "contract":Landroidx/activity/result/contract/ActivityResultContract;, "Landroidx/activity/result/contract/ActivityResultContract<TI;TO;>;"
    .local p3, "input":Ljava/lang/Object;, "TI;"
    move-object/from16 v1, p2

    move-object/from16 v2, p3

    iget-object v3, p0, Landroidx/activity/ComponentActivity$1;->this$0:Landroidx/activity/ComponentActivity;

    .line 184
    .local v3, "activity":Landroidx/activity/ComponentActivity;
    nop

    .line 185
    invoke-virtual {v1, v3, v2}, Landroidx/activity/result/contract/ActivityResultContract;->getSynchronousResult(Landroid/content/Context;Ljava/lang/Object;)Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;

    move-result-object v11

    .line 186
    .local v11, "synchronousResult":Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult;, "Landroidx/activity/result/contract/ActivityResultContract$SynchronousResult<TO;>;"
    if-eqz v11, :cond_0

    .line 187
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Landroidx/activity/ComponentActivity$1$1;

    invoke-direct {v4, p0, p1, v11}, Landroidx/activity/ComponentActivity$1$1;-><init>(Landroidx/activity/ComponentActivity$1;ILandroidx/activity/result/contract/ActivityResultContract$SynchronousResult;)V

    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 193
    return-void

    .line 197
    :cond_0
    invoke-virtual {v1, v3, v2}, Landroidx/activity/result/contract/ActivityResultContract;->createIntent(Landroid/content/Context;Ljava/lang/Object;)Landroid/content/Intent;

    move-result-object v12

    .line 198
    .local v12, "intent":Landroid/content/Intent;
    const/4 v0, 0x0

    .line 200
    .local v0, "optionsBundle":Landroid/os/Bundle;
    invoke-virtual {v12}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v12}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Bundle;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    if-nez v4, :cond_1

    .line 201
    invoke-virtual {v3}, Landroidx/activity/ComponentActivity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 203
    :cond_1
    const-string v4, "androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE"

    invoke-virtual {v12, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 204
    invoke-virtual {v12, v4}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 205
    invoke-virtual {v12, v4}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    move-object v10, v0

    goto :goto_0

    .line 206
    :cond_2
    if-eqz p4, :cond_3

    .line 207
    invoke-virtual/range {p4 .. p4}, Landroidx/core/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    move-object v10, v0

    goto :goto_0

    .line 206
    :cond_3
    move-object v10, v0

    .line 209
    .end local v0    # "optionsBundle":Landroid/os/Bundle;
    .local v10, "optionsBundle":Landroid/os/Bundle;
    :goto_0
    const-string v0, "androidx.activity.result.contract.action.REQUEST_PERMISSIONS"

    invoke-virtual {v12}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 212
    const-string v0, "androidx.activity.result.contract.extra.PERMISSIONS"

    invoke-virtual {v12, v0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "permissions":[Ljava/lang/String;
    if-nez v0, :cond_4

    .line 215
    const/4 v4, 0x0

    new-array v0, v4, [Ljava/lang/String;

    .line 218
    :cond_4
    invoke-static {v3, v0, p1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 219
    .end local v0    # "permissions":[Ljava/lang/String;
    goto :goto_2

    :cond_5
    const-string v0, "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"

    invoke-virtual {v12}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 220
    nop

    .line 221
    const-string v0, "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"

    invoke-virtual {v12, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroidx/activity/result/IntentSenderRequest;

    .line 224
    .local v13, "request":Landroidx/activity/result/IntentSenderRequest;
    :try_start_0
    invoke-virtual {v13}, Landroidx/activity/result/IntentSenderRequest;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v4

    .line 225
    invoke-virtual {v13}, Landroidx/activity/result/IntentSenderRequest;->getFillInIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v13}, Landroidx/activity/result/IntentSenderRequest;->getFlagsMask()I

    move-result v7

    .line 226
    invoke-virtual {v13}, Landroidx/activity/result/IntentSenderRequest;->getFlagsValues()I

    move-result v8

    .line 224
    const/4 v9, 0x0

    move v5, p1

    invoke-static/range {v3 .. v10}, Landroidx/core/app/ActivityCompat;->startIntentSenderForResult(Landroid/app/Activity;Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    goto :goto_1

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Landroid/content/IntentSender$SendIntentException;
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Landroidx/activity/ComponentActivity$1$2;

    invoke-direct {v6, p0, p1, v0}, Landroidx/activity/ComponentActivity$1$2;-><init>(Landroidx/activity/ComponentActivity$1;ILandroid/content/IntentSender$SendIntentException;)V

    invoke-virtual {v4, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 237
    .end local v0    # "e":Landroid/content/IntentSender$SendIntentException;
    .end local v13    # "request":Landroidx/activity/result/IntentSenderRequest;
    :goto_1
    goto :goto_2

    .line 239
    :cond_6
    invoke-static {v3, v12, p1, v10}, Landroidx/core/app/ActivityCompat;->startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 241
    :goto_2
    return-void
.end method
