vim.cmd([[
let g:NERDTreeWinSize=38

nnoremap <C-t> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" jump to definition with space d, go back wiht Ctrl-O
nnoremap <silent> <leader>d :call CocActionAsync('jumpDefinition')<CR>
" close nerdtree if it is the only buffer in tab
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif
]])
