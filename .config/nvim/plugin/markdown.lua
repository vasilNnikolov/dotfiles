-- vim.cmd([[
--     autocmd BufWritePost *.md silent! !pandoc -V lang=bg % -o %:r.pdf 
-- ]])
vim.cmd([[
    autocmd BufWritePost *.tex silent! !pdflatex %
]])
