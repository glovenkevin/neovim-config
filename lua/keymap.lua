-- daily
vim.keymap.set('i', 'ii', '<Esc>', {noremap = true})
vim.keymap.set('n', '<leader>\\', ':Commentary<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

-- Fzf
vim.keymap.set('n', '<C-p>', ':Files<Cr>', {noremap = true})

-- coc 
local keyset = vim.keymap.set

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- commentary  
vim.cmd "autocmd FileType conf,sh,text setlocal commentstring=#\\ %s"
vim.cmd "autocmd FileType vue,ts,tsx setlocal commentstring=// %s"
vim.cmd "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#"
