vim.cmd[[
    autocmd BufWritePre *.py silent execute 'Black' 
    autocmd BufWritePre *.py silent execute 'Isort' 
]]

