require('dap-go').setup {
	delve = {
		path = '~/go/bin/dlv',
		detached = true,
		cwd = nil,
	},
}

require("dapui").setup({
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 1
          }, },
        position = "bottom",
        size = 13
      } },
})
