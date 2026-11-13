return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    chunk = {
      enable = true,
      style = {
        "#dd8900", --normal color
        "#e5006f", -- error color
      },
    },
    line_num = {
      enable = false,
    },
  },
}
