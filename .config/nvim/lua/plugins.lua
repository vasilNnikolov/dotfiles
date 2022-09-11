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
    use 'tpope/vim-fugitive'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- python
    use "psf/black"
    use 'fisadev/vim-isort'

    --latex
    use 'lervag/vimtex'
end)
