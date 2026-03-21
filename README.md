# Linfee AstroNvim Config

基于 AstroNvim v5 的个人配置，主配置目录使用 `~/.nvim.astro`，`~/.config/nvim/init.lua` 仅作为启动入口。

## 一键安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Linfee/astro-nvim-config/main/install.sh)
```

## 手动安装

```bash
git clone https://github.com/Linfee/astro-nvim-config.git ~/.nvim.astro
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.lua <<'EOF'
if vim.g.vscode then
  local home = "~/.nvim.vscode"
  vim.opt.rtp:prepend(home)
  -- require "setup"
else
  local home = "~/.nvim.astro"
  vim.opt.rtp:prepend(home)
  require("setup")
end
EOF
```

## 工作方式

- 启动时由 `~/.config/nvim/init.lua` 将运行时路径切换到 `~/.nvim.astro`。
- `lua/setup_pre.lua` 将 `stdpath("config"|"data"|"state")` 重定向到 `~/.nvim.astro` 下，数据与状态随仓库目录管理。
- `lua/setup.lua` 首次启动会自动拉取 `lazy.nvim`，再加载 AstroNvim、community 与自定义插件。

## 启动

```bash
nvim
```
