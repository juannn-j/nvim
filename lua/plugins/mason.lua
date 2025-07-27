return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- Herramientas externas que quieres asegurar que se instalen
    local ensure_installed = {
      "stylua",              -- Formateador Lua
      "prettier",
      "black"
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
      },
    })
  end,
}

