---@type MappingsTable
local M = {}

M.general = {
  n = {
    --    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}
M.custom = {
  n = {
    ["<leader>rr"] = { "<Plug>RestNvim", "Run requst under cursor" },
    ["<leader>rl"] = { "<Plug>RestNvimLast", "Run last request" },
    ["<leader>rp"] = { "<Plug>RestNvimPreview", "Run preveiw request" },
  },
  i = {
    -- ...
  },
}

-- more keybinds!

return M
