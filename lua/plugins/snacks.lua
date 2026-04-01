return {
  "folke/snacks.nvim",
  opts = function(plugin, opts)
    local get_icon = require("astroui").get_icon
    local dashboard = opts.dashboard

    -- 临时禁用 indent scope 以解决 Neovim 0.12 treesitter API 兼容性问题
    opts.indent = opts.indent or {}
    opts.indent.scope = { enabled = false }

    dashboard['preset']['keys'] = {
      { key = "n", action = "<Leader>n",  icon = get_icon("FileNew", 0, true),     desc = "New File  " },
      { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true),      desc = "Find File  " },
      { key = "r", action = "<space>fr",  icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
      { key = "a", action = "<Leader>fw", icon = get_icon("WordFile", 0, true),    desc = "Find Word  " },
      { key = "b", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true),   desc = "Bookmarks  " },
      { key = "s", action = "<Leader>Sl", icon = get_icon("Refresh", 0, true),     desc = "Last Session  " },
    }



    dashboard['preset']['header'] = table.concat({
      " █████  ███████ ████████ ██████   ██████ ",
      "██   ██ ██         ██    ██   ██ ██    ██",
      "███████ ███████    ██    ██████  ██    ██",
      "██   ██      ██    ██    ██   ██ ██    ██",
      "██   ██ ███████    ██    ██   ██  ██████ ",
      "",
      "███    ██ ██    ██ ██ ███    ███",
      "████   ██ ██    ██ ██ ████  ████",
      "██ ██  ██ ██    ██ ██ ██ ████ ██",
      "██  ██ ██  ██  ██  ██ ██  ██  ██",
      "██   ████   ████   ██ ██      ██",
    }, "\n")
  end,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(plugin, opts)
        local get_icon = require("astroui").get_icon

        local maps = opts.mappings
        maps.n['<space>h'] = maps.n["<Leader>h"]

        maps.n['<space>o'] = maps.n['<Leader>ff']  -- find file(quick open)
        maps.n['<space>ff'] = maps.n['<Leader>ff'] -- find file
        maps.n['<space>fF'] = maps.n['<Leader>fF'] -- find all file
        maps.n['<space>fl'] = maps.n['<Leader>fl'] -- find line in current file
        maps.n['<space>fc'] = maps.n['<Leader>fa'] -- find astro config files
        maps.n['<space>fb'] = maps.n['<Leader>fb'] -- find buffer
        maps.n['<space>fC'] = maps.n['<Leader>fC'] -- find commands
        maps.n['<space>fw'] = maps.n['<Leader>fc'] -- find worl under cursor
        maps.n['<space>fR'] = maps.n['<Leader>fr'] -- find registers
        maps.n['<space>fs'] = maps.n['<Leader>fs'] -- find buffers/recent/files
        maps.n['<space>fr'] = maps.n['<Leader>fo'] -- find recent
        maps.n['<space>fo'] = maps.n['<Leader>fo'] -- find recent
        maps.n['<space>fO'] = maps.n['<Leader>fO'] -- find recent under cwd
        maps.n['<space>ft'] = maps.n['<Leader>ft'] -- find theme
        maps.n['<space>fa'] = maps.n['<Leader>fw'] -- find words(anything)
        maps.n['<space>fw'] = maps.n['<Leader>fw'] -- find words
        maps.n['<space>fW'] = maps.n['<Leader>fW'] -- find words in all file

        maps.n['<space>fs'] = maps.n['<Leader>ls'] -- find symbols
        maps.n['<space>fe'] = maps.n['<Leader>lD'] -- find lint err and warn

        maps.n['<space>f'] = {
          function() require("snacks").picker.marks() end,
          desc = get_icon("Search", 1, true) .. "Find"
        }
      end,
    }
  }
}
