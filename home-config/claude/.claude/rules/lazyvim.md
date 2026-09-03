# LazyVim / Neovim 作業時の制約

- `:LspInfo` は非推奨。提案しない。
- LSP状態確認の代替:
  - `:checkhealth vim.lsp`
  - `:lua =vim.lsp.get_clients()`（アタッチ中クライアント一覧）
  - `:LspLog`（ログファイル自体を `Read` で直接読む方法も可）
