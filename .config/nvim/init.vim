" general settings
let mapleader = " "
set scrolloff=8
set signcolumn=no 
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set nu rnu
set nohlsearch
set exrc
set mouse=a
set incsearch
set termguicolors

set wrap

" so the jk command will not work if k is pressed more than 0.1s after j
set timeoutlen=400
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

    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'fisadev/vim-isort'

    Plug 'lervag/vimtex'
call plug#end() 
" -----------------------------colorscheme----------------------------------
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
let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-pyright', 'coc-pairs', 'coc-rust-analyzer', 'coc-vimtex', 'coc-sh']
" insert mode completion 
let g:cot = "menuone,preview,noinsert"

let g:python_highlight_space_errors = 0

" ------------------------------NERDTree------------------------------------------
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()


" plugin related keyibnds
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufWinEnter * NERDTreeMirror

" jump to definition with space d, go back wiht Ctrl-O
nnoremap <silent> <leader>d :call CocActionAsync('jumpDefinition')<CR>
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif

" ----------------------------LaTeX--------------------------------------------
filetype plugin indent on
" set encoding=utf-8

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax on 

let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = " "

" ---------------------------window movement-------------------------------
" set <Leader>a to move win
nnoremap <Leader>a <C-w>h
nnoremap <Leader>l <C-w>l

" ---------------------------folding-------------------------------------
set foldmethod=indent
set foldnestmax=20
set foldlevel=20
set nofoldenable

set autochdir

augroup VimrcGroup
  autocmd!
  autocmd bufwritepost $MYVIMRC call OnSavingVimrc()
augroup END

" Avoid infinite loops
if !exists("*OnSavingVimrc")
  function! OnSavingVimrc()
    mapclear
    echo "Sourcing Vimrc after saving it"
    source $MYVIMRC
  endfunction
endif

" apply black on saving py files
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

nnoremap <Leader><Tab> :tabnext<cr>
inoremap jk <Esc>

"-----------------visual selection---------------------------
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
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" for commenting and uncommenting blocks of code
xmap <C-\> gc

" let $PAGER=''
" autocmd VimLeave * call system("xsel -ib", getreg('+'))
" set undofile " Maintain undo history between sessions
" set undodir=~/.vim/undodir
