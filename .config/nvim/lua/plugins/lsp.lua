return {
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure the table exists before extending
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Python
        "ninja",
        "rst",
        -- Go
        "go",
        "gomod",
        "gowork",
        "gosum",
        "gotmpl",
        -- Terraform
        "hcl",
        "terraform",
        "tsx",
        "helm",
        -- Ansible
        "jinja",
        "ansible-lint",
        "dockerfile",
        "typescript",
      })
    end,
  },
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {},
        ansiblels = {},
        terraformls = {},
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
    setup = {
      gopls = function(_, opts)
        -- workaround for gopls not supporting semanticTokensProvider
        -- (see https://github.com/golang/go/issues/54531#issuecomment-1464982242)
        LazyVim.lsp.on_attach(function(client, _)
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end, "gopls")
      end,
      yamlls = function()
        LazyVim.lsp.on_attach(function(client, buffer)
          if vim.bo[buffer].filetype == "helm" then
            vim.schedule(function()
              vim.cmd("LspStop ++force yamlls")
            end)
          end
        end, "yamlls")
      end,
    },
  },
  {
    -- Mason Config
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tflint",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
      },
    },
  },
  {
    -- Terraform specifics for docs
    "ANGkeith/telescope-terraform-doc.nvim",
    ft = { "terraform", "hcl" },
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("terraform_doc")
      end)
    end,
  },
  {
    -- Terraform specifics for telescope integration
    "cappyzawa/telescope-terraform.nvim",
    ft = { "terraform", "hcl" },
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("terraform")
      end)
    end,
  },
}
