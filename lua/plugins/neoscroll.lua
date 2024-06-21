return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	enabled = true,
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = true,
			cursor_scrolls_alone = true,
			easing_function = nil,
			pre_hook = nil,
			post_hook = nil,
			performance_mode = false,
		})

		local t = {}
		t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
		t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
		t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
		t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
		t["<C-y>"] = { "scroll", { "-0.01", "false", "0" } }
		t["<C-e>"] = { "scroll", { "0.01", "false", "0" } }
		t["zt"] = { "zt", { "250" } }
		t["zz"] = { "zz", { "250" } }
		t["zb"] = { "zb", { "250" } }

		require("neoscroll.config").set_mappings(t)
	end,
}
