return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        filetypes = { "sh", "bash" },
      },
      marksman = {
        filetypes = { "markdown", "gitcommit" },
      },
      markdown_oxide = {
        filetypes = { "markdown", "gitcommit" },
      },
      postgres_lsp = {
        filetypes = { "sql" },
      },
      vtsls = {
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
              useAliasesForRenames = false,
              autoImportSpecifierExcludeRegexes = { "^fabric/node$" },
            },
          },
        },
      },
      -- ts_ls = {
      --   init_options = {
      --     preferences = {
      --       importModuleSpecifierPreference = "non-relative", -- "non-relative" や "project-relative" も可
      --       includeCompletionsForModuleExports = true,
      --       includeCompletionsForImportStatements = true,
      --     },
      --   },
      -- },
    },
  },
}
