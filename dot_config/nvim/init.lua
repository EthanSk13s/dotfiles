vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {'neovim/nvim-lspconfig',
                 {'ms-jpq/coq_nvim', branch = 'coq'},
                 {'ms-jpq/coq.artifacts', branch = 'artifacts'},
                 'nvim-tree/nvim-web-devicons',
                 'folke/trouble.nvim',
                 "williamboman/mason.nvim",
                 'nvim-tree/nvim-tree.lua',
                 'nvim-tree/nvim-web-devicons',
                 'NvChad/nvim-colorizer.lua',
                 {"catppuccin/nvim", name = "catppuccin"},
                 'AlphaTechnolog/pywal.nvim',
                 'nvim-lualine/lualine.nvim',
                 {'akinsho/bufferline.nvim', tag = "v3.2"},
                 'lewis6991/gitsigns.nvim',
                 'windwp/nvim-autopairs',
                 'lukas-reineke/indent-blankline.nvim',
                 'nmac427/guess-indent.nvim',
                 'benknoble/vim-mips',
                 -- Dashboard
                 {'glepnir/dashboard-nvim',
                  event = 'VimEnter',
                  config = function()
                      require('dashboard').setup{
                          theme = 'hyper'
                      }
                  end
                 }
}

-- Plugin setups
require("lazy").setup(plugins)
require("mason").setup()
require("nvim-tree").setup()
require("colorizer").setup()
require('lualine').setup()
require("bufferline").setup{}
require('gitsigns').setup()
require('nvim-autopairs').setup{}
require('guess-indent').setup{}
require("indent_blankline").setup {
    show_end_of_line = true,
}

local coq = require("coq")

-- LSP configs
require'lspconfig'.clangd.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.pyright.setup{}

-- Settings
vim.opt.list = true
vim.opt.termguicolors = true

vim.cmd("set autoindent expandtab tabstop=4 shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("colorscheme pywal")
vim.cmd("COQnow --shut-up")
