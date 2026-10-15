return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      viwe_error = "popup",
      viwe_warn = "popup",
      viwe_search = "cmdline_popup",
    },
    messages = {
      enabled = true,
      view = "cmdline_output",
    }, -- コピー時等の表示に影響する
    -- notify = {
    --   enabled = true,
    --   view = "popup",
    -- }, -- Shift+kの型情報表示に影響する
    redirect = {
      view = "split",
    },
    -- commands = {
    --   history = {
    --     view = "split",
    --   },
    --   last = {
    --     view = "split",
    --   },
    --   errors = {
    --     view = "split",
    --   },
    --   all = {
    --     view = "split",
    --   },
    -- },
    views = {
      messages = {
        enter = false,
      },
      cmdline = {},
      cmdline_output = {
        timeout = "1500",
        size = "5%",
      },
      cmdline_popup = {
        position = { row = "40%", col = "50%" },
      },
      split = {},
    },
  },
}
