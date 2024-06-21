return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"glepnir/lspsaga.nvim",
		"octaltree/cmp-look",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()
		local borderstyle = {
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
			border = "rounded",
			max_width = 50,
			min_width = 50,
			max_height = math.floor(vim.o.lines * 0.4),
			min_height = 3,
		}

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-space>"] = cmp.mapping.complete({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			sources = cmp.config.sources({
				{ name = "cmp_tabnine", priority = 1000 },
				{ name = "nvim_lsp", priority = 900 },
				{ name = "buffer", priority = 750, keyboard_length = 1 },
				{ name = "nvim_lsp_signature_help", priority = 250 },
				{ name = "path", priority = 150 },
				{ name = "luasnip", priority = 100 },
				{
					name = "look",
					priority = 50,
					keyword_length = 2,
					option = {
						convert_case = true,
						loud = true,
					},
				},
			}),
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				buffer = 1,
				path = 1,
			},
			window = {
				documentation = borderstyle,
				completion = borderstyle,
			},
			experimental = {
				ghost_text = true,
			},
			view = {
				entryies = "native",
			},

			formatting = {
				fields = { "abbr", "kind" },
				format = function(entry, vim_item)
					vim_item.kind = lspkind.symbolic(vim_item.kind, {
						mode = "symbol",
						maxwidth = 50,
						ellispsis_char = "...",
						show_labelDetails = false,
					})
					if entry.source.name == "cmp_tabnine" then
						local detail = (entry.completion_item.labelDetails or {}).detail
						vim_item.kind = ""
						if detail and detail:find(".*%%.*") then
							vim_item.kind = vim_item.kind .. " " .. detail
						end

						if (entry.completion_item.data or {}).multiline then
							vim_item.kind = vim_item.kind .. " " .. "[ML]"
						end
					end
					local maxwidth = 50
					vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
					return vim_item
				end,
			},

			-- formatting = {
			-- 	fields = { "kind", "abbr", "menu" },
			-- 	-- fields = { "kind", "abbr" },
			-- 	format = lspkind.cmp_format({
			-- 		mode = "symbols",
			-- 		maxwidth = 50,
			-- 		ellispsis_char = "...",
			-- 		show_labelDetails = false,
			-- 		before = function(entry, vim_item)
			-- 			local ELLIPSIS_CHAR = "…"
			-- 			local MAX_LABEL_WIDTH = 15
			-- 			local label = vim_item.abbr
			-- 			local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
			-- 			if truncated_label ~= label then
			-- 				vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
			-- 			end
			--
			-- 			if entry.source.name == "cmp_tabnine" then
			-- 				local detail = (entry.completion_item.labelDetails or {}).detail
			-- 				vim_item.kind = ""
			-- 				if detail and detail:find(".*%%.*") then
			-- 					vim_item.kind = vim_item.kind .. " " .. detail
			-- 				end
			--
			-- 				if (entry.completion_item.data or {}).multiline then
			-- 					vim_item.kind = vim_item.kind .. " " .. "[ML]"
			-- 				end
			-- 			end
			--
			-- 			-- vim_item.menu = ({
			-- 			-- 	buffer = "[Buff]",
			-- 			-- 	nvim_lsp = "[LSP]",
			-- 			-- 	luasnip = "[LuaSnip]",
			-- 			-- 	nvim_lua = "[Lua]",
			-- 			-- 	cmp_tabnine = "[Tabnine]",
			-- 			-- })[entry.source.name]
			--
			-- 			-- for codeium
			-- 			-- if vim_item.kind == "Codeium" then
			-- 			-- 	vim_item.menu = "[󱚤]"
			-- 			-- 	vim_item.kind = " "
			-- 			-- 	return vim_item
			-- 			-- end
			--
			-- 			-- for tabnine
			-- 			if vim_item.kind == "cmp_tabnine" then
			-- 				vim_item.menu = "[󱚤]"
			-- 				vim_item.kind = " "
			-- 				return vim_item
			-- 			end
			--
			-- 			return vim_item
			-- 		end,
			-- }),
			-- },
		})
	end,
}
