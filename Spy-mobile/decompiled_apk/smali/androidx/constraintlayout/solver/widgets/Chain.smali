.class Landroidx/constraintlayout/solver/widgets/Chain;
.super Ljava/lang/Object;
.source "Chain.java"


# static fields
.field private static final DEBUG:Z = false


# direct methods
.method constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;I)V
    .locals 5
    .param p0, "constraintWidgetContainer"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;
    .param p1, "system"    # Landroidx/constraintlayout/solver/LinearSystem;
    .param p2, "orientation"    # I

    .line 46
    const/4 v0, 0x0

    .line 47
    .local v0, "offset":I
    const/4 v1, 0x0

    .line 48
    .local v1, "chainsSize":I
    const/4 v2, 0x0

    .line 49
    .local v2, "chainsArray":[Landroidx/constraintlayout/solver/widgets/ChainHead;
    if-nez p2, :cond_0

    .line 50
    const/4 v0, 0x0

    .line 51
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 52
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    goto :goto_0

    .line 54
    :cond_0
    const/4 v0, 0x2

    .line 55
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 56
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 59
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 60
    aget-object v4, v2, v3

    .line 63
    .local v4, "first":Landroidx/constraintlayout/solver/widgets/ChainHead;
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ChainHead;->define()V

    .line 64
    invoke-static {p0, p1, p2, v0, v4}, Landroidx/constraintlayout/solver/widgets/Chain;->applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;IILandroidx/constraintlayout/solver/widgets/ChainHead;)V

    .line 59
    .end local v4    # "first":Landroidx/constraintlayout/solver/widgets/ChainHead;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 66
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method static applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;IILandroidx/constraintlayout/solver/widgets/ChainHead;)V
    .locals 40
    .param p0, "container"    # Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;
    .param p1, "system"    # Landroidx/constraintlayout/solver/LinearSystem;
    .param p2, "orientation"    # I
    .param p3, "offset"    # I
    .param p4, "chainHead"    # Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 80
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v10, p4

    iget-object v11, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 81
    .local v11, "first":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v12, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLast:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 82
    .local v12, "last":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v13, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 83
    .local v13, "firstVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v14, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 84
    .local v14, "lastVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v15, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 86
    .local v15, "head":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move-object v2, v11

    .line 87
    .local v2, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    const/4 v3, 0x0

    .line 88
    .local v3, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    const/4 v4, 0x0

    .line 90
    .local v4, "done":Z
    iget v5, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 91
    .local v5, "totalWeights":F
    iget-object v6, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 92
    .local v6, "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v7, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 94
    .local v7, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v8, v8, p2

    sget-object v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    move-object/from16 v16, v2

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v16, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    if-ne v8, v9, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    move/from16 v18, v8

    .line 95
    .local v18, "isWrapContent":Z
    const/4 v8, 0x0

    .line 96
    .local v8, "isChainSpread":Z
    const/4 v9, 0x0

    .line 97
    .local v9, "isChainSpreadInside":Z
    const/16 v19, 0x0

    .line 99
    .local v19, "isChainPacked":Z
    if-nez p2, :cond_4

    .line 100
    iget v2, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 101
    .end local v8    # "isChainSpread":Z
    .local v2, "isChainSpread":Z
    :goto_1
    iget v8, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    move/from16 v22, v2

    const/4 v2, 0x1

    .end local v2    # "isChainSpread":Z
    .local v22, "isChainSpread":Z
    if-ne v8, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    .line 102
    .end local v9    # "isChainSpreadInside":Z
    .local v2, "isChainSpreadInside":Z
    :goto_2
    iget v8, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_3

    const/4 v8, 0x1

    goto :goto_3

    :cond_3
    const/4 v8, 0x0

    :goto_3
    move-object/from16 v19, v16

    move/from16 v16, v2

    move-object/from16 v2, v19

    move-object/from16 v19, v3

    move/from16 v21, v4

    move/from16 v23, v8

    .end local v19    # "isChainPacked":Z
    .local v8, "isChainPacked":Z
    goto :goto_7

    .line 104
    .end local v2    # "isChainSpreadInside":Z
    .end local v22    # "isChainSpread":Z
    .local v8, "isChainSpread":Z
    .restart local v9    # "isChainSpreadInside":Z
    .restart local v19    # "isChainPacked":Z
    :cond_4
    iget v2, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-nez v2, :cond_5

    const/4 v2, 0x1

    goto :goto_4

    :cond_5
    const/4 v2, 0x0

    .line 105
    .end local v8    # "isChainSpread":Z
    .local v2, "isChainSpread":Z
    :goto_4
    iget v8, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    move/from16 v22, v2

    const/4 v2, 0x1

    .end local v2    # "isChainSpread":Z
    .restart local v22    # "isChainSpread":Z
    if-ne v8, v2, :cond_6

    const/4 v2, 0x1

    goto :goto_5

    :cond_6
    const/4 v2, 0x0

    .line 106
    .end local v9    # "isChainSpreadInside":Z
    .local v2, "isChainSpreadInside":Z
    :goto_5
    iget v8, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_7

    const/4 v8, 0x1

    goto :goto_6

    :cond_7
    const/4 v8, 0x0

    :goto_6
    move-object/from16 v19, v16

    move/from16 v16, v2

    move-object/from16 v2, v19

    move-object/from16 v19, v3

    move/from16 v21, v4

    move/from16 v23, v8

    .line 113
    .end local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v4    # "done":Z
    .local v2, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v16, "isChainSpreadInside":Z
    .local v19, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v21, "done":Z
    .local v23, "isChainPacked":Z
    :goto_7
    if-nez v21, :cond_15

    .line 114
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v9, v9, p3

    .line 116
    .local v9, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/16 v24, 0x4

    .line 117
    .local v24, "strength":I
    if-eqz v23, :cond_8

    .line 118
    const/16 v24, 0x1

    .line 120
    :cond_8
    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v25

    .line 121
    .local v25, "margin":I
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v3, v3, p2

    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v8, :cond_9

    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v3, v3, p2

    if-nez v3, :cond_9

    const/4 v3, 0x1

    goto :goto_8

    :cond_9
    const/4 v3, 0x0

    .line 124
    .local v3, "isSpreadOnly":Z
    :goto_8
    iget-object v8, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v8, :cond_a

    if-eq v2, v11, :cond_a

    .line 125
    iget-object v8, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    add-int v25, v25, v8

    move/from16 v8, v25

    goto :goto_9

    .line 128
    :cond_a
    move/from16 v8, v25

    .end local v25    # "margin":I
    .local v8, "margin":I
    :goto_9
    if-eqz v23, :cond_b

    if-eq v2, v11, :cond_b

    if-eq v2, v13, :cond_b

    .line 129
    const/16 v24, 0x5

    .line 132
    :cond_b
    iget-object v4, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_e

    .line 133
    if-ne v2, v13, :cond_c

    .line 134
    iget-object v4, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move/from16 v28, v3

    .end local v3    # "isSpreadOnly":Z
    .local v28, "isSpreadOnly":Z
    iget-object v3, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move/from16 v29, v5

    const/4 v5, 0x6

    .end local v5    # "totalWeights":F
    .local v29, "totalWeights":F
    invoke-virtual {v1, v4, v3, v8, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_a

    .line 137
    .end local v28    # "isSpreadOnly":Z
    .end local v29    # "totalWeights":F
    .restart local v3    # "isSpreadOnly":Z
    .restart local v5    # "totalWeights":F
    :cond_c
    move/from16 v28, v3

    move/from16 v29, v5

    .end local v3    # "isSpreadOnly":Z
    .end local v5    # "totalWeights":F
    .restart local v28    # "isSpreadOnly":Z
    .restart local v29    # "totalWeights":F
    iget-object v3, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/16 v5, 0x8

    invoke-virtual {v1, v3, v4, v8, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 140
    :goto_a
    if-eqz v28, :cond_d

    if-nez v23, :cond_d

    .line 141
    const/4 v3, 0x5

    .end local v24    # "strength":I
    .local v3, "strength":I
    goto :goto_b

    .line 143
    .end local v3    # "strength":I
    .restart local v24    # "strength":I
    :cond_d
    move/from16 v3, v24

    .end local v24    # "strength":I
    .restart local v3    # "strength":I
    :goto_b
    iget-object v4, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v5, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v1, v4, v5, v8, v3}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    move/from16 v24, v3

    goto :goto_c

    .line 132
    .end local v28    # "isSpreadOnly":Z
    .end local v29    # "totalWeights":F
    .local v3, "isSpreadOnly":Z
    .restart local v5    # "totalWeights":F
    .restart local v24    # "strength":I
    :cond_e
    move/from16 v28, v3

    move/from16 v29, v5

    .line 147
    .end local v3    # "isSpreadOnly":Z
    .end local v5    # "totalWeights":F
    .restart local v28    # "isSpreadOnly":Z
    .restart local v29    # "totalWeights":F
    :goto_c
    if-eqz v18, :cond_10

    .line 148
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v3

    const/16 v5, 0x8

    if-eq v3, v5, :cond_f

    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v3, v3, p2

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_f

    .line 150
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v30, v6

    const/4 v5, 0x5

    const/4 v6, 0x0

    .end local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v30, "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    invoke-virtual {v1, v3, v4, v6, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_d

    .line 148
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_f
    move-object/from16 v30, v6

    .line 154
    .end local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_d
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/16 v5, 0x8

    const/4 v6, 0x0

    invoke-virtual {v1, v3, v4, v6, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_e

    .line 147
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_10
    move-object/from16 v30, v6

    .line 160
    .end local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_e
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 161
    .local v3, "nextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    if-eqz v3, :cond_13

    .line 162
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 163
    .end local v19    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v4, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_12

    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eq v5, v2, :cond_11

    goto :goto_f

    :cond_11
    move-object/from16 v19, v4

    goto :goto_10

    .line 164
    :cond_12
    :goto_f
    const/4 v4, 0x0

    move-object/from16 v19, v4

    goto :goto_10

    .line 167
    .end local v4    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v19    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_13
    const/4 v4, 0x0

    move-object/from16 v19, v4

    .line 169
    :goto_10
    if-eqz v19, :cond_14

    .line 170
    move-object/from16 v2, v19

    goto :goto_11

    .line 172
    :cond_14
    const/4 v4, 0x1

    move/from16 v21, v4

    .line 174
    .end local v3    # "nextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v8    # "margin":I
    .end local v9    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v24    # "strength":I
    .end local v28    # "isSpreadOnly":Z
    :goto_11
    move/from16 v5, v29

    move-object/from16 v6, v30

    goto/16 :goto_7

    .line 177
    .end local v29    # "totalWeights":F
    .end local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v5    # "totalWeights":F
    .restart local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_15
    move/from16 v29, v5

    move-object/from16 v30, v6

    .end local v5    # "totalWeights":F
    .end local v6    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v29    # "totalWeights":F
    .restart local v30    # "firstMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    if-eqz v14, :cond_19

    iget-object v4, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_19

    .line 178
    iget-object v4, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    .line 179
    .local v4, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v5, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v5, v5, p2

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroidx/constraintlayout/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v5, v6, :cond_16

    iget-object v5, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v5, v5, p2

    if-nez v5, :cond_16

    const/4 v5, 0x1

    goto :goto_12

    :cond_16
    const/4 v5, 0x0

    .line 181
    .local v5, "isSpreadOnly":Z
    :goto_12
    if-eqz v5, :cond_17

    if-nez v23, :cond_17

    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-ne v6, v0, :cond_17

    .line 182
    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v8, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    neg-int v9, v9

    const/4 v3, 0x5

    invoke-virtual {v1, v6, v8, v9, v3}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_13

    .line 184
    :cond_17
    if-eqz v23, :cond_18

    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-ne v3, v0, :cond_18

    .line 185
    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    neg-int v8, v8

    const/4 v9, 0x4

    invoke-virtual {v1, v3, v6, v8, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 188
    :cond_18
    :goto_13
    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v8, p3, 0x1

    aget-object v6, v6, v8

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 189
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    neg-int v8, v8

    .line 188
    const/4 v9, 0x6

    invoke-virtual {v1, v3, v6, v8, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 194
    .end local v4    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v5    # "isSpreadOnly":Z
    :cond_19
    if-eqz v18, :cond_1a

    .line 195
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v5, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v6, p3, 0x1

    aget-object v5, v5, v6

    .line 197
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    .line 195
    const/16 v6, 0x8

    invoke-virtual {v1, v3, v4, v5, v6}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 201
    :cond_1a
    iget-object v3, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 202
    .local v3, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    if-eqz v3, :cond_22

    .line 203
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 204
    .local v4, "count":I
    const/4 v5, 0x1

    if-le v4, v5, :cond_21

    .line 205
    const/4 v6, 0x0

    .line 206
    .local v6, "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    const/4 v8, 0x0

    .line 208
    .local v8, "lastWeight":F
    iget-boolean v9, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    if-eqz v9, :cond_1b

    iget-boolean v9, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-nez v9, :cond_1b

    .line 209
    iget v9, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    int-to-float v9, v9

    move/from16 v33, v9

    .end local v29    # "totalWeights":F
    .local v9, "totalWeights":F
    goto :goto_14

    .line 212
    .end local v9    # "totalWeights":F
    .restart local v29    # "totalWeights":F
    :cond_1b
    move/from16 v33, v29

    .end local v29    # "totalWeights":F
    .local v33, "totalWeights":F
    :goto_14
    const/4 v9, 0x0

    move/from16 v32, v8

    .end local v8    # "lastWeight":F
    .local v9, "i":I
    .local v32, "lastWeight":F
    :goto_15
    if-ge v9, v4, :cond_20

    .line 213
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 214
    .local v8, "match":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v5, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    aget v5, v5, p2

    .line 216
    .local v5, "currentWeight":F
    const/16 v25, 0x0

    cmpg-float v26, v5, v25

    if-gez v26, :cond_1d

    .line 217
    iget-boolean v0, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-eqz v0, :cond_1c

    .line 218
    iget-object v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v25, p3, 0x1

    aget-object v0, v0, v25

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v26, v2

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v26, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v2, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v28, v3

    move/from16 v24, v4

    const/4 v3, 0x4

    const/4 v4, 0x0

    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v4    # "count":I
    .local v24, "count":I
    .local v28, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    invoke-virtual {v1, v0, v2, v4, v3}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 220
    const/4 v4, 0x0

    goto/16 :goto_17

    .line 222
    .end local v24    # "count":I
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v4    # "count":I
    :cond_1c
    move-object/from16 v26, v2

    move-object/from16 v28, v3

    move/from16 v24, v4

    const/4 v3, 0x4

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v4    # "count":I
    .restart local v24    # "count":I
    .restart local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    const/high16 v5, 0x3f800000    # 1.0f

    move/from16 v34, v5

    goto :goto_16

    .line 216
    .end local v24    # "count":I
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v4    # "count":I
    :cond_1d
    move-object/from16 v26, v2

    move-object/from16 v28, v3

    move/from16 v24, v4

    const/4 v3, 0x4

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v4    # "count":I
    .restart local v24    # "count":I
    .restart local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    move/from16 v34, v5

    .line 224
    .end local v5    # "currentWeight":F
    .local v34, "currentWeight":F
    :goto_16
    cmpl-float v0, v34, v25

    if-nez v0, :cond_1e

    .line 225
    iget-object v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v2, p3, 0x1

    aget-object v0, v0, v2

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-virtual {v1, v0, v2, v4, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 227
    goto :goto_17

    .line 230
    :cond_1e
    const/4 v4, 0x0

    if-eqz v6, :cond_1f

    .line 231
    iget-object v0, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 232
    .local v0, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v2, v2, v5

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 233
    .local v2, "end":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v5, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, p3

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 234
    .local v5, "nextBegin":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v3, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v25, p3, 0x1

    aget-object v3, v3, v25

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 235
    .local v3, "nextEnd":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v31

    .line 236
    .local v31, "row":Landroidx/constraintlayout/solver/ArrayRow;
    move-object/from16 v35, v0

    move-object/from16 v36, v2

    move-object/from16 v38, v3

    move-object/from16 v37, v5

    .end local v0    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v2    # "end":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v3    # "nextEnd":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v5    # "nextBegin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v35, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v36, "end":Landroidx/constraintlayout/solver/SolverVariable;
    .local v37, "nextBegin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v38, "nextEnd":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual/range {v31 .. v38}, Landroidx/constraintlayout/solver/ArrayRow;->createRowEqualMatchDimensions(FFFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/ArrayRow;

    .line 238
    move-object/from16 v0, v31

    .end local v31    # "row":Landroidx/constraintlayout/solver/ArrayRow;
    .local v0, "row":Landroidx/constraintlayout/solver/ArrayRow;
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 241
    .end local v0    # "row":Landroidx/constraintlayout/solver/ArrayRow;
    .end local v35    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v36    # "end":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v37    # "nextBegin":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v38    # "nextEnd":Landroidx/constraintlayout/solver/SolverVariable;
    :cond_1f
    move-object v0, v8

    .line 242
    .end local v6    # "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move/from16 v2, v34

    move-object v6, v0

    move/from16 v32, v2

    .line 212
    .end local v0    # "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v8    # "match":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v34    # "currentWeight":F
    .restart local v6    # "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_17
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    move/from16 v4, v24

    move-object/from16 v2, v26

    move-object/from16 v3, v28

    const/4 v5, 0x1

    goto/16 :goto_15

    .end local v24    # "count":I
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .local v2, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v3, "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v4    # "count":I
    :cond_20
    move-object/from16 v26, v2

    move-object/from16 v28, v3

    move/from16 v24, v4

    const/4 v4, 0x0

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v4    # "count":I
    .restart local v24    # "count":I
    .restart local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    move/from16 v29, v33

    goto :goto_18

    .line 204
    .end local v6    # "lastMatch":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v9    # "i":I
    .end local v24    # "count":I
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v32    # "lastWeight":F
    .end local v33    # "totalWeights":F
    .restart local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v4    # "count":I
    .restart local v29    # "totalWeights":F
    :cond_21
    move-object/from16 v26, v2

    move-object/from16 v28, v3

    move/from16 v24, v4

    const/4 v4, 0x0

    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .end local v4    # "count":I
    .restart local v24    # "count":I
    .restart local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    goto :goto_18

    .line 202
    .end local v24    # "count":I
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    :cond_22
    move-object/from16 v26, v2

    move-object/from16 v28, v3

    const/4 v4, 0x0

    .line 259
    .end local v2    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    .restart local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v28    # "listMatchConstraints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/constraintlayout/solver/widgets/ConstraintWidget;>;"
    :goto_18
    if-eqz v13, :cond_29

    if-eq v13, v14, :cond_24

    if-eqz v23, :cond_23

    goto :goto_19

    :cond_23
    move-object v0, v7

    goto/16 :goto_1e

    .line 260
    :cond_24
    :goto_19
    iget-object v2, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    .line 261
    .local v2, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v3, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    .line 262
    .local v3, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_25

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_1a

    :cond_25
    const/4 v4, 0x0

    .line 263
    .local v4, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_1a
    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_26

    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object v6, v5

    goto :goto_1b

    :cond_26
    const/4 v6, 0x0

    .line 264
    .local v6, "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_1b
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v5, p3

    .line 265
    iget-object v5, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v8, p3, 0x1

    aget-object v3, v5, v8

    .line 266
    if-eqz v4, :cond_28

    if-eqz v6, :cond_28

    .line 267
    const/high16 v5, 0x3f000000    # 0.5f

    .line 268
    .local v5, "bias":F
    if-nez p2, :cond_27

    .line 269
    iget v5, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    goto :goto_1c

    .line 271
    :cond_27
    iget v5, v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    .line 273
    :goto_1c
    move-object v8, v4

    .end local v4    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 274
    .local v4, "beginMargin":I
    move-object v9, v8

    .end local v8    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v9, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 275
    .local v8, "endMargin":I
    move-object v0, v2

    .end local v2    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v20, v7

    .end local v7    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v20, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v24, v3

    move-object v3, v9

    .end local v9    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v3, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v24, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/4 v9, 0x7

    move-object/from16 v39, v20

    move-object/from16 v20, v0

    move-object/from16 v0, v39

    .local v0, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v20, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_1d

    .line 266
    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v5    # "bias":F
    .end local v8    # "endMargin":I
    .end local v20    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v24    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v2    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v3, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v4, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .restart local v7    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_28
    move-object/from16 v20, v2

    move-object/from16 v24, v3

    move-object v3, v4

    move-object v0, v7

    .line 278
    .end local v2    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v4    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v6    # "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v7    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_1d
    move-object/from16 v1, p1

    move-object/from16 v25, v0

    goto/16 :goto_34

    .line 259
    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v7    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_29
    move-object v0, v7

    .line 278
    .end local v7    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_1e
    if-eqz v22, :cond_3d

    if-eqz v13, :cond_3d

    .line 280
    move-object v1, v13

    .line 281
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v1, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move-object v2, v13

    .line 282
    .local v2, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget v3, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v3, :cond_2a

    iget v3, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    iget v5, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-ne v3, v5, :cond_2a

    const/4 v4, 0x1

    :cond_2a
    move/from16 v20, v4

    .line 283
    .local v20, "applyFixedEquality":Z
    :goto_1f
    if-eqz v1, :cond_3c

    .line 284
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v3, v3, p2

    .line 285
    .end local v19    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v3, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_20
    if-eqz v3, :cond_2b

    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_2c

    .line 286
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v3, v4, p2

    goto :goto_20

    .line 285
    :cond_2b
    const/16 v5, 0x8

    .line 288
    :cond_2c
    if-nez v3, :cond_2e

    if-ne v1, v14, :cond_2d

    goto :goto_21

    :cond_2d
    move-object/from16 v25, v0

    move-object/from16 v33, v1

    move-object/from16 v27, v2

    move-object/from16 v31, v3

    move v0, v5

    goto/16 :goto_29

    .line 289
    :cond_2e
    :goto_21
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    .line 290
    .local v4, "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 291
    .local v6, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_2f

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_22

    :cond_2f
    const/4 v7, 0x0

    .line 292
    .local v7, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_22
    if-eq v2, v1, :cond_30

    .line 293
    iget-object v8, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v9, p3, 0x1

    aget-object v8, v8, v9

    iget-object v7, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_24

    .line 294
    :cond_30
    if-ne v1, v13, :cond_32

    if-ne v2, v1, :cond_32

    .line 295
    iget-object v8, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v8, v8, p3

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v8, :cond_31

    iget-object v8, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v8, v8, p3

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_23

    :cond_31
    const/4 v8, 0x0

    :goto_23
    move-object v7, v8

    .line 298
    :cond_32
    :goto_24
    const/4 v8, 0x0

    .line 299
    .local v8, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/4 v9, 0x0

    .line 300
    .local v9, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    const/16 v19, 0x0

    .line 301
    .local v19, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    .line 302
    .local v24, "beginMargin":I
    iget-object v5, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v25, p3, 0x1

    aget-object v5, v5, v25

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    .line 304
    .local v5, "nextMargin":I
    if-eqz v3, :cond_33

    .line 305
    move-object/from16 v25, v0

    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v25, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 306
    .end local v8    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 307
    .end local v9    # "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v9, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v9, v9, v26

    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .end local v19    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v9, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    goto :goto_25

    .line 309
    .end local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v8, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v9, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .restart local v19    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :cond_33
    move-object/from16 v25, v0

    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v0, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v0, v0, v26

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 310
    .end local v8    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    if-eqz v0, :cond_34

    .line 311
    iget-object v9, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 313
    :cond_34
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v8, v8, v26

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v39, v9

    move-object v9, v8

    move-object/from16 v8, v39

    .line 316
    .end local v19    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v9, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_25
    if-eqz v0, :cond_35

    .line 317
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v19

    add-int v5, v5, v19

    move/from16 v19, v5

    goto :goto_26

    .line 316
    :cond_35
    move/from16 v19, v5

    .line 319
    .end local v5    # "nextMargin":I
    .local v19, "nextMargin":I
    :goto_26
    if-eqz v2, :cond_36

    .line 320
    iget-object v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v5, v5, v26

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    add-int v24, v24, v5

    .line 322
    :cond_36
    if-eqz v6, :cond_3a

    if-eqz v7, :cond_3a

    if-eqz v8, :cond_3a

    if-eqz v9, :cond_3a

    .line 323
    move/from16 v5, v24

    .line 324
    .local v5, "margin1":I
    if-ne v1, v13, :cond_37

    .line 325
    move-object/from16 v26, v0

    .end local v0    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v26, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    goto :goto_27

    .line 324
    .end local v26    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v0    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_37
    move-object/from16 v26, v0

    .line 327
    .end local v0    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v26    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :goto_27
    move/from16 v0, v19

    .line 328
    .local v0, "margin2":I
    if-ne v1, v14, :cond_38

    .line 329
    move/from16 v31, v0

    .end local v0    # "margin2":I
    .local v31, "margin2":I
    iget-object v0, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v32, p3, 0x1

    aget-object v0, v0, v32

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    .end local v31    # "margin2":I
    .restart local v0    # "margin2":I
    goto :goto_28

    .line 328
    :cond_38
    move/from16 v31, v0

    .line 331
    :goto_28
    const/16 v31, 0x5

    .line 332
    .local v31, "strength":I
    if-eqz v20, :cond_39

    .line 333
    const/16 v31, 0x8

    .line 335
    :cond_39
    move-object/from16 v32, v4

    move v4, v5

    .end local v5    # "margin1":I
    .local v4, "margin1":I
    .local v32, "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/high16 v5, 0x3f000000    # 0.5f

    move/from16 v27, v31

    move-object/from16 v31, v3

    move-object v3, v7

    move-object v7, v9

    move/from16 v9, v27

    move-object/from16 v33, v1

    move-object/from16 v27, v2

    move-object v2, v6

    move-object v6, v8

    move-object/from16 v1, p1

    move v8, v0

    const/16 v0, 0x8

    .end local v0    # "margin2":I
    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v2, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v3, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v6, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "margin2":I
    .local v9, "strength":I
    .local v27, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v31, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v33, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_29

    .line 322
    .end local v26    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v27    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v32    # "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v2, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v3, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v4, "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v6, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v9, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :cond_3a
    move-object/from16 v26, v0

    move-object/from16 v33, v1

    move-object/from16 v27, v2

    move-object/from16 v31, v3

    move-object/from16 v32, v4

    move-object v2, v6

    move-object v3, v7

    move-object v6, v8

    move-object v7, v9

    const/16 v0, 0x8

    .line 340
    .end local v0    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v4    # "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v6    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v7    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v8    # "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v9    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v19    # "nextMargin":I
    .end local v24    # "beginMargin":I
    .restart local v27    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_29
    invoke-virtual/range {v33 .. v33}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    if-eq v1, v0, :cond_3b

    .line 341
    move-object/from16 v1, v33

    move-object v2, v1

    .end local v27    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v1, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    goto :goto_2a

    .line 340
    .end local v1    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v27    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_3b
    move-object/from16 v2, v27

    .line 343
    .end local v27    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_2a
    move-object/from16 v1, v31

    move-object/from16 v0, v25

    move-object/from16 v19, v31

    .end local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v1, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    goto/16 :goto_1f

    .line 283
    .end local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v19, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_3c
    move-object/from16 v25, v0

    move-object/from16 v33, v1

    move-object/from16 v27, v2

    .line 345
    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v20    # "applyFixedEquality":Z
    .restart local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move-object/from16 v1, p1

    goto/16 :goto_35

    .line 278
    .end local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v26, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_3d
    move-object/from16 v25, v0

    const/16 v0, 0x8

    .line 345
    .end local v0    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v25    # "previousMatchConstraintsWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    if-eqz v16, :cond_50

    if-eqz v13, :cond_50

    .line 347
    move-object v1, v13

    .line 348
    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move-object v2, v13

    .line 349
    .restart local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget v3, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v3, :cond_3e

    iget v3, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    iget v5, v10, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-ne v3, v5, :cond_3e

    const/4 v4, 0x1

    :cond_3e
    move/from16 v20, v4

    .line 350
    .restart local v20    # "applyFixedEquality":Z
    :goto_2b
    if-eqz v1, :cond_4b

    .line 351
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v3, v3, p2

    .line 352
    .end local v19    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_2c
    if-eqz v3, :cond_3f

    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    if-ne v4, v0, :cond_3f

    .line 353
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v3, v4, p2

    goto :goto_2c

    .line 355
    :cond_3f
    if-eq v1, v13, :cond_49

    if-eq v1, v14, :cond_49

    if-eqz v3, :cond_49

    .line 356
    if-ne v3, v14, :cond_40

    .line 357
    const/4 v3, 0x0

    .line 359
    :cond_40
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    .line 360
    .restart local v4    # "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 361
    .local v5, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_41

    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2d

    :cond_41
    const/4 v6, 0x0

    .line 362
    .local v6, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_2d
    iget-object v7, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v8, p3, 0x1

    aget-object v7, v7, v8

    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 363
    const/4 v7, 0x0

    .line 364
    .local v7, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/4 v8, 0x0

    .line 365
    .restart local v8    # "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    const/4 v9, 0x0

    .line 366
    .restart local v9    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v19

    .line 367
    .local v19, "beginMargin":I
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v24, p3, 0x1

    aget-object v0, v0, v24

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    .line 369
    .local v0, "nextMargin":I
    if-eqz v3, :cond_43

    .line 370
    move/from16 v24, v0

    .end local v0    # "nextMargin":I
    .local v24, "nextMargin":I
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 371
    .end local v7    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 372
    .end local v8    # "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v8, :cond_42

    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2e

    :cond_42
    const/4 v8, 0x0

    .end local v9    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_2e
    goto :goto_2f

    .line 374
    .end local v24    # "nextMargin":I
    .local v0, "nextMargin":I
    .local v7, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v8, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .restart local v9    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :cond_43
    move/from16 v24, v0

    .end local v0    # "nextMargin":I
    .restart local v24    # "nextMargin":I
    iget-object v0, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 375
    .end local v7    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    if-eqz v0, :cond_44

    .line 376
    iget-object v8, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 378
    :cond_44
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v7, v7, v26

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v39, v8

    move-object v8, v7

    move-object/from16 v7, v39

    .line 381
    .end local v9    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_2f
    if-eqz v0, :cond_45

    .line 382
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    add-int v9, v24, v9

    move/from16 v24, v9

    .line 384
    :cond_45
    if-eqz v2, :cond_46

    .line 385
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v26, p3, 0x1

    aget-object v9, v9, v26

    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    add-int v19, v19, v9

    .line 387
    :cond_46
    const/4 v9, 0x4

    .line 388
    .local v9, "strength":I
    if-eqz v20, :cond_47

    .line 389
    const/16 v9, 0x8

    .line 391
    :cond_47
    if-eqz v5, :cond_48

    if-eqz v6, :cond_48

    if-eqz v7, :cond_48

    if-eqz v8, :cond_48

    .line 392
    move-object/from16 v26, v2

    move-object v2, v5

    .end local v5    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v2, "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v26, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    const/high16 v5, 0x3f000000    # 0.5f

    move/from16 v31, v19

    move-object/from16 v19, v4

    move/from16 v4, v31

    move-object/from16 v31, v3

    move-object v3, v6

    move-object v6, v7

    move-object v7, v8

    move/from16 v8, v24

    move-object/from16 v24, v1

    move-object/from16 v1, p1

    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v3, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v4, "beginMargin":I
    .local v6, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "nextMargin":I
    .local v19, "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v24, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_30

    .line 391
    .end local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v2, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v3, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v4, "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v5    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .local v6, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v7, "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .local v8, "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v19, "beginMargin":I
    .local v24, "nextMargin":I
    :cond_48
    move/from16 v26, v19

    move-object/from16 v19, v4

    move/from16 v4, v26

    move-object/from16 v26, v2

    move-object/from16 v31, v3

    move-object v2, v5

    move-object v3, v6

    move-object v6, v7

    move-object v7, v8

    move/from16 v8, v24

    move-object/from16 v24, v1

    move-object/from16 v1, p1

    .line 397
    .end local v0    # "beginNextAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v4    # "beginAnchor":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v5    # "begin":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v6    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v7    # "beginNext":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v8    # "beginNextTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v9    # "strength":I
    .end local v19    # "beginMargin":I
    .local v24, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_30
    move-object/from16 v19, v31

    goto :goto_31

    .line 355
    .end local v24    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v31    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_49
    move-object/from16 v24, v1

    move-object/from16 v26, v2

    move-object/from16 v1, p1

    .line 397
    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v24    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    move-object/from16 v19, v3

    .end local v3    # "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v19, "next":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_31
    invoke-virtual/range {v24 .. v24}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v0

    const/16 v5, 0x8

    if-eq v0, v5, :cond_4a

    .line 398
    move-object/from16 v0, v24

    move-object v2, v0

    .end local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    goto :goto_32

    .line 397
    .end local v0    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_4a
    move-object/from16 v2, v26

    .line 400
    .end local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_32
    move-object/from16 v0, v19

    move-object v1, v0

    move v0, v5

    .end local v24    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v0, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    goto/16 :goto_2b

    .line 402
    .end local v0    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_4b
    move-object/from16 v24, v1

    move-object/from16 v26, v2

    move-object/from16 v1, p1

    .end local v1    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v2    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v24    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 403
    .local v0, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v2, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 404
    .local v2, "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v3, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    .line 405
    .local v3, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v4, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 406
    .local v4, "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/4 v9, 0x5

    .line 407
    .local v9, "endPointsStrength":I
    if-eqz v2, :cond_4e

    .line 408
    if-eq v13, v14, :cond_4c

    .line 409
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    invoke-virtual {v1, v5, v6, v7, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    move-object/from16 v27, v0

    move-object/from16 v32, v2

    move-object v0, v3

    move-object v10, v4

    goto :goto_33

    .line 410
    :cond_4c
    if-eqz v4, :cond_4d

    .line 411
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    move-object v8, v6

    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move/from16 v27, v7

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 412
    move-object/from16 v31, v3

    move-object v3, v8

    .end local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v31, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    invoke-virtual/range {v31 .. v31}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 411
    move-object/from16 v32, v2

    move-object v2, v5

    .end local v2    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v32, "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    const/high16 v5, 0x3f000000    # 0.5f

    move-object v10, v4

    move/from16 v4, v27

    move-object/from16 v27, v0

    move-object/from16 v0, v31

    .end local v4    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v31    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v10, "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v27, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_33

    .line 410
    .end local v10    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v27    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v32    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v2    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v4    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_4d
    move-object/from16 v27, v0

    move-object/from16 v32, v2

    move-object v0, v3

    move-object v10, v4

    .end local v2    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v4    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v10    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v27    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v32    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    goto :goto_33

    .line 407
    .end local v10    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v27    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v32    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v2    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v4    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_4e
    move-object/from16 v27, v0

    move-object/from16 v32, v2

    move-object v0, v3

    move-object v10, v4

    .line 415
    .end local v2    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v3    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v4    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v0, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v10    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v27    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .restart local v32    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :goto_33
    if-eqz v10, :cond_4f

    if-eq v13, v14, :cond_4f

    .line 416
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v3, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    neg-int v4, v4

    invoke-virtual {v1, v2, v3, v4, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 422
    .end local v0    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v9    # "endPointsStrength":I
    .end local v10    # "endTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v20    # "applyFixedEquality":Z
    .end local v26    # "previousVisibleWidget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .end local v27    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v32    # "beginTarget":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_4f
    move-object/from16 v33, v24

    goto :goto_35

    .line 345
    .end local v24    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .local v26, "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :cond_50
    move-object/from16 v1, p1

    .line 422
    :goto_34
    move-object/from16 v33, v26

    .end local v26    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .restart local v33    # "widget":Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    :goto_35
    if-nez v22, :cond_51

    if-eqz v16, :cond_58

    :cond_51
    if-eqz v13, :cond_58

    if-eq v13, v14, :cond_58

    .line 423
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, p3

    .line 424
    .local v0, "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v3, p3, 0x1

    aget-object v2, v2, v3

    .line 425
    .local v2, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_52

    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_36

    :cond_52
    const/4 v3, 0x0

    .line 426
    .local v3, "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_36
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_53

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_37

    :cond_53
    const/4 v4, 0x0

    .line 427
    .local v4, "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_37
    if-eq v12, v14, :cond_55

    .line 428
    iget-object v5, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v6, p3, 0x1

    aget-object v5, v5, v6

    .line 429
    .local v5, "realEnd":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_54

    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v17, v6

    goto :goto_38

    :cond_54
    const/16 v17, 0x0

    :goto_38
    move-object/from16 v4, v17

    move-object v6, v4

    goto :goto_39

    .line 427
    .end local v5    # "realEnd":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_55
    move-object v6, v4

    .line 431
    .end local v4    # "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .local v6, "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    :goto_39
    if-ne v13, v14, :cond_56

    .line 432
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v4, p3

    .line 433
    iget-object v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v2, v4, v5

    move-object v10, v2

    goto :goto_3a

    .line 431
    :cond_56
    move-object v10, v2

    .line 435
    .end local v2    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .local v10, "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :goto_3a
    if-eqz v3, :cond_58

    if-eqz v6, :cond_58

    .line 436
    const/high16 v5, 0x3f000000    # 0.5f

    .line 437
    .local v5, "bias":F
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 438
    .local v4, "beginMargin":I
    if-nez v14, :cond_57

    .line 440
    move-object v2, v12

    move-object v14, v2

    .line 442
    :cond_57
    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v7, p3, 0x1

    aget-object v2, v2, v7

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 443
    .local v8, "endMargin":I
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v7, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v9, 0x5

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 447
    .end local v0    # "begin":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .end local v3    # "beginTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v4    # "beginMargin":I
    .end local v5    # "bias":F
    .end local v6    # "endTarget":Landroidx/constraintlayout/solver/SolverVariable;
    .end local v8    # "endMargin":I
    .end local v10    # "end":Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    :cond_58
    return-void
.end method
