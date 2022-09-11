vim.cmd([[
    nnoremap <C-t> :NERDTreeToggle<CR>
    autocmd VimEnter * NERDTree
    autocmd BufWinEnter * NERDTreeMirror

    " close nerdtree if it is the only buffer in tab
    autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif
]])
vim.g.NERDTreeWinSize=38
