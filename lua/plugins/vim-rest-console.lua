return {
	"diepm/vim-rest-console",
	config = function()
		vim.g.vrc_set_default_mapping = 0
		vim.g.vrc_response_default_content_typr = "application/json"
		vim.g.vrc_output_buffer_name = "_OUTPUT.json"
		vim.g.vrc_auto_format_response_pattern = {
			json = "jq",
		}
		require("which-key").register({
			c = {
				name = "Code",
				r = { "<cmd>call VrcQuery()<cr>", "Code: rest-console" },
			},
		}, { prefix = "<leader>" })
	end,
}
