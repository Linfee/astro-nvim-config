-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

local opts1 = {
  -- Configure core features of AstroNvim
  features = {
    large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    autopairs = true,                                 -- enable autopairs at start
    cmp = true,                                       -- enable completion at start
    diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
    highlighturl = true,                              -- highlight URLs at start
    notifications = true,                             -- enable notifications at start
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- vim options can be configured here
  options = {
    opt = {                  -- vim.opt.<key>
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "yes",    -- sets vim.opt.signcolumn to yes
      wrap = false,          -- sets vim.opt.wrap
    },
    g = {                    -- vim.g.<key>
      -- configure global vim variables (vim.g)
      -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
      -- This can be found in the `lua/lazy_setup.lua` file
    },
  },
  -- Mappings can be configured through AstroCore as well.
  -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map

      -- navigate buffer tabs
      ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
      ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

      -- mappings seen under group name "Buffer"
      ["<Leader>bd"] = {
        function()
          require("astroui.status.heirline").buffer_picker(
            function(bufnr) require("astrocore.buffer").close(bufnr) end
          )
        end,
        desc = "Close buffer from tabline",
      },

      -- tables with just a `desc` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      -- ["<Leader>b"] = { desc = "Buffers" },

      -- setting a mapping to false will disable it
      -- ["<C-S>"] = false,
    },
  },
}

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon

    local maps = opts.mappings
    if maps ~= nil then
      -- comment
      maps.n["<leader>cc"] = maps.n["<Leader>/"] -- toggle comment line
      maps.n["<a-/>"] = maps.n["<Leader>/"]      -- toggle comment line
      maps.x["<Leader>cc"] = maps.x["<Leader>/"] -- toggle comment current line
      maps.x["<a-/>"] = maps.x["<Leader>/"]      -- toggle comment current line

      maps.n["<Leader>co"] = maps.n["gco"]       -- add comment below
      maps.n["<Leader>cO"] = maps.n["gcO"]       -- add comment above

      -- manage buffers
      maps.n["<Leader>c"] = nil
      maps.n["<Leader>C"] = nil
      maps.n["<tab>q"] = {
        function()
          local buf_list = vim.fn.getbufinfo({ buflisted = 1 })
          if #buf_list <= 1 then
            vim.cmd("quit")
          else
            require("astrocore.buffer").close()
          end
        end,
        desc = "Close buffer"
      }

      maps.n["<tab>i"] = maps.n["[b"]
      maps.n["<tab>o"] = maps.n["]b"]
      maps.n["<tab>I"] = maps.n["<b"]
      maps.n["<tab>O"] = maps.n[">b"]

      -- diagnostic
      if vim.fn.has "nvim-0.11" == 0 then
        maps.n["<S-F2>"] = maps.n["[d"] -- Previous err
        maps.n["<F2>"] = maps.n["]d"]   -- Next err
      end

      -- Custom menu for modification of the user experience
      maps.n["<space>t"] = { desc = get_icon("Toggle1", 1, true) .. "Toggle" }
      maps.n["<space>tA"] = maps.n["<Leader>uA"]   -- Toggle rooter autochdir
      maps.n["<space>tb"] = maps.n["<Leader>ub"]   -- Toggle background
      maps.n["<space>td"] = maps.n["<Leader>ud"]   -- Toggle diagnostics
      maps.n["<space>tg"] = maps.n["<Leader>ug"]   -- Toggle signcolumn
      maps.n["<space>t>"] = maps.n["<Leader>u>"]   -- Toggle foldcolumn
      maps.n["<space>ti"] = maps.n["<Leader>ui"]   -- Change indent setting
      maps.n["<space>tl"] = maps.n["<Leader>ul"]   -- Toggle statusline
      maps.n["<space>tn"] = maps.n["<Leader>un"]   -- Change line numbering
      maps.n["<space>tN"] = maps.n["<Leader>uN"]   -- Toggle Notifications
      maps.n["<space>tp"] = maps.n["<Leader>up"]   -- Toggle paste mode
      maps.n["<space>ts"] = maps.n["<Leader>us"]   -- Toggle spellcheck
      maps.n["<space>tS"] = maps.n["<Leader>uS"]   -- Toggle conceal
      maps.n["<space>tt"] = maps.n["<Leader>ut"]   -- Toggle tabline
      maps.n["<space>tu"] = maps.n["<Leader>uu"]   -- Toggle URL highlight
      maps.n["<space>tv"] = maps.n["<Leader>uv"]   -- Toggle virtual text
      if vim.fn.has "nvim-0.11" == 1 then
        maps.n["<space>tV"] = maps.n["<Leader>uV"] -- Toggle virtual lines
      end
      maps.n["<space>tw"] = maps.n["<Leader>uw"]   -- Toggle wrap
      maps.n["<space>ty"] = maps.n["<Leader>uy"]   --  Toggle syntax highlight
    end
  end
}
