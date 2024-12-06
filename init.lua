--[[
--=======================================================
  NOTE: This config file is based on Kickstart.nvim.
  @see: https://github.com/nvim-lua/kickstart.nvim?tab=MIT-1-ov-file

--]]

require 'usr.options'

require 'usr.keymaps'

require 'usr.autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  -- All-in-one fuzzy finder
  require 'usr.plugins.telescope',

  -- LSP
  require 'usr.plugins.lazydev',
  require 'usr.plugins.luvit-meta',
  require 'usr.plugins.nvim-lspconfig',
  require 'usr.plugins.tokyonight',
  require 'usr.plugins.lspsaga',

  -- Collection of various small independent plugins/modules
  require 'usr.plugins.mini',

  -- Highlight, edit, and navigate code
  require 'usr.plugins.nvim-treesitter',

  -- Dev Common
  require 'usr.plugins.debug',
  require 'usr.plugins.indent_line',
  require 'usr.plugins.lint',
  require 'usr.plugins.autopairs', -- Automatically close 
  require 'usr.plugins.neo-tree', -- Filetree visualization
  require 'usr.plugins.comment', -- Commenting utils
  require 'usr.plugins.todo-comments', -- Highlight todo, notes, etc in comments
  require 'usr.plugins.confirm',  -- Autoformat
  require 'usr.plugins.vim-sleuth',
  require 'usr.plugins.nvim-cmp', -- Autocompletion


  -- git
  require 'usr.plugins.gitsigns', -- adds gitsigns recommend keymaps
  require 'usr.plugins.diffview',

  -- langs
  require 'usr.plugins.nvim-ts-autotag', -- autoclose / autorename HTML tags
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
