-- daily
vim.keymap.set('i', 'ii', '<Esc>', {noremap = true})
vim.keymap.set('n', '<leader>\\', ':Commentary<CR>')

-- Fzf
vim.keymap.set('n', '<C-p>', ':FZF<Cr>', {noremap = true})

-- coc 
vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() ~= 0 then
		return vim.fn['coc#_select_confirm']()
	else 
		return '<Tab>'
	end
end, { expr = true })

-- commentary 
vim.cmd "autocmd FileType conf,sh,text setlocal commentstring=#\\ %s"
vim.cmd "autocmd FileType vue,ts,tsx setlocal commentstring=// %s"
vim.cmd "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#"
