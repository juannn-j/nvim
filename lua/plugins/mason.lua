return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason").setup()

    -- Herramientas externas que quieres asegurar que se instalen
    local ensure_installed = {
      "stylua",     -- Formateador Lua
      "prettier",   -- Formateador para JavaScript, TypeScript, etc.
      "black",      -- Formateador Python
      "csharpier",  -- Formateador C#
      "eslint_d",   -- Linter para JavaScript/TypeScript (necesita Node.js)
      "shellcheck", -- Linter para scripts shell
      "flake8",     -- Linter para Python
      "tflint",     -- Linter para Terraform
      "codespell",  -- Linter para errores tipográficos
      "ast-grep",
    }

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })

    -- Lenguajes soportados por LSP
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "markdown_oxide",
        "pylsp",
        "omnisharp",
        -- "tsserver",
        -- "gopls",
        "bashls",
        "jsonls",
      },
    })

    -- DAPs (Debuggers)
    -- require("mason-nvim-dap").setup({
    --   ensure_installed = {
    --     "python",     -- DAP para Python
    --     "cpp",        -- DAP para C++
    --     "csharp",     -- DAP para C#
    --     "javascript", -- DAP para JavaScript
    --     "java",       -- DAP para Java
    --     "bash",       -- DAP para Bash
    --     "go",         -- DAP para Go
    --     "ruby",       -- DAP para Ruby
    --     "rust",       -- DAP para Rust
    --   },
    -- })
  end,
}
