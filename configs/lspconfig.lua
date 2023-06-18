local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "marksman", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.eslint.setup {}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

--lspconfig.rust_analyzer.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    ["rust-analyzer"] = {
--     import = {
--        granularity = {
--          group = "module",
--        },
--        prefix = "self",
--      },
--      cargo = {
--        buildScripts = {
--          enable = true,
--        },
--      },
--      procMacro = {
--        enable = true,
--      },
--    },
--  },
--}
