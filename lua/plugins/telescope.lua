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
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("noice")
		telescope.load_extension("luasnip")

		require("which-key").register({
			f = {
				name = "Telescope",
				l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope: Find file" },
				f = { "<cmd>Telescope find_files<cr>", "Telescope: Find file" },
				r = { "<cmd>Telescope oldfiles<cr>", "Telescope: Find recent file" },
				s = { "<cmd>Telescope live_grep<cr>", "Telescope: Find string in cwd" },
				c = { "<cmd>Telescope grep_string<cr>", "Telescope: Find string under cursor in cwd" },
				t = { "<cmd>TodoTelescope<cr>", "Telescope: Find todos" },
			},
		}, { prefix = "<leader>" })
	end,
}
