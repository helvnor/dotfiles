Is_minimal = vim.env.NVIM_MINIMAL == "1" or vim.env.SSH_CONNECTION ~= nil

-- Plugins
require("config.lazy")

-- Options
require("config.options")

-- Keybindings
require("config.keymaps")
