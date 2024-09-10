local keyset = vim.keymap.set

-- daily
keyset('i', 'ii', '<Esc>', {noremap = true})
keyset('n', '<leader>\\', ':Commentary<CR>')
keyset('n', '<C-t>', ':NERDTreeToggle<CR>')
keyset('n', '<C-w>', ':BufferClose<CR>')

-- File Search
local tele = require("telescope.builtin")
keyset('n', '<C-p>', tele.find_files, {noremap = true})
keyset('n', '<C-f>', tele.live_grep, {noremap = true})
keyset('n', '<leader>fg', tele.live_grep )

-- commentary  
vim.cmd "autocmd FileType conf,sh,text setlocal commentstring=#\\ %s"
vim.cmd "autocmd FileType vue,ts,tsx setlocal commentstring=// %s"
vim.cmd "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#"

