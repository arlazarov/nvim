return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/which-key.nvim",
		"seblj/nvim-echo-diagnostics",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	pots = {
		inlay_hints = { enabled = true },
	},
	config = function()
		require("plugins.lsp.config.handlers").setup()
		local lspconfig = require("lspconfig")
		local servers = {
			"lua_ls",
			"jsonls",
			"cssls",
			"tailwindcss",
			"tsserver",
			"bashls",
			"emmet_language_server",
			"eslint",
		}
		require("mason-lspconfig").setup({ ensure_installed = servers })
		for _, server in pairs(servers) do
			local opts = {
				on_attach = require("plugins.lsp.config.handlers").on_attach,
				capabilities = require("plugins.lsp.config.handlers").capabilities,
			}
			local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.languages." .. server)
			if has_custom_opts then
				opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
			end
			lspconfig[server].setup(opts)
		end
	end,
}
