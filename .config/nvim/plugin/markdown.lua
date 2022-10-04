vim.cmd([[
    autocmd BufWritePost *.md silent! !pandoc -V lang=bg % -o %:r.pdf 
]])

