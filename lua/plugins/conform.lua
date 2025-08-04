local formatters = {
  lua = { "stylua", lsp_format = "fallback" },
  python = { "black" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  json = { "prettier" },
  markdown = { "prettier" },
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = formatters,
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  keys = {
    {
      "<leader>vf",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Format with Conform",
    },
  },
}

