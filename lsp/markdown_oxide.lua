---@type vim.lsp.Config
return {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = {
    ".git",
    ".markdownlintrc",
    ".vale.ini",
    "README.md",
  },
  settings = {
    markdownoxide = {
      -- configura según tus necesidades
      diagnostics = {
        enabled = true,
      },
      completions = {
        enabled = true,
      },
    },
  },
}

