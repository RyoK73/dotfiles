## 開発

- 必ずgit worktreeで作業を行う
- git worktreeの作成・削除は必ず `.zshrc` の関数を使うこと。手動で `git worktree add`等を組み立てない。
  - 作成: `gitp <branch名>` （現在のブランチから分岐し、`../{remote repository名}-{branch名}` に作成、cdしてpushまで行う）
  - 削除: `gitc` （merge済み・goneになったworktreeとブランチを一括削除）

## デバッグ・調査時の振る舞い

- 原因説明や調査が目的のときは、検証のためであっても実ファイル（特にテストファイル）を無断で編集しない。読み取り・実行のみで完結させ、編集が必要なら先に確認を取る。
