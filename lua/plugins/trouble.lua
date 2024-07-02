return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local trouble = require("trouble")
		local wk = require("which-key")

		-- Register key mappings
		wk.register({
			x = {
				name = "Trouble",
				x = {
					function()
						trouble.toggle()
					end,
					"Trouble: toggle",
				},
				w = {
					function()
						trouble.toggle("workspace_diagnostics")
					end,
					"Trouble: workspace diagnostics",
				},
				d = {
					function()
						trouble.toggle("document_diagnostics")
					end,
					"Trouble: document diagnostics",
				},
				q = {
					function()
						trouble.toggle("quickfix")
					end,
					"Trouble: quickfix list",
				},
				l = {
					function()
						trouble.toggle("loclist")
					end,
					"Trouble: location list",
				},
				t = {
					function()
						trouble.open("todo")
					end,
					"Trouble: open todos",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
