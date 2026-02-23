return {
  -- LSP servers para Python, Rust e Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python: type checking e intellisense
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        -- Rust: rust-analyzer
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
        -- Go: gopls
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
      },
    },
  },

  -- Treesitter: parsers para as linguagens
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
        "rust",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "toml",
      })
    end,
  },

  -- Mason: instala os binários dos servidores LSP
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        -- Rust
        "rust-analyzer",
        -- Go
        "gopls",
        "goimports",
        "gofumpt",
      },
    },
  },

  -- Conform: formatadores
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        rust = { "rustfmt" },
        go = { "goimports", "gofumpt" },
      },
    },
  },

  -- nvim-lint: linters extras
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },
}
