---@type vim.lsp.Config
return {
  cmd = { "omnisharp" },
  filetypes = { "cs", "vb" },
  root_markers = {
    "sln",
    "csproj",
    ".git",
  },
  single_file_support = true,
}

