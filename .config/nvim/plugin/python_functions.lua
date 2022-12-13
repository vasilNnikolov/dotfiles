vim.cmd[[
    let g:python3_host_prog = $HOME . '/.vim/nvim_venv/bin/python'
    augroup black_on_save
      autocmd!
      autocmd BufWritePre *.py Black
    augroup end
]]
