local dap = require('dap')

dap.set_log_level('DEBUG')

dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
	options = {
		initialize_timeout_sec = 10,
	},
  }

}

dap.configurations.go = {
	{
		type = 'delve';
		name = 'Debug Package';
		request = 'launch';
		program = 'main.go';
	},
}
