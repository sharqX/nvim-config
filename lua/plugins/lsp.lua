-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason install/bridge
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
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
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("dockerls", {})                         -- Dockerfile
      vim.lsp.config("docker_compose_language_service", {})  -- docker-compose YAML
      vim.lsp.config("gopls", {})
      vim.lsp.config("helm_ls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("terraformls", {})
      vim.lsp.config("ts_ls", {})                            -- replaces tsserver
      vim.lsp.config("yamlls", {})

      -- Enable them (start on matching buffers)
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

      -- (Optional) Nice defaults
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },
}

