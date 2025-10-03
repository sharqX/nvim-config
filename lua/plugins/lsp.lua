-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Blink CMP Capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Extend with your custom settings
      capabilities.textDocument = capabilities.textDocument or {}
      capabilities.textDocument.semanticTokens = vim.tbl_deep_extend(
        "force",
        capabilities.textDocument.semanticTokens or {},
        {
          multilineTokenSupport = true,
        }
      )
      vim.lsp.config("*", { capabilities = capabilities })

      -- Mason install/bridge
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "vimls",
          "lua_ls",
          "bashls",
          "clangd",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "gopls",
          "helm_ls",
          "html",
          "jsonls",
          "pyright",
          "terraformls",
          "ts_ls",
          "yamlls",
        },
        automatic_installation = true,
      })

      -- Configure servers (new Neovim 0.11+ API)
      vim.lsp.config("vimls", {})
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("dockerls", {})
      vim.lsp.config("docker_compose_language_service", {})
      vim.lsp.config("gopls", {})
      vim.lsp.config("helm_ls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("terraformls", {})
      vim.lsp.config("ts_ls", {}) -- replaces tsserver
      vim.lsp.config("yamlls", {})

      -- Enable them (start on matching buffers)
      vim.lsp.enable("vimls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("cssls")
      vim.lsp.enable("dockerls")
      vim.lsp.enable("docker_compose_language_service")
      vim.lsp.enable("gopls")
      vim.lsp.enable("helm_ls")
      vim.lsp.enable("html")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("yamlls")

      -- Auto format on saving --
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- (Optional) Nice defaults
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      -- Keymaps --
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,         -- Python
          null_ls.builtins.formatting.stylua,        -- Lua
          null_ls.builtins.formatting.prettier,      -- JS/TS/HTML/C
          null_ls.builtins.formatting.gofmt,         -- gofmt
          null_ls.builtins.formatting.terraform_fmt, -- terraform
        },
      })
    end,
  },
}
