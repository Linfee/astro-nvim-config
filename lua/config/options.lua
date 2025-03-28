local o = vim.o
local opt = vim.opt
local g = vim.g

opt.sessionoptions:append("tabpages,globals") -- 保存标签页布局到会话

g.mapleader = ";"
g.maplocalleader = "\\"
-- LazyVim auto format
g.autoformat = true

----------------------------------------
--- Better Default
----------------------------------------

o.virtualedit = "onemore" -- 虚拟编辑意味着光标可以定位在没有实际字符的地方
o.number = true -- 显示绝对行号
o.relativenumber = true -- 显示相对行号

o.showmode = false -- 不显示模式，由插件显示模式

o.hidden = true -- 隐藏缓冲区而不是卸载缓冲区
o.backspace = "indent,eol,start" -- 删除在插入模式可以删除的特殊内容
o.laststatus = 2 -- 最后一个窗口总有状态行
o.wildmode = "list:longest,full" -- 设置命令行模式补全模式
o.foldcolumn = "2" -- 在左端添加额外折叠列
o.winminheight = 0 -- 窗口的最小高度
o.tabpagemax = 15 -- 最多打开的标签数目
o.scrolljump = 1 -- 光标离开屏幕时(比如j)，最小滚动的行数，这样看起来舒服
-- o.scrolljump = 5      -- 当光标离开屏幕时，滚动 5 行
o.scrolloff = 5 -- 光标上下保留的最小行数
o.linespace = 0 -- 设置行间距
o.whichwrap = "b,s,h,l,<,>,[,],<,>,h,l" -- 关于跨行移动
o.autoread = true -- 当文件被改变时自动载入
o.cursorline = true -- 高亮显示当前行
-- o.cursorcolumn = true             -- 高亮显示当前列
-- o.cmdheight = 2                   -- 命令行高度
o.fileformats = "unix" -- 文件类型(使用的结尾符号)
-- o = 200

o.fileencoding = "utf-8"
o.fileencodings = "ucs-bom,utf-8,default,gb18030,gbk,gb2312,cp936,latin1"

o.ignorecase = true -- 搜索时候忽略大小写
o.smartcase = true -- 智能匹配大小写
o.hlsearch = true -- 高亮显示搜索结果
o.incsearch = true -- 使用增量查找

o.list = true
o.magic = true

o.timeoutlen = 300

-- 命令行补全和忽略补全的文件类型
o.wildmenu = true
opt.wildignore = {
  "*.class",
  "*.gif",
  "*.jpg",
  "*.o",
  "*.obj",
  "*.png",
  "*.pyc",
  "*.so",
  "*.sw*",
  "*.zip",
  "*/.DS_Store",
  "*/.git/*",
  "*/.hg/*",
  "*/.svn/*",
  "*/tmp/*",
  "*swp",
  "*~",
  ".git*",
  ".hg*",
  ".svn*",
}

----------------------------------------
--- Behavior
----------------------------------------
o.report = 0 -- 始终报告更改的行数

opt.directory = "/tmp//,."
opt.backupdir = "/tmp//,."
opt.undodir = "/tmp//,."

-- enable backup
o.backup = true

-- 持久化撤销
o.undofile = true -- 持久化撤销
o.undolevels = 10000 -- 最大可撤销的更改次数
o.undoreload = 10000 -- 缓冲区重新加载时保存的最大行数

-- --------------------------------------
-- format
-- --------------------------------------
o.wrap = false -- 不要软换行
o.formatoptions = o.formatoptions:gsub("t", "") -- 输入的时候不要自动软换行
o.autoindent = true -- 自动缩进
o.expandtab = true -- 将制表符扩展为空格
o.smarttab = true -- 只能缩进
o.shiftwidth = 4 -- 格式化时制表符占几个空格位置
o.tabstop = 4 -- 编辑时制表符占几个空格位置
o.softtabstop = 4 -- 把连续的空格看做制表符
opt.matchpairs:append("<:>") -- 设置形成配对的字符
o.spell = false -- 默认不要开启拼写检查
o.foldenable = true -- 基于缩进或语法进行代码折叠
o.linebreak = true
o.textwidth = 500

o.showcmd = true -- 在状态栏显示部分命令和选中的字符/行
o.linespace = 0 -- 行之间没有额外的空格

-- --------------------------------------
o.splitright = true
o.splitbelow = true
o.ruler = true -- 显示标尺
o.pumheight = 20 -- 避免弹出菜单占据整个屏幕

-- 显示配对的括号，引号等，以及显示时光标的闪烁频率
o.showmatch = true
o.matchtime = 5 -- 显示匹配次数
opt.background = "dark" -- 假设背景为暗色
opt.fillchars = { stl = " ", stlnc = " ", fold = " ", vert = "│" }

o.colorcolumn = "80,120" -- 80列和120列参考线
vim.cmd("highlight ColorColumn ctermbg=233")
vim.opt.guicursor = "a:block-blinkon0" -- 让gui光标不要闪
vim.cmd("highlight clear SignColumn") -- 高亮列要匹配背景色
vim.cmd("highlight clear LineNr") -- 移除当前行号处的高亮色
vim.cmd("highlight clear CursorLineNr") -- 删掉当前行号上的高亮

-- 高亮某些特殊位置的特殊字符
opt.listchars = { tab = "→ ", eol = "↵", trail = "·", extends = "↷", precedes = "↶" }

-- 设置补全菜单样式
o.completeopt = "noinsert,menuone,noselect"
