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
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
-- General
wo.wrap = false
wo.relativenumber = true

-- Snippets path
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
g.loaded_python3_provider = 1
g.python3_host_prog = "/usr/bin/python3"
-- Indents
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
-- Enable Providers
local enable_providers = {
  "python3_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
-- Copilot
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_filetypes = {
  markdown = true,
  xml = true,
}

api.nvim_set_hl(0, "CodeiumSuggestion", { ctermfg = 8, fg = "#bd93f9", italic = true, bold = true })
