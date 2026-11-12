return {
  "petertriho/nvim-scrollbar",
  opts = {
    show = true,
    hide_if_all_visible = true, -- 全行が見えているときはスクロールバーごと隠す
    handle = {
      blend = 60, -- デフォルトのまま（控えめ）
      highlight = "PmenuSbar", -- CursorColumn と同色になるのを避ける
    },
    handlers = {
      gitsigns = true, -- gitsigns 導入済み
    },
  },
}
