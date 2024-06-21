vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#111111", fg = "yellow" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#333333" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#111111" })

vim.cmd("highlight! link SignColumn LineNr")
vim.cmd("autocmd InsertEnter * hi CursorLine guibg=#333333")
vim.cmd("autocmd InsertEnter * hi CursorLineNr guibg=#333333")
vim.cmd("autocmd InsertLeave * hi CursorLine guibg=#111111")
vim.cmd("autocmd InsertLeave * hi CursorLineNr guibg=#111111")

vim.api.nvim_set_hl(0, "MatchParen", { bg = "#333333" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#111111" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#FFFFFF" })

vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none", fg = "red" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "none", fg = "yellow" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "none", fg = "green" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "none", fg = "yellow" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
