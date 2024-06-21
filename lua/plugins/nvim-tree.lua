return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"folke/which-key.nvim",
	},
	config = function()
		local api = require("nvim-tree.api")

		vim.keymap.set("n", "<Tab>", api.tree.toggle, { desc = "toggle" })

		require("which-key").register({
			e = {
				function()
					vim.cmd("cd %:p:h")
					vim.cmd("pwd")
					api.tree.toggle({ path = vim.fn.expand("%:p:h"), find_file = true })
				end,
				"Nvim-tree: setup",
			},
		}, { prefix = "<leader>" })

		local function my_on_attach(bufnr)
			local function sets(desc)
				return { desc = "Nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "<Tab>", api.tree.toggle, { desc = "Nvim-Tree: toggle", buffer = bufnr })
			vim.keymap.set(
				"n",
				"<CR>",
				api.node.open.preview,
				{ desc = "Nvim-tree: edit", noremap = true, silent = true, nowait = true }
			)
			vim.keymap.set("n", "s", api.node.open.horizontal, sets("split"))
			vim.keymap.set("n", "v", api.node.open.vertical, sets("vSplit"))
			vim.keymap.set("n", "p", api.tree.change_root_to_parent, sets("up"))
			vim.keymap.set("n", "gm", api.marks.bulk.move, sets("move bookmarked"))
			vim.keymap.set("n", "c", api.tree.collapse_all, sets("collapse all"))
		end

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			hijack_cursor = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			renderer = {
				highlight_opened_files = "none",
				highlight_git = false,
				add_trailing = false,
				root_folder_modifier = ":t",
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						none = " ",
						corner = "╚",
						edge = "║",
						item = "╠",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "after",
					padding = " ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					-- padding = "  ",
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							-- arrow_closed = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "✐",
							untracked = "○",
							deleted = "⊖",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = true,
				custom = {},
				exclude = {},
			},

			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					hint = "󰠠",
					info = "",
					warning = "",
					error = "",
				},
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				timeout = 400,
			},
			view = {
				centralize_selection = false,
				width = 30,
				side = "left",
			},
		})
	end,
}
