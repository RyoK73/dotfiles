local function is_visual()
  local m = vim.fn.mode()
  return m == "v" or m == "V" or m == "\22"
end

-- show the selection counts in visual mode.(Multibyte char support)
local function count_selection()
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })
  local count = 0
  for _, line in ipairs(lines) do
    count = count + vim.fn.strcharlen(line)
  end
  return count .. " chars"
end

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
        lualine_x = { "searchcount" },
        lualine_y = { { count_selection, cond = is_visual }, "location" },
        lualine_z = { "progress" },
      },
      --[[add your custom lualine config here]]
    }
  end,
}
