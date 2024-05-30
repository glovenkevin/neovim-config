local api = vim.api

-- Debug
api.nvim_create_user_command('DapClose', function() 
	require('dapui').close()		
end, {})

