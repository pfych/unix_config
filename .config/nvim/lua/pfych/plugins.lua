local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip'

  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim' -- LSP Installer
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use { 'catppuccin/nvim', as = "catppuccin" }

  use "nvim-lua/plenary.nvim"
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'prettier/vim-prettier', build = 'pnpm install' }

  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  use 'bellinitte/uxntal.vim'

  use { 'edkolev/tmuxline.vim', run = ':Tmuxline vim_statusline_2' }

  use 'preservim/nerdtree'
end)
