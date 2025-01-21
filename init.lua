require 'core.options'
require 'core.keymaps'

-- [[ Install 'lazy.vim' plugin manager ]]
-- See `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
       error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require 'plugins.neotree',
    require 'plugins.colortheme',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.bufferline',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
})

-- Set flavor of tokyonight to storm
vim.cmd("colorscheme catppuccin-mocha")
