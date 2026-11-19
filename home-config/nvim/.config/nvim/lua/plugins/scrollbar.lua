return {
  "petertriho/nvim-scrollbar",
  dependencies = { "lewis6991/gitsigns.nvim" },
  enable = true,
  opts = {
    providers = {
      search = { incsearch = true },
      marks = { numbers = true },
      gitsigns = true,
    },
    scrollbar = {
      preset = "zed",
      autohide = true,
    },
    minimap = {
      enabled = true,
    },
    marks = {
      GitAdd = { text = { "┃" }, priority = 7, highlight = "GitSignsAdd" },
      GitChange = { text = { "┃" }, priority = 7, highlight = "GitSignsChange" },
      GitDelete = { text = { "▁" }, priority = 7, highlight = "GitSignsDelete" },
    },
  },
}
