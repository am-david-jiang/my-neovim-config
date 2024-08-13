require "launch"
require "options"
require "keymap"

-- Colorscheme
spec "colorscheme"
-- Devicons
spec "plugins.devicons"
-- Which-Key integration
spec "plugins.whichkey"
-- Nvim Tree
spec "plugins.nvimtree"
-- Programming
-- - Treesitter
spec "plugins.treesitter"
-- - Nvim-cmp configuration
spec "plugins.cmp"
-- - LSP configuration
spec "plugins.mason"
spec "plugins.schemastore"
spec "plugins.lspconfig"
spec "plugins.illuminate"
-- Formatting
spec "plugins.conform"
-- Linting
spec "plugins.nvimlint"
-- Lualine
spec "plugins.lualine"
-- Comments
spec "plugins.comment"
-- Breadcrumbs
spec "plugins.breadcrumbs"
-- Auto Pair
spec "plugins.autopairs"
-- Indent line
spec "plugins.indentline"
-- Telescope
spec "plugins.telescope"
-- Project
spec "plugins.project"
-- Git Signs
spec "plugins.gitsigns"
-- Neogit
spec "plugins.neogit"
-- Trouble.nvim
spec "plugins.trouble"
-- Dashboard Screen
spec "plugins.alpha"

-- Apply all plugins spec via lazy.nvim
require "lazy_manager"
