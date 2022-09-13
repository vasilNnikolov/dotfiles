vim.cmd([[
    autocmd BufWritePre *.rs execute 'RustFmt'
]])
