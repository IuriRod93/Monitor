.class public Lorg/beeware/android/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field private static pythonApp:Lcom/chaquo/python/PyObject;

.field public static singletonThis:Lorg/beeware/android/MainActivity;


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 34
    const-string v0, "MainActivity"

    iput-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static setPythonApp(Lorg/beeware/android/IPythonApp;)V
    .locals 1
    .param p0, "app"    # Lorg/beeware/android/IPythonApp;

    .line 45
    invoke-static {p0}, Lcom/chaquo/python/PyObject;->fromJava(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    sput-object v0, Lorg/beeware/android/MainActivity;->pythonApp:Lcom/chaquo/python/PyObject;

    .line 46
    return-void
.end method

.method private varargs userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;
    .locals 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 202
    sget-object v0, Lorg/beeware/android/MainActivity;->pythonApp:Lcom/chaquo/python/PyObject;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 204
    return-object v1

    .line 207
    :cond_0
    :try_start_0
    sget-object v0, Lorg/beeware/android/MainActivity;->pythonApp:Lcom/chaquo/python/PyObject;

    invoke-virtual {v0, p1}, Lcom/chaquo/python/PyObject;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 208
    sget-object v0, Lorg/beeware/android/MainActivity;->pythonApp:Lcom/chaquo/python/PyObject;

    invoke-virtual {v0, p1, p2}, Lcom/chaquo/python/PyObject;->callAttr(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0
    :try_end_0
    .catch Lcom/chaquo/python/PyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 211
    :cond_1
    return-object v1

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Lcom/chaquo/python/PyException;
    invoke-virtual {v0}, Lcom/chaquo/python/PyException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NotImplementedError"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 215
    return-object v1

    .line 217
    :cond_2
    throw v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 164
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onActivityResult() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 166
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1, p3}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onActivityResult"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 167
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onActivityResult() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 171
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onConfigurationChanged() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 173
    const-string v0, "onConfigurationChanged"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 174
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onConfigurationChanged() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 55
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onCreate() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    sget v0, Lorg/beeware/calcme/calcme/R$style;->AppTheme:I

    invoke-virtual {p0, v0}, Lorg/beeware/android/MainActivity;->setTheme(I)V

    .line 58
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 60
    .local v0, "layout":Landroid/widget/LinearLayout;
    invoke-virtual {p0, v0}, Lorg/beeware/android/MainActivity;->setContentView(Landroid/view/View;)V

    .line 61
    sput-object p0, Lorg/beeware/android/MainActivity;->singletonThis:Lorg/beeware/android/MainActivity;

    .line 63
    invoke-virtual {p0}, Lorg/beeware/android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "org.beeware.ENVIRON"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "environStr":Ljava/lang/String;
    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 66
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 67
    .local v3, "environJson":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 68
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 69
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 70
    .local v6, "value":Ljava/lang/String;
    invoke-static {v5, v6, v2}, Landroid/system/Os;->setenv(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    goto :goto_0

    .line 76
    .end local v3    # "environJson":Lorg/json/JSONObject;
    .end local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    goto :goto_1

    .line 74
    :catch_0
    move-exception v2

    .line 75
    .local v2, "e":Landroid/system/ErrnoException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 72
    .end local v2    # "e":Landroid/system/ErrnoException;
    :catch_1
    move-exception v2

    .line 73
    .local v2, "e":Lorg/json/JSONException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 80
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_1
    invoke-static {}, Lcom/chaquo/python/Python;->isStarted()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    iget-object v3, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v4, "Python already started"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-static {}, Lcom/chaquo/python/Python;->getInstance()Lcom/chaquo/python/Python;

    move-result-object v3

    .local v3, "py":Lcom/chaquo/python/Python;
    goto :goto_4

    .line 84
    .end local v3    # "py":Lcom/chaquo/python/Python;
    :cond_2
    iget-object v3, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v4, "Starting Python"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    new-instance v3, Lcom/chaquo/python/android/AndroidPlatform;

    invoke-direct {v3, p0}, Lcom/chaquo/python/android/AndroidPlatform;-><init>(Landroid/content/Context;)V

    .line 86
    .local v3, "platform":Lcom/chaquo/python/android/AndroidPlatform;
    invoke-virtual {v3}, Lcom/chaquo/python/android/AndroidPlatform;->redirectStdioToLogcat()V

    .line 87
    invoke-static {v3}, Lcom/chaquo/python/Python;->start(Lcom/chaquo/python/Python$Platform;)V

    .line 88
    invoke-static {}, Lcom/chaquo/python/Python;->getInstance()Lcom/chaquo/python/Python;

    move-result-object v4

    .line 90
    .local v4, "py":Lcom/chaquo/python/Python;
    invoke-virtual {p0}, Lorg/beeware/android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "org.beeware.ARGV"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 91
    .local v5, "argvStr":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 93
    :try_start_1
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 94
    .local v6, "argvJson":Lorg/json/JSONArray;
    const-string v7, "sys"

    invoke-virtual {v4, v7}, Lcom/chaquo/python/Python;->getModule(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v7

    const-string v8, "argv"

    invoke-virtual {v7, v8}, Lcom/chaquo/python/PyObject;->get(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v7

    invoke-virtual {v7}, Lcom/chaquo/python/PyObject;->asList()Ljava/util/List;

    move-result-object v7

    .line 95
    .local v7, "sysArgv":Ljava/util/List;, "Ljava/util/List<Lcom/chaquo/python/PyObject;>;"
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_3

    .line 96
    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/chaquo/python/PyObject;->fromJava(Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 95
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 100
    .end local v6    # "argvJson":Lorg/json/JSONArray;
    .end local v7    # "sysArgv":Ljava/util/List;, "Ljava/util/List<Lcom/chaquo/python/PyObject;>;"
    .end local v8    # "i":I
    :cond_3
    goto :goto_3

    .line 98
    :catch_2
    move-exception v2

    .line 99
    .restart local v2    # "e":Lorg/json/JSONException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 104
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v3    # "platform":Lcom/chaquo/python/android/AndroidPlatform;
    .end local v5    # "argvStr":Ljava/lang/String;
    :cond_4
    :goto_3
    move-object v3, v4

    .end local v4    # "py":Lcom/chaquo/python/Python;
    .local v3, "py":Lcom/chaquo/python/Python;
    :goto_4
    iget-object v4, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Running main module "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget v6, Lorg/beeware/calcme/calcme/R$string;->main_module:I

    invoke-virtual {p0, v6}, Lorg/beeware/android/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const-string v4, "runpy"

    invoke-virtual {v3, v4}, Lcom/chaquo/python/Python;->getModule(Ljava/lang/String;)Lcom/chaquo/python/PyObject;

    move-result-object v4

    sget v5, Lorg/beeware/calcme/calcme/R$string;->main_module:I

    .line 107
    invoke-virtual {p0, v5}, Lorg/beeware/android/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/chaquo/python/Kwarg;

    const-string v7, "run_name"

    const-string v8, "__main__"

    invoke-direct {v6, v7, v8}, Lcom/chaquo/python/Kwarg;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v7, Lcom/chaquo/python/Kwarg;

    .line 109
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v8, "alter_sys"

    invoke-direct {v7, v8, v2}, Lcom/chaquo/python/Kwarg;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    filled-new-array {v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v2

    .line 105
    const-string v5, "run_module"

    invoke-virtual {v4, v5, v2}, Lcom/chaquo/python/PyObject;->callAttr(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 112
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "onCreate"

    invoke-direct {p0, v4, v2}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 113
    iget-object v2, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v4, "onCreate() complete"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 144
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 146
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onDestroy"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 147
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "menuitem"    # Landroid/view/MenuItem;

    .line 178
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onOptionsItemSelected() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    const-string v0, "onOptionsItemSelected"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    .line 180
    .local v0, "pyResult":Lcom/chaquo/python/PyObject;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/chaquo/python/PyObject;->toBoolean()Z

    move-result v1

    .line 181
    .local v1, "result":Z
    :goto_0
    iget-object v2, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v3, "onOptionsItemSelected() complete"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    return v1
.end method

.method protected onPause()V
    .locals 2

    .line 131
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPause() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 133
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onPause"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 134
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPause() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;

    .line 186
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPrepareOptionsMenu() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const-string v0, "onPrepareOptionsMenu"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    move-result-object v0

    .line 188
    .local v0, "pyResult":Lcom/chaquo/python/PyObject;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/chaquo/python/PyObject;->toBoolean()Z

    move-result v1

    .line 189
    .local v1, "result":Z
    :goto_0
    iget-object v2, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v3, "onPrepareOptionsMenu() complete"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    return v1
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 195
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onRequestPermissionsResult() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 197
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0, p2, p3}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onRequestPermissionsResult"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 198
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onRequestPermissionsResult() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .line 150
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onRestart() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onRestart()V

    .line 152
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onRestart"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 153
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onRestart() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 124
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onResume() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 126
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onResume"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 127
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onResume() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 117
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStart() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 119
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onStart"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 120
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStart() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 138
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStop() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 140
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onStop"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 141
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onStop() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    return-void
.end method

.method public onTopResumedActivityChanged(Z)V
    .locals 2
    .param p1, "isTopResumedActivity"    # Z

    .line 156
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onTopResumedActivityChanged() start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onTopResumedActivityChanged(Z)V

    .line 158
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onTopResumedActivityChanged"

    invoke-direct {p0, v1, v0}, Lorg/beeware/android/MainActivity;->userCode(Ljava/lang/String;[Ljava/lang/Object;)Lcom/chaquo/python/PyObject;

    .line 159
    iget-object v0, p0, Lorg/beeware/android/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onTopResumedActivityChanged() complete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return-void
.end method
