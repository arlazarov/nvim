return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		require("which-key").register({
			x = {
				name = "Trouble",
				x = { "<cmd>TroubleToggle<cr>", "Trouble: toggle" },
				w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble: workspace diagnostics" },
				d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble: document diagnostics" },
				q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble: quickfix list" },
				l = { "<cmd>TroubleToggle loclist<cr>", "Trouble: location list" },
				t = { "<cmd>TodoTrouble<cr>", "Trouble: open todos" },
			},
		}, { prefix = "<leader>" })
	end,
}
