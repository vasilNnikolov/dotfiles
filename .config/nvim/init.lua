require('options')
require('keymaps')
vim.cmd([[colorscheme gruvbox]])


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[
            packadd packer.nvim
        ]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use 'preservim/nerdtree'
end)

