return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        theme = "material",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff" },
        lualine_c = { "diagnostics", { "filetype", icon_only = true }, { "filename", path = 2 } },
        lualine_x = { "searchcount", "lsp_status" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      --[[add your custom lualine config here]]
    }
  end,
}
