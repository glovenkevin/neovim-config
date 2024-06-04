local keyset = vim.keymap.set

-- daily
keyset('i', 'ii', '<Esc>', {noremap = true})
keyset('n', '<leader>\\', ':Commentary<CR>')
keyset('n', '<C-t>', ':NERDTreeToggle<CR>')
keyset('n', '<C-w>', ':BufferClose<CR>')

-- Fzf
keyset('n', '<C-p>', ':Files<Cr>', {noremap = true})

-- commentary  
vim.cmd "autocmd FileType conf,sh,text setlocal commentstring=#\\ %s"
vim.cmd "autocmd FileType vue,ts,tsx setlocal commentstring=// %s"
vim.cmd "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#"

-- debug
keyset('n', '<F5>', ':lua require(\'dap\').continue()<Cr>')

