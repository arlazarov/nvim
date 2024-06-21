local M = {}

function M.map(bufnr)
	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local mappings = {
		-- ["<cr>"] = { "<cmd>:Lspsaga code_action<cr>", "Action: code action" },
		["?"] = { "<cmd>Lspsaga hover_doc<cr>", "LSP: show documentation" },
		["+"] = { "<cmd>Telescope luasnip<cr>", "Code: snippets" },
		["l"] = {
			name = "LSP",
			a = { "<cmd>:Lspsaga code_action<cr>", "code action" },
			r = { vim.lsp.buf.rename, "rename" },
			R = { "<cmd>LspRestart<cr>", "restart server" },
			p = {
				name = "Peek",
				{
					d = {
						"<cmd>Lspsaga peek_definition<cr>",
						"peak defenition",
					},
					t = {
						"<cmd>Lspsaga peek_type_definition<cr>",
						"peak type defenition",
					},
				},
			},
			g = {
				name = "Go to",
				{
					d = {
						"<cmd>Lspsaga goto_definition<cr>",
						"go to defenition",
					},
					t = {
						"<cmd>Lspsaga goto_type_definition<cr>",
						"go to type defenition",
					},
					r = {
						"<cmd>Telescope lsp_references<cr>",
						"go to definition, references",
					},
					i = {
						"<cmd>Telescope lsp_implementations<cr>",
						"go to lsp implementations",
					},
					D = { vim.lsp.buf.declaration, "go to declaration" },
				},
			},
			{
				d = {
					name = "Diagnostic",
					D = {
						"<cmd>Telescope diagnostics bufnr=0<cr>",
						"Diagnostic: show diagnostics for file",
					},
					d = { vim.diagnostic.open_float, "Diagnostic: show diagnostics for line" },
					f = {
						"<cmd>lua require('echo-diagnostics').echo_entire_diagnostic()<cr>",
						"Diagnostic: echo diagnostics",
					},
				},
			},
		},
	}
	require("which-key").register(mappings, opts)
end

return M
