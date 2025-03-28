local function noremap(modes, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
    desc = "map " .. lhs .. " -> " .. tostring(rhs),
  }
  if opts then
    for k, v in pairs(opts) do
      options[k] = v
    end
  end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, options)
  end
end

local function nnoremap(lhs, rhs, opts) noremap({ "n" }, lhs, rhs, opts) end

local function inoremap(lhs, rhs, opts) noremap({ "i" }, lhs, rhs, opts) end

local function cnoremap(lhs, rhs, opts) noremap({ "c" }, lhs, rhs, opts) end

local function vnoremap(lhs, rhs, opts) noremap({ "v" }, lhs, rhs, opts) end

local function tnoremap(lhs, rhs, opts) noremap({ "t" }, lhs, rhs, opts) end

local function onoremap(lhs, rhs, opts) noremap({ "o" }, lhs, rhs, opts) end

-- 保留s和S的原生用法
-- nnoremap("s", "s")
-- nnoremap("S", "S")
noremap({ "n", "x", "o" }, ",", function() require("flash").jump() end, { desc = "Flash" })
nnoremap("<a-;>", ";")

----------------------------------------
--- Basic
----------------------------------------

-- 使用jk退出插入模式
inoremap("jk", "<esc>", { desc = "use jk exit insert mode" })
cnoremap("jk", "<esc>", { desc = "use jk exit command mode" })

-- 高效移动
nnoremap("<up>", "10k")
nnoremap("<down>", "10j")
inoremap("<up>", "10k")
inoremap("<down>", "10j")
vnoremap("<up>", "10k")
vnoremap("<down>", "10j")
onoremap("<up>", "10k")
onoremap("<down>", "10j")

inoremap("<a-j>", "<down>")
inoremap("<a-k>", "<up>")
inoremap("<a-h>", "<left>")
inoremap("<a-l>", "<right>")
inoremap("<a-N>", "<s-left>")
inoremap("<a-m>", "<s-right>")
inoremap("<a-o>", "<end>")
inoremap("<a-I>", "<home>")

nnoremap("<a-j>", "10gj")
nnoremap("<a-k>", "10gk")
vnoremap("<a-j>", "10gj")
vnoremap("<a-k>", "10gk")

cnoremap("<a-j>", "<down>")
cnoremap("<a-k>", "<up>")
cnoremap("<a-h>", "<left>")
cnoremap("<a-l>", "<right>")
cnoremap("<a-m>", "<s-right>")
cnoremap("<a-N>", "<s-left>")
cnoremap("<a-o>", "<end>")
cnoremap("<a-I>", "<home>")

cnoremap("<a-p>", '<c-r>=substitute(@*."", "\\n", "", "g")<cr>')
cnoremap("<m-p>", '<c-r>=substitute(@*."", "\\n", "", "g")<cr>')

-- j/k可以移动到软换行上
nnoremap("j", "gj")
nnoremap("k", "gk")
nnoremap("gj", "j")
nnoremap("gk", "k")

-- H, L移动到行首行尾
nnoremap("H", "^")
nnoremap("L", "$")
vnoremap("H", "^")
vnoremap("L", "$")
onoremap("H", "^")
onoremap("L", "$")

