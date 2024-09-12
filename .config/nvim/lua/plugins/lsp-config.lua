return {
  {
    -- LSP installation
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- Default lsp's for DevOps work
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tailwindcss",
          "terraformls",
          "ansiblels",
          "jinja_lsp",
          "tsserver",
          "dockerls",
          "helm_ls",
          "prettier",
          "pyright",
          "tflint",
          "yamlls",
          "lua_ls",
          "templ",
          "gopls",
          --"html",
        },
      })
    end,
  },
  {
    -- Helm syntax highlighting
    "towolf/vim-helm",
  },
  {
    -- This allows to config and use the lsp
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.dockerls.setup({})
      lspconfig.helm_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.tflint.setup({})
      -- yaml
      lspconfig.yamlls.setup({
        filetypes = { "yaml", "yml" },
      })
      -- terraform
      lspconfig.terraformls.setup({
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "tf", "hcl" },
        root_dir = lspconfig.util.root_pattern(".terraform", ".tf", ".git"),
      })
      -- templ
      lspconfig.templ.setup({
        --  cmd = { "templ", "lsp" },
        --  filetypes = { "templ" },
        --  root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
      })
      -- ansible
      lspconfig.ansiblels.setup({
        cmd = { "ansible-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
      })
      -- jinja
      lspconfig.jinja_lsp.setup({
        cmd = { "jinja-lsp" },
        filetypes = { "jinja", "j2" },
        root_dir = lspconfig.util.root_pattern(".git", ".j2", ".jinja"),
      })
      -- gopls
      lspconfig.gopls.setup({
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
      -- typescript
      lspconfig.tsserver.setup({})
      -- tailwindcss
      lspconfig.tailwindcss.setup({
        filetypes = { "*.css", "tailwindcss" },
        init_options = { userLanguages = { templ = "html" } },
      })
      --[[
      -- html
      lspconfig.html.setup({
        filetypes = { "html", "templ" }
      })]]
      --
      -- Filetypes
      --vim.filetype.add({ extension = { templ = "templ" } })
      --vim.filetype.add({ extension = { jinja = "jinja", j2 = "jinja", jinja2 = "jinja" } })
      -- keymap
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>:
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
    end,
  },
}
