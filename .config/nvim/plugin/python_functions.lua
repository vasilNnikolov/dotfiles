vim.cmd[[
    autocmd BufWritePre *.py execute 'Black'
    autocmd BufWritePre *.py execute 'Isort'
]]

