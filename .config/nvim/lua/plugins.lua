return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'preservim/nerdtree'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-commentary'
    use 'sheerun/vim-polyglot'
    
    use 'jiangmiao/auto-pairs'
    use 'neovim/nvim-lspconfig'
end)
