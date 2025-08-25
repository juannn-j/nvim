-- plugins/quarto.lua
return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				chunks = "curly",
				languages = { "r", "python", "julia", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = false,
				never_run = { "yaml" }, -- filetypes which are never sent to a code runner
			},
		},
		config = function(_, opts)
			local quarto = require("quarto")
			local runner = require("quarto.runner")

			quarto.setup(opts)

			-- Vista previa de Quarto
			vim.keymap.set("n", "<leader>qpp", quarto.quartoPreview, {
				silent = true,
				noremap = true,
				desc = "Abrir vista previa de Quarto",
			})
			vim.keymap.set("n", "<leader>qpo", quarto.quartoClosePreview, {
				silent = true,
				noremap = true,
				desc = "Cerrar vista previa de Quarto",
			})

		end,
	},
}
