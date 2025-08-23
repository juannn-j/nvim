local formatters = {
  lua = { "stylua", lsp_format = "fallback" },
  python = { "black" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  json = { "prettier" },
  markdown = { "prettier" },
  rust = { "rustfmt" },
  go = { "gofmt" },  -- Agregado para Go
  ruby = { "rufo" }, -- Agregado para Ruby
  terraform = { "terraform_fmt" }, -- Agregado para Terraform
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = formatters,
  },
  init = function()
    -- Configuración para usar Conform como formateador
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    
    -- Automático al guardar: formatea el archivo solo si es necesario
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end,
  keys = {
    {
      "<leader>vf",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Format with Conform",
    },
    -- Agregar otros atajos de teclado si lo deseas
    {
      "<leader>vF",
      function()
        require("conform").format({ lsp_format = true })
      end,
      desc = "Format with LSP (if available)",
    },
  },
}

