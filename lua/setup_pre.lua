local g = vim.g

local function patch_func(orig, override)
  if not orig then orig = function() end end
  return function(...) return override(orig, ...) end
end

g.user_home = vim.env.HOME or vim.fn.expand "~"
g.config_home = g.user_home .. "/.nvim.astro"

vim.fn.stdpath = patch_func(vim.fn.stdpath, function(orig, what)
  if what == "config" then
    return g.config_home
  elseif what == "data" then
    return g.config_home .. "/data"
  elseif what == "state" then
    return g.config_home .. "/state"
  else
    return orig(what)
  end
end)
