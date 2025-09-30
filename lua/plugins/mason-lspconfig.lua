return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Lua
          "lua_ls",

          -- Python
          "pyright",  -- Python 3.x

          -- Web
          "html",
          "cssls",
          "jsonls",

          -- YAML & Docker
          "yamlls",
          "dockerls",
          "docker_compose_language_service",

          -- Shell
          "bashls",

          -- Kubernetes & Helm
          "helm_ls",

          -- JS / TS
          "ts_ls",

          -- Go
          "gopls",

          -- C / C++
          "clangd",

          -- Terraform
          "terraformls",
        },
      })
    end,
  },
}

