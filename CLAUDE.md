# CLAUDE.md

本文件用于指导 Claude Code（claude.ai/code）在本仓库中的工作方式。

## 适用范围

- 本仓库是 AstroNvim v5 的 Lua 配置（不是应用/服务代码库）。
- `data/` 与 `state/` 视为运行时缓存/第三方数据目录；除非有明确要求，不在这些目录做功能性改动。

## 常用命令

- 启动 Neovim：`nvim`
- 一键安装（远程脚本）：`bash <(curl -fsSL https://raw.githubusercontent.com/Linfee/astro-nvim-config/main/install.sh)`
- 本地安装脚本：`bash install.sh`

## 风格与检查

- Lua 格式化遵循 `.stylua.toml`。
- Lua 静态检查遵循 `selene.toml`。

## Git 约定

- 提交信息使用 Conventional Commits 前缀（如 `feat`、`fix`、`chore`）。
- 提交信息正文使用简洁中文自然语句，重点说明“为什么改”。

## 安全要求

- 严禁提交真实密钥/令牌/凭据。
- 一旦怀疑凭据泄露，先停止相关操作并完成凭据轮换，再继续工作。
