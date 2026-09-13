return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics", { "filetype", icon_only = true }, { "filename", path = 2 } },
        lualine_c = {},
        lualine_x = { "diff" },
        lualine_y = { "branch" },
        lualine_z = { "progress" },
      },
      --[[add your custom lualine config here]]
    }
  end,
}
