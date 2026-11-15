return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  init = function()
    vim.filetype.add({
      pattern = {
        ["claude%-prompt%-.*%.md"] = "claude-prompt",
      },
    })
    vim.treesitter.language.register("markdown", "claude-prompt")
  end,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = { "n", "c" },
    file_types = { "markdown", "claude-prompt" },
    overrides = {
      filetype = {
        ["claude-prompt"] = { heading = { enabled = false } },
      },
    },
  },
}
