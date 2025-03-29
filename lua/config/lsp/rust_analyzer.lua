local default_config = require("lspconfig.configs.rust_analyzer")

local custom_config = {}

local config = vim.tbl_deep_extend("force", default_config, custom_config)

return config
