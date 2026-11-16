# カスタムスキル一覧

## 壁打ち・設計

| スキル | 引数 | 説明 |
|---|---|---|
| /grill | [壁打ちしたい計画・やりたいこと] | 壁打ち → プラン → 実行。決定木を辿ってインタビューし、決定事項を要約して確認した後、プランモードでプランを作って実行する。コード以外(設定・ドキュメント・構成の見直し)にも使う。alias `cct` からも起動できる |
| /grill-tdd | [実装したい機能・briefのパス] | 壁打ち → テスト項目の確定 → 記録の保存 → 実装。リスクの高い部分のテスト項目(仕様)を確定し、`<repo>.worktree/grill-me/` に必ず保存して保存先を案内した後、claude実装(テストを先に書く)か自力実装かを選べる |
| /herdr-start | [実装したい機能の説明（省略可）] | 機能ごとにherdrのworktree workspaceを作り、新workspaceでClaude Codeを起動して /grill-tdd の壁打ちを始める。ブランチの範囲の壁打ち、ブランチ名の承認、brief作成は本スキル、実処理は `~/.claude/herdr/plant.sh`。マージ済みの片付けは `hdc`（`~/.claude/herdr/cut.sh`） |
| /design-md | [参考UI/サービス名やURL（省略可）] | Stitch仕様のDESIGN.md生成。コード解析＋参考UI調査＋対話でトークン抽出 |

## 開発・レビュー

| スキル | 引数 | 説明 |
|---|---|---|
| /git-commit | [wip（省略可）] | ステージ済みの変更から `~/.gitmessage` 準拠の英語コミットメッセージ案を作り、確認後にコミット。`wip` を渡すと作業途中のコミットにする。pushは対象外 |
| /pr-review | [PRタイトルのヒント] | 変更の意図・設計を壁打ちし、6観点(セキュリティ・可読性・パフォーマンス・影響範囲・エラーハンドリング・テスト)でレビュー後にPR下書き作成。指摘には根拠（確認済み / 推測）を付ける。レポートは `<repo>.worktree/pr-reviews/{日時}_{branch}.md` にも保存（リポジトリ外）。同じブランチの前回レポートがあれば、未修正の指摘の確認から再開できる。Issueにする指摘は、一覧承認後に `/create-issue` で1件ずつ、案の承認を得て作成 |
| /create-issue | [Issueにしたい内容（省略可）] | GitHub Issueを1件作成。タイトル・本文・ラベル案を確認後 `gh issue create` で作成。複数作るときは1件ずつ繰り返す。他スキル（/pr-review など）から呼ばれた場合も、案の承認は省略しない |

## 文章

| スキル | 引数 | 説明 |
|---|---|---|
| /check-document-en | [チェックしたい英文] | 自分で書いた英文(コミットメッセージ・コードコメント・READMEなど)の文法・自然さをチェック。修正文→追記案→指摘の順で出力。alias `cce` からも起動できる |
| /post-review | [記事ファイルパス or slug] | ブログ記事を5軸で監査。公開前の品質チェック |

## 設定

| スキル | 引数 | 説明 |
|---|---|---|
| /add-rule | [追加したいルールの内容] | 言語・ツールごとのこだわりを、グローバルの `~/.claude/rules/` にpaths付きrulesとして追記。配置先とpathsの決定、既存ルールとの重複・矛盾の検出まで行う。保存先はdotfiles側で、反映にはstowが必要 |

`/omarchy` は Omarchy が提供するスキルで、dotfiles の管理外のため、この一覧では管理しない。

## スキルの追加・変更・削除

`~/.claude/skills/` 配下に `{スキル名}/SKILL.md` を追加・変更・削除したときは、このファイルのインデックスも更新すること。

各スキルのファイル:
- `~/.claude/skills/grill/SKILL.md`
- `~/.claude/skills/grill-tdd/SKILL.md`
- `~/.claude/skills/herdr-start/SKILL.md`
- `~/.claude/skills/design-md/SKILL.md`
- `~/.claude/skills/git-commit/SKILL.md`
- `~/.claude/skills/pr-review/SKILL.md`
- `~/.claude/skills/create-issue/SKILL.md`
- `~/.claude/skills/check-document-en/SKILL.md`
- `~/.claude/skills/post-review/SKILL.md`
- `~/.claude/skills/add-rule/SKILL.md`
