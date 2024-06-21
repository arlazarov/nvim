local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- vim.opt.mousescroll = "ver:0,hor:0"
map("t", "<Esc>", "<C-\\><C-n>", opts) -- remap escape
map({ "n", "v" }, "<Space>", "<Nop>", opts) -- unbind Space
map({ "n", "x" }, "Q", "<nop>") -- unbind Q
map("i", "jk", "<ESC>", opts) -- jk exit insert mode
map("n", "<backspace><backspace>", '<cmd>bdelete!"<cr>', opts) --delete buffer
map("i", "<C-l>", "<Del>", opts) --delete inset mode
-- map("n", "G", "Gzzzv", opts) -- end of the line
-- wrap text move
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true })
-- navigate around quickfix list
map("n", "<C-n>", "<cmd>cnext<CR>", opts)
map("n", "<C-p>", "<cmd>cprev<CR>", opts)
-- avoid vim register for some operations
map("n", "x", [["_x]], opts)
map("x", "p", [["_dP]], opts)
map("n", "<leader>Y", [["+Y]], opts) -- copy current line to system clipboard
map("n", "<leader>vp", "`[v`]", opts) -- reselect pasted text
map({ "n", "x" }, "<leader>y", [["+y]], opts) -- copy to system clipboard
map({ "n", "x" }, "<leader>p", [["+p]], opts) -- paste from system clipboard
map("n", "YY", "va{Vy", opts) -- select inside {}
map("n", "YA", "<cmd>%y<cr>", opts) -- select all text
-- search and replace
map("n", "gR", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]], opts)
map("n", "gr", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>]], opts)
-- witch key
opts = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true,
	nowait = true,
}
local mappings = {
	--window
	w = {
		name = "Window manager",
		s = { "<c-w>s", "Window: split" },
		v = { "<c-w>v", "Window: vSplit" },
		c = { "<cmd>close<cr>", "Window: close" },
		["="] = { "<C-w>=", "Window: equal size" },
	},
	-- tabs
	t = {
		name = "Tab manager",
		n = { "<cmd>tabnew<cr>", "Tab: new" },
		c = { "<cmd>tabclose<cr>", "Tab: close" },
		l = { "<cmd>tabn<cr>", "Tab: next" },
		h = { "<cmd>tabp<cr>", "Tab: previous" },
		m = { "<cmd>tabnew %<cr>", "Tab: to new tab" },
	},
	-- buffer
	b = {
		name = "Buffer manager",
		c = { "<cmd>bdelete!<cr>", "Buffer: close" },
		k = { "<cmd>%bd|e#<cr>", "Buffer: close all" },
		l = { "<cmd>bnext<cr>", "Buffer: next" },
		h = { "<cmd>bprevious<cr>", "Buffer: previous" },
	},
	-- text
	o = {
		name = "Other",
		s = { "<cmd>setlocal spell!<cr>", "Toggle spell" },
		n = { "<cmd>set number!<cr>", "Toggle line number" },
		h = { "<cmd>nohl<cr>", "No highlight search" },
		["+"] = { "<c-a>", "Increment numbrer" },
		["-"] = { "<c-x>", "Decrement numbrer" },
	},
	H = { "<cmd>nohl<cr>", "No highlight search" },
}
require("which-key").register(mappings, opts)
