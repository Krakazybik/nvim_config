-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
local opt = vim.opt
local g = vim.g
local api = vim.api
local wo = vim.wo

-- General
wo.wrap = false
wo.relativenumber = true

-- Snippets path
g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

-- Indents
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- Copilot
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_filetypes = {
    markdown = true,
    xml = true
}

api.nvim_set_keymap('i', '<M-\\>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
api.nvim_set_hl(0, "CopilotSuggestion", { ctermfg=8, fg="#bd93f9", italic=true, bold=true })
