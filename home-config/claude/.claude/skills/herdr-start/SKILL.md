---
name: herdr-start
description: 新機能の実装を始めるために、herdrのworktree workspaceを作り、新しいworkspaceでClaude Codeを起動して /grill-me-develop の壁打ちを始める。「この機能を別ブランチで進めたい」「worktreeを切って壁打ちを始めて」など、機能ごとにworktreeとworkspaceを分けたい場面で使う。
argument-hint: [実装したい機能の説明（省略可）]
---

# herdr-start モード

## 概要

メインのworkspaceで話した内容をもとに、機能ごとのgit worktreeとherdrのworkspaceを作る。
新しいworkspaceではClaude Codeが `/grill-me-develop` で起動し、機能の説明（brief）を読んで壁打ちを始める。
実処理は `~/.claude/herdr/plant.sh` が行う。このスキルは、ブランチ名の承認とbriefの作成だけを担当する。

## 事前チェック

```bash
echo "$HERDR_PANE_ID"
```

空の場合は「herdrの中で実行してください」と伝えて終了する。

## 手順

### Step 1: 機能の把握

`$ARGUMENTS` と、これまでの会話から、実装したい機能を把握する。
足りない情報があれば、ユーザーに質問する。

### Step 2: ブランチ名の承認

機能に合うブランチ名の案を1つ出し、ユーザーの承認を得る。

- 単語は `-` で区切る。
- 承認を得るまで、worktreeは作らない。

### Step 3: briefの作成

機能の説明を、スクラッチパッドのmdファイルに `Write` で書く。
新しいClaude Codeは、このファイルだけを手がかりに壁打ちを始める。
次の内容を含める。

- 実装したい機能の説明
- ここまでの会話で決まっている方針や制約
- 参照すべきファイルやIssue

### Step 4: 実行

```bash
~/.claude/herdr/plant.sh <branch> <briefのパス>
```

マージ済みのworktreeの片付け、`git pull --rebase origin main`、worktree作成、push、briefの保存、Claude Codeの起動までを、スクリプトが行う。

### Step 5: 報告

スクリプトが出力した、worktreeのパス、workspace、briefの保存先をユーザーに伝える。

新しいworkspaceで初めてClaude Codeを起動するときは、フォルダを信頼するかの確認が出る。
ユーザーが `Yes, I trust this folder` を選ぶ必要があることを伝える。

## 注意

- `plant.sh` が失敗したときは、エラーをそのまま伝える。`--force` や手動での `git worktree add` で回避しない。
- 片付けは `~/.claude/herdr/cut.sh`（alias `hdc`）で行う。PRレビュー後に自動では閉じない。
