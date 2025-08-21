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
				enabled = true,
				default_method = "slime", -- "molten", "slime", "iron" or <function>
				ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
				-- Takes precedence over `default_method`
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

			-- Keymaps para ejecutar código
			vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "Run cell", silent = true })
			vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "Run cell and above", silent = true })
			vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "Run all cells", silent = true })
			vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "Run line", silent = true })
			vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "Run visual range", silent = true })
			vim.keymap.set("n", "<leader>RA", function()
				runner.run_all(true)
			end, { desc = "Run all cells (all languages)", silent = true })
		end,
	},
}
