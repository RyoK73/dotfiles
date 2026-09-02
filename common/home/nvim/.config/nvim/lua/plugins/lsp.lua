return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        filetypes = { "sh", "bash", "zsh" },
      },
      marksman = {
        filetypes = { "markdown", "gitcommit" },
      },
      markdown_oxide = {
        filetypes = { "markdown", "gitcommit" },
      },
      ts_ls = {
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "non-relative", -- "non-relative" や "project-relative" も可
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
      },
    },
  },
}
