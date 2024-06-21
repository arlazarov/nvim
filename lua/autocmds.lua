-- Change relativenumbers on insert
-- local au_relNum = vim.api.nvim_create_augroup("_change_relative_numbers", { clear = true })
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	group = au_relNum,
-- 	callback = function()
-- 		vim.opt.relativenumber = true
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	group = au_relNum,
-- 	callback = function()
-- 		vim.opt.relativenumber = false
-- 	end,
-- })
-- Go in to insert mode in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.cmd.startinsert()
	end,
})
-- Check for file update
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	callback = function()
		vim.api.nvim_command("checktime")
	end,
})
-- Disable diagnostics in insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "n:i", "v:s" },
	desc = "Disable diagnostics in insert and select mode",
	callback = function(e)
		vim.diagnostic.disable(e.buf)
	end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "i:n",
	desc = "Enable diagnostics when leaving insert mode",
	callback = function(e)
		vim.diagnostic.enable(e.buf)
	end,
})
