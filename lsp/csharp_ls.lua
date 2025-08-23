---@type vim.lsp.Config
return {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  root_markers = {
    "sln",
    "csproj",
    ".git",
  },
  single_file_support = true,
}

