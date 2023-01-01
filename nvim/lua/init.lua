-- the local machine specific identifier of the folder in the '~/.config/nvim/lua'
local user = 'oat-mini.'

print('Hello from '..user..' ~/.config/nvim/lua/init.lua')

require(user..'plugins-setup')

require(user..'core.options')
require(user..'core.keymaps')

require(user..'plugins-config.treesitter')
require(user..'plugins-config.telescope')
require(user..'plugins-config.nvim-tree')

require(user..'plugins-config.material-nvim')
-- require(user..'plugins-config.gruvbox')     -- alternative colorscheme
require(user..'plugins-config.lualine')
require(user..'plugins-config.autopairs')
require(user..'plugins-config.autotag')
require(user..'plugins-config.virt-column')
require(user..'plugins-config.gitsigns')

require(user..'plugins-config.lsp.mason')
require(user..'plugins-config.lsp.lsp_config')
require(user..'plugins-config.nvim-cmp')

require(user..'plugins-config.twilight')
-- require(user..'plugins-config.true-zen')

require(user..'plugins-config.lazygit-nvim')

require(user..'plugins-config.indent-blankline')

require(user..'plugins-config.tabnine')


