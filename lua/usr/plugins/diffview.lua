return {
  'sindrets/diffview.nvim',
  dependencies = {
    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- https://github.com/sindrets/diffview.nvim?tab=readme-ov-file#configuration

    require('diffview').setup({
      diff_binaries = false,    -- Show diffs for binaries
      enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
      git_cmd = { "git" },      -- The git executable followed by default args.
      hg_cmd = { "hg" },        -- The hg executable followed by default args.
      use_icons = true,         -- Requires nvim-web-devicons
      show_help_hints = true,   -- Show hints for how to open the help panel
      watch_index = true,       -- Update views and index buffers when the git index changes.
      icons = {                 -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
    })
  end,
  hooks = {},
  keymaps = {},
}