return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	-- ---@type render.md.UserConfig
	opts = {
		completions = {
			blink = { enabled = true },
			lsp = { enabled = true },
		},
		lazy = true,
		render_modes = true,
		heading = { enabled = false },
		sign = { enabled = false },
		code = { enabled = false },
	},
}
