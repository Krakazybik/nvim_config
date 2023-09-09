local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "cmake",
  "rust_analyzer",
  "marksman",
  "jsonls",
  "tailwindcss",
  "docker_compose_language_service",
  "dockerls",
  "cssmodules_ls",
  "terraformls",
  "prismals",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jsonls.setup {
  on_attach = on_attach,
  init_options = {
    provideFormatter = true,
  },
}

lspconfig.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
    },
  },
  filetypes = { "css", "sass", "scss" },
}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        local kill = { "pkill", ".*eslint -f json.*", "-f" }
        vim.fn.jobstart(kill)
        vim.cmd "EslintFixAll"
      end,
    })
  end,
}

lspconfig.cssmodules_ls.setup {
  on_attach = function(client)
    -- avoid accepting `definitionProvider` responses from this LSP
    client.server_capabilities.definitionProvider = false
    on_attach(client)
  end,
}

lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
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
