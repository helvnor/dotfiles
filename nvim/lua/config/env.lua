return {
	is_minimal = vim.env.NVIM_MINIMAL == "1" or vim.env.SSH_CONNECTION ~= nil,
}
