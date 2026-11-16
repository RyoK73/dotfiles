---
name: herdr-start
description: 新機能の実装を始めるために、herdrのworktree workspaceを作り、新しいworkspaceでClaude Codeを起動して /grill-tdd の壁打ちを始める。作る前に、どこまでを1つのブランチにするかをユーザーにインタビューして決める。「この機能を別ブランチで進めたい」「worktreeを切って壁打ちを始めて」など、機能ごとにworktreeとworkspaceを分けたい場面で使う。herdrの中でのみ動く。
argument-hint: [実装したい機能の説明（省略可）]
---

# herdr-start モード

## 概要

壁打ちした内容をもとに、機能ごとのgit worktreeとherdrのworkspaceを作る。
新しいworkspaceではClaude Codeが `/grill-tdd` で起動し、機能の説明（brief）を読んで壁打ちを始める。
実処理は `~/.claude/herdr/plant.sh` が行う。このスキルは、ブランチ名の承認とbriefの作成だけを担当する。

事実は、現在のコードから読み取って書く。
GitHub Issueは、作成時点の定義であり、現在のコードとは食い違うことがある。
そのため、Issueは「意図」の参考にとどめる。

## 事前チェック

```bash
echo "$HERDR_PANE_ID"
```

空の場合は「herdrの中で実行してください」と伝えて終了する。

## 手順

### Step 1: 壁打ちフェーズ

まず、現状のコードを読む。壁打ちは、読んだコードを前提に進める。

1. 最新化の確認: `git fetch origin main` を実行し、`git status -sb` と合わせて、origin/main より遅れているか、未コミットの変更があるかを確認する。
   - 遅れている場合は、ユーザーに伝えてから読む。`pull` は `plant.sh` が行う。
   - `create.sh` は現ブランチ（HEAD）からworktreeを作り、直前に `git pull --rebase origin main` を行う。未コミットの変更は引き継がれない。
2. `$ARGUMENTS` と、会話から、実装したい機能を把握する。Issue番号があれば `gh issue view` で読む。Issueは「意図」として扱う。
3. 機能に関連するコード領域を特定し、`Read` で読む。

そのうえで、ユーザーの希望について、共通理解に達するまで容赦なくインタビューを行う。設計ツリーの各分岐を一つずつ辿り、決定間の依存関係を順番に解決していく。

質問は一度に一つずつ行うこと。

コードベースを調べることで答えられる質問がある場合は、インタビューの代わりにコードベースを調べること。

ここで決めるのは、1つのブランチで扱う範囲(何を含め、何を別ブランチに分けるか)までとする。
設計の詳細やテスト項目は、新しいworkspaceの `/grill-tdd` に任せる。

### Step 2: ブランチ名の承認

機能ごとにブランチ名の案を1つ出し、ユーザーの承認を得る。

- 単語は `-` で区切る。
- 承認を得るまで、worktreeは作らない。
- 例: feat-create-feature

### Step 3: briefの作成

機能の説明を、スクラッチパッドのmdファイルに `Write` で書く。
新しいClaude Codeは、このファイルだけを手がかりに壁打ちを始める。
書く前に、briefに載せる事実のコードを読み直して検証する。
次の4つの見出しで構成する。

- 現状（コードから）: 読んで確認した事実だけを、ファイルパス付きで書く。基準のブランチ名と、未コミットの変更の有無も書く。
- 意図: Issueと会話からの、実装したい機能の説明、決まっている方針や制約、ブランチの範囲。
- 差分: Issueや会話の記述が、現状のコードと食い違う点。なければ「なし」と書く。
- 参照: 参照すべきファイルとIssue番号。

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
