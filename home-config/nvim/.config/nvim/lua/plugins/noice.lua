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
    },
    notify = {
      enabled = true,
      view = "popup",
    },
    redirect = {
      view = "split",
    },
    commands = {
      history = {
        view = "split",
      },
      last = {
        view = "split",
      },
      errors = {
        view = "split",
      },
      all = {
        view = "split",
      },
    },
    views = {
      messages = {
        enter = false,
      },
      cmdline = {},
      cmdline_output = {
        timeout = "1000",
      },
      cmdline_popup = {
        position = { row = "40%", col = "50%" },
      },
      split = {
        size = "20%",
      },
    },
  },
}
