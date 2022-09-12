vim.cmd([[
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.colnr = ' '
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#enabled = 1

    let g:airline_theme= 'gruvbox'
    colorscheme gruvbox
]])
