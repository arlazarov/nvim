return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/noice.nvim",
		"folke/trouble.nvim",
		"folke/which-key.nvim",
		{ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- Custom actions
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.open_with_trouble("quickfix")
			end,
		})

		-- Telescope setup
		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"ag",
					"--nogroup",
					"--nocolor",
					"--hidden",
					"-g",
					"!.git",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble.open,
					},
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		telescope.load_extension("noice")
		telescope.load_extension("luasnip")

		-- Key mappings with which-key
		local wk = require("which-key")
		wk.register({
			f = {
				name = "Telescope",
				l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current buffer" },
				f = { "<cmd>Telescope find_files<cr>", "Find files" },
				r = { "<cmd>Telescope oldfiles<cr>", "Find recent files" },
				s = { "<cmd>Telescope live_grep<cr>", "Search in workspace" },
				c = { "<cmd>Telescope grep_string<cr>", "Search under cursor" },
				t = { "<cmd>TodoTelescope<cr>", "Find todos" },
			},
		}, { prefix = "<leader>" })
	end,
}
