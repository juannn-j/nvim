return {
  "dgox16/oldworld.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    variant = "oled",
  },
  config = function()
    vim.cmd("colorscheme oldworld")
  end,
}

