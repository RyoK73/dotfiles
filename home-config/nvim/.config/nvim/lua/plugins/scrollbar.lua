return {
  "petertriho/nvim-scrollbar",
  dependencies = { "lewis6991/gitsigns.nvim" },
  enable = true,
  opts = {
    providers = {
      search = { incsearch = true },
      marks = { numbers = false },
      gitsigns = true,
      cursor = true,
    },
    scrollbar = {
      preset = "vscode",
      autohide = false,
    },
    minimap = {
      enabled = false,
      encoding = "braille",
      scale = "fixed",
      columns_per_dot = 2,
      width = 20,
      autohide = false,
      floats = true,
      blend = 65,
    },
    marks = {
      GitAdd = { text = { "A" }, priority = 7, highlight = "GitSignsAdd" },
      GitChange = { text = { "C" }, priority = 7, highlight = "GitSignsChange" },
      GitDelete = { text = { "D" }, priority = 7, highlight = "GitSignsDelete" },
      Cursor = {
        text = "█",
        priority = 0,
        highlight = { fg = "#ffffff" },
      },
    },
  },
}
