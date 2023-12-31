local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Auto tag
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = true,
    event = "VeryLazy",
  },
  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = true,
    event = "VeryLazy",
  },
  {
    "vimwiki/vimwiki",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "tools-life/taskwiki",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "kalafut/vim-taskjuggler",
    event = { "BufRead", "BufNewFile" },
    lazy = true,
    init = function()
      vim.api.nvim_create_augroup("tjpfiletypedetect", { clear = true })
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.tjp", "*.tji" },
        command = "set filetype=tjp",
      })
    end,
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
    lazy = true,
  },
  {
    "prisma/vim-prisma",
    event = "VeryLazy",
    lazy = true,
  },
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.g.codeium_no_map_tab = 1
      vim.keymap.set("i", "<M-\\>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end,
  },
  {
    "pearofducks/ansible-vim",
    event = { "BufRead", "BufNewFile" },
    lazy = true,
  },
}

return plugins
