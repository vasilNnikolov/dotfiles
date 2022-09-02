" general settings
let mapleader = " "
set scrolloff=12
set signcolumn=no 
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set nu rnu
set nohlsearch
set mouse=a
set incsearch
set termguicolors
set autochdir

set wrap
set linebreak

" so the jk command will not work if k is pressed more than 0.1s after j
set timeoutlen=400
inoremap jk <Esc>
" make cursor pipe in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'preservim/nerdtree'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'
    
    Plug 'jiangmiao/auto-pairs'

    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'fisadev/vim-isort'

    Plug 'lervag/vimtex'
call plug#end() 
" ----------------------------colorscheme----------------------------------
colorscheme gruvbox
set bg=dark

" ----------------------------vim-airline--------------------------------------- 
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' '

" ----------------------------coc.nvim--------------------------------------
let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-vimtex', 'coc-sh']
" insert mode completion 
let g:cot = "menuone,preview,noinsert"

let g:python_highlight_space_errors = 0
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

" ----------------------------NERDTree------------------------------------------
let g:NERDTreeWinSize=38

nnoremap <C-t> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" jump to definition with space d, go back wiht Ctrl-O
nnoremap <silent> <leader>d :call CocActionAsync('jumpDefinition')<CR>
" close nerdtree if it is the only buffer in tab
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif

" ----------------------------vim-commentary-------------------------- 
xmap <C-\> gc

" ----------------------------LaTeX--------------------------------------------
filetype plugin indent on
" syntax on 

let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = 'latexmk'

let maplocalleader = " "

" ----------------------------window and tab movement-------------------------------
" set <Leader>a to move win
nnoremap <Leader>a <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader><Tab> :tabnext<cr>

" ----------------------------folding-------------------------------------
set foldmethod=indent
set foldnestmax=20
set foldlevel=20
set nofoldenable

" ----------------------------black------------------------------
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
  autocmd BufWritePre *.py Isort
augroup end

" ----------------------------visual selection---------------------------
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction

nnoremap <silent> <expr> <CR> Highlighting()

" ----------------------------autosource init.vim on save ----------------
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
