require("setup_pre")

local g = vim.g
local home = g.config_home
local lazypath = home .. "/data/lazy/lazy.nvim"

-- clone lazy.vim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require "config.options"
require "config.autocmd"
require "config.keymaps"

-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    {
      "AstroNvim/AstroNvim",
      -- version = "^4", -- Remove version tracking to elect for nightly AstroNvim
      version = "^5",                -- Remove version tracking to elect for nightly AstroNvim
      import = "astronvim.plugins",
      opts = {                       -- AstroNvim options must be set here with the `import` key
        mapleader = ";",             -- This ensures the leader key must be configured before Lazy is set up
        maplocalleader = "\\",       -- This ensures the localleader key must be configured before Lazy is set up
        icons_enabled = true,        -- Set to false to disable icons (if no Nerd Font is available)
        pin_plugins = nil,           -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
        update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
      },
    },
    { import = "community" },
    { import = "plugins" },
  },

  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}

require "polish"
