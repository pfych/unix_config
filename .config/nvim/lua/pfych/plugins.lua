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
	use 'williamboman/mason.nvim' -- LSP Installer
	use 'williamboman/mason-lspconfig.nvim'

	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

	use { 'prettier/vim-prettier', run = 'pnpm install' }
end)
