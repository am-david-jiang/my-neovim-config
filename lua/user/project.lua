local project_nvim = require "project_nvim"

project_nvim.setup { }

local telescope = require "./telescope"

telescope.load_extension('projects')
