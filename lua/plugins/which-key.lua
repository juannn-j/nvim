return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = "modern",
    -- icons = {
    --   rules = {
    --     { plugin = "laravel.nvim", icon = " ", color = "red" },
    --     { plugin = "nvim-dap-ui", icon = " ", color = "green" },
    --     { pattern = "obsidian", icon = " ", color = "blue" },
    --     { pattern = "avante", icon = " ", color = "green" },
    --   },
    -- }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
