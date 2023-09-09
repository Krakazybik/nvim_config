local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "scss", "json", "yaml" } }, -- so prettier works only on these filetypes
  b.formatting.eslint_d.with { filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.diagnostics.eslint_d.with { filetypes = { "javascriptreact", "javascript", "typescript", "typescriptreact" } },

  -- rust
  b.formatting.rustfmt,
}

null_ls.setup {
  sources = sources,
}
