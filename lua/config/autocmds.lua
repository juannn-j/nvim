vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.cmd("setlocal nofoldenable")
  end,
})
vim.opt_local.foldenable = false

vim.api.nvim_create_user_command("LspInfo", function()
  print(vim.inspect(vim.lsp.get_clients()))
end, {})
--
-- -- Crea comandos para los executeCommand del LSP markdown_oxide
-- local daily_commands = {
--   "today", "tomorrow", "yesterday",
--   "last friday", "last saturday", "last sunday",
--   "last monday", "last tuesday", "last wednesday", "last thursday",
--   "next friday", "next saturday", "next sunday",
--   "next monday", "next tuesday", "next wednesday", "next thursday",
-- }
--
-- for _, cmd in ipairs(daily_commands) do
--   local command_name = cmd:gsub("^%l", string.upper):gsub(" (%l)", string.upper):gsub(" ", "")
--   vim.api.nvim_create_user_command(command_name, function()
--     vim.lsp.buf.execute_command({ command = cmd })
--   end, {})
-- end
--

local daily_commands = {
  "today", "tomorrow", "yesterday",
  "last friday", "last saturday", "last sunday",
  "last monday", "last tuesday", "last wednesday", "last thursday",
  "next friday", "next saturday", "next sunday",
  "next monday", "next tuesday", "next wednesday", "next thursday",
}

for _, cmd in ipairs(daily_commands) do
  local command_name = cmd:gsub("^%l", string.upper):gsub(" (%l)", string.upper):gsub(" ", "")
  vim.api.nvim_create_user_command(command_name, function()
    local params = {
      command = cmd,
      arguments = {},
    }
    vim.lsp.buf_request(0, "workspace/executeCommand", params, function(_, result, ctx, _)
      if result then
        vim.notify("Comando ejecutado: " .. cmd, vim.log.levels.INFO)
      else
        vim.notify("Error al ejecutar comando: " .. cmd, vim.log.levels.ERROR)
      end
    end)
  end, {})
end


