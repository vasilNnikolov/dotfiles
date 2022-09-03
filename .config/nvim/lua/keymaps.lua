vim.g.mapleader = " "
vim.opt.timeoutlen = 400
-- keymaps
vim.keymap.set('i', 'jk', '<Esc>', {noremap = true})
vim.keymap.set('n', '<leader>sv', ':w<CR>:so %<CR>',{noremap = true})
