## 開発

- 必ずgit worktreeで作業を行う
- git worktreeの作成・削除は必ず `.zshrc` の関数を使うこと。手動で `git worktree add`等を組み立てない。
  - 作成: `gitp <branch名>` （現在のブランチから分岐し、`../{remote repository名}-{branch名}` に作成、cdしてpushまで行う）
  - 削除: `gitc` （merge済み・goneになったworktreeとブランチを一括削除）

- 明確に指示した時以外、編集を提案しないでください。
