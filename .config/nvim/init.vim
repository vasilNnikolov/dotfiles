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
  " so the jk command will not work if k is pressed more than 0.1s after j
  set timeoutlen=400
  " make cursor pipe in insert mode
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
  set nocompatible
  filetype off   

  let g:ale_completion_enabled = 1

  call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'preservim/nerdtree'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'

    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

    Plug 'lervag/vimtex'

    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()            

let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-pairs', 'coc-pyright', 'coc-rls', 'coc-vimtex']

" let g:python_highlight_all = 0
let g:python_highlight_space_errors = 0

" ----------------------------LATEX----------------------------
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
" enable word wrap for latex files
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal wrap linebreak nolist
augroup END

filetype plugin indent on
set encoding=utf-8

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = 'latexmk'

" let g:Tex_IgnoredWarnings = 
"     \'Underfull'."\n".
"     \'Overfull'."\n".
"     \'specifier changed to'."\n".
"     \'You have requested'."\n".
"     \'Missing number, treated as zero.'."\n".
"     \'There were undefined references'."\n".
"     \'Citation %.%# undefined'."\n".
"     \'A float is stuck'."\n".
"     \'Double space found.'."\n"
" let g:Tex_IgnoreLevel = 10 

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = " "



" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

filetype plugin indent on    " required

" colorscheme
colorscheme gruvbox
set bg=dark

" plugin related keyibnds
nnoremap <C-t> :NERDTreeToggle<CR>

" syntax highlighting
syntax on
set foldmethod=indent
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

nnoremap <Leader><Tab> :tabnext<cr>
nnoremap <Leader>t :tabnew<Space>
inoremap jk <Esc>

"allow buffer switching without saving
set hidden

"vim tips below
"searches visual selection
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
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" for commenting and uncommenting blocks of code
xmap <C-\> gc

let $PAGER=''
autocmd VimLeave * call system("xsel -ib", getreg('+'))
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
