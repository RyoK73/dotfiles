return {
  {
    "saghen/blink.cmp",
    opts = {
      lazy = false,
      completion = {
        trigger = {
          prefetch_on_insert = false,
        },
      },
      keymap = {
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-Space>"] = { "show" },
      },
      sources = {
        default = { "lsp", "path" },
        providers = {
          buffer = { enabled = false },
        },
      },
      fuzzy = {
        implementation = "lua",
        sorts = { "exact", "score", "label", "sort_text" },
        use_frecency = false,
        use_proximity = false,
      },
    },
  },
  { "rafamadriz/friendly-snippets", enabled = false },
}
