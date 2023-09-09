local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "scss",
    "terraform",
    "yaml",
    "rust",
    "cpp",
    "dockerfile",
    "http",
    "json",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "cssmodules-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "eslint_d",
    "json-lsp",
    "jsonld-lsp",
    "lua-language-server",
    "marksman",
    "prettier",
    "prisma-language-server",
    "stylelint-lsp",
    "stylua",
    "tailwindcss-language-server",
        
    "rust-analyzer",
        
    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cmake-language-server",
    "cmakelint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
