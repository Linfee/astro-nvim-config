return {
  "Saghen/blink.cmp",
  -- event = { "InsertEnter", "CmdlineEnter" },
  -- opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
  opts = function(plugin, opts)
    local extend_tbl = require("astrocore").extend_tbl

    local keymap = {
      ["<a-p>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-N>"] = { "select_next", "show" },
      ["<C-P>"] = { "select_prev", "show" },
      ["<C-J>"] = { "select_next", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback" },
      ["<C-U>"] = { "scroll_documentation_up", "fallback" },
      ["<C-D>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    }
    opts.keymap = extend_tbl(opts.keymap, keymap)

    -- local completion = {
    --   list = { selection = { preselect = true, auto_insert = true } },
    -- }
    opts.completion['menu']['draw']['columns'] = {
      { "kind_icon", gap = 1 },
      { "label",     "label_description", "source_id", gap = 1 },
      { "kind" }
    }
    opts.completion['documentation'] = {
      auto_show = true,
      auto_show_delay_ms = 300,
    }
  end
}