-- 保存和退出
nnoremap("<space>q", ":close<cr>")
-- nnoremap("<space>w", ":update<cr>")
nnoremap("<space>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- 视觉模式下的缩进（不退出视觉模式）
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- vnoremap("<tab>", ">gv")
-- vnoremap("<s-tab>", "<gv")

-- Y 复制到行尾
nnoremap("Y", "y$", { desc = "Y 复制到行尾" })

vnoremap(".", ":normal! .<cr>", { desc = "允许使用 . 对选中的行执行上一个命令" })

-- nnoremap("Q", "gqap")
-- vnoremap("Q", "gq")

-- 重做
nnoremap("U", "<C-r>")

-- 定义跳转
nnoremap("<cr>", "<c-]>")
nnoremap("<bs>", "<c-o>")

-- 切换粘贴模式
nnoremap("<Leader>tp", ":setlocal paste!<CR>", { desc = "切换粘贴模式" })

-- 移动行
nnoremap("<c-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
nnoremap("<c-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
inoremap("<c-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
inoremap("<c-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vnoremap("<c-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vnoremap("<c-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- :W 使用 sudo 保存文件 （用于处理权限被拒绝的错误）
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", { desc = "使用sudo保存文件" })

-- 插入模式快捷键
inoremap("<C-h>", "<BS>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")
inoremap("<C-b>", "<Left>")
inoremap("<C-f>", "<Right>")

inoremap("<C-a>", "<Home>")
-- Bash 风格快捷键
inoremap("<C-e>", "<End>")
inoremap("<C-d>", "<Delete>")

-- 命令模式快捷键
vim.keymap.set("c", "<C-h>", "<BS>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-d>", "<Delete>")

-- 设置tab宽度
vim.api.nvim_create_user_command("TabSize", function(opts)
  -- 将参数转换为数字
  local n = tonumber(opts.args)
  -- 检查参数是否为有效数字
  if not n or n <= 0 then
    vim.notify("TabSize: require an integer", vim.log.levels.ERROR)
    return
  end
  -- 设置选项
  vim.opt_local.shiftwidth = n
  vim.opt_local.tabstop = n
  vim.opt_local.softtabstop = n
  vim.notify("set tab size to " .. n, vim.log.levels.INFO)
end, { nargs = 1, desc = "设置TabSize" })
vim.api.nvim_create_user_command("ToSpace", "setl et | ret", { desc = "tab转换为space" })
vim.api.nvim_create_user_command("ToTab", "setl noet | ret!", { desc = "space转换为tab" })

----------------------------------------
--- More
----------------------------------------

nnoremap("<Leader>mm", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

nnoremap("<space><space>", "V", { desc = "Enter v-mode" })
vnoremap("<space><space>", "V", { desc = "Exit v-mode" })

inoremap("<a-=>", "<c-r>=", { desc = "计算达式" })
cnoremap("<a-=>", "<c-r>=", { desc = "计算达式" })

inoremap("<a-p>", "<c-n>")

inoremap("<a-d>", "<c-w>", { desc = "Remove preview word" })
cnoremap("<a-d>", "<c-w>", { desc = "Remove preview word" })

-- Enter command mode
nnoremap("<a-s>", ":", { desc = "Enter command mode" })
inoremap("<a-s>", "<c-o>:", { desc = "Enter command mode" })
vnoremap("<a-s>", ":", { desc = "Enter command mode" })

nnoremap("<a-.>", "@@", { desc = 'Repeat last @{0-ia-z":*}' })

-- Fold
nnoremap("-", "za")
nnoremap("_", "zf")

nnoremap("<tab>0", ":set foldlevel=0<cr>")
nnoremap("<tab>1", ":set foldlevel=1<cr>")
nnoremap("<tab>2", ":set foldlevel=2<cr>")
nnoremap("<tab>3", ":set foldlevel=3<cr>")
nnoremap("<tab>4", ":set foldlevel=4<cr>")
nnoremap("<tab>5", ":set foldlevel=5<cr>")
nnoremap("<tab>6", ":set foldlevel=6<cr>")

nnoremap("<space><cr>", ":nohlsearch<CR>", { desc = "Disable search result highlight" })

-- buffer, window and tab
nnoremap("<tab><cr>", "<c-w>_")
nnoremap("<tab>=", "<c-w>=")
nnoremap("<tab>j", "<C-w>j")
nnoremap("<tab>k", "<C-w>k")
nnoremap("<tab>l", "<C-w>l")
nnoremap("<tab>h", "<C-w>h")

nnoremap("<tab><up>", "<C-w>-")
nnoremap("<tab><down>", "<C-w>+")
nnoremap("<tab><left>", "<C-w><")
nnoremap("<tab><right>", "<C-w>>")

-- nnoremap("<tab>i", ":bprevious<cr>")
-- nnoremap("<tab>o", ":bnext<cr>")
nnoremap("<tab>b", ':execute "ls"<cr>')
nnoremap("<tab>-", ":split<cr>")
nnoremap("<tab>\\", ":vsplit<cr>")

-- tab
nnoremap("<tab>[", ":tabprevious<cr>")
nnoremap("<tab>]", ":tabnext<cr>")
nnoremap("<tab>{", ":tabfirst<cr>")
nnoremap("<tab>}", ":tablast<cr>")
nnoremap("<tab>n", ":tabnew<cr>", { desc = "New Tab" })
nnoremap("<tab>N", ":enew<cr>", { desc = "New File" })
-- nnoremap("<tab>q", function()
--   Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })
-- nnoremap("<tab>q", ":q<cr>")

nnoremap("<tab>x", ":tabclose<cr>")
nnoremap("<tab>c", ":close<cr>")
nnoremap("<tab>s", ":tabs<cr>")
nnoremap("<tab>f", ":tabfind<space>")
nnoremap("<tab>m", ":tabmove<space>")
nnoremap("<tab>t", ":tabonly<cr>")

-- Horizontal scrolling
nnoremap("zl", "zL")
nnoremap("zh", "zH")

-- term
tnoremap("jk", "<C-\\><C-n>")

----------------------------------------
-- For Plugins
----------------------------------------

-- For: Neotree
nnoremap("<space>[", "<cmd>Neotree toggle<cr>")
nnoremap("<space>{", "<cmd>Neotree buffers toggle<cr>")
nnoremap("|", "<cmd>Neotree reveal<cr>")

nnoremap(
  "<a-1>",
  function() require("neo-tree.command").execute { toggle = true } end,
  { desc = "Explorer NeoTree (Root Dir)" }
)
