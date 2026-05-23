---@type LazySpec
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- 设为 false 以获取最新提交，或指定版本如 "v0.0.*"
  opts = {
    provider = "gpt-5.5",
    providers = {
      --- 智谱 AI GLM 系列
      ["glm-5.1"] = {
        __inherited_from = "openai",
        endpoint = "https://open.bigmodel.cn/api/coding/paas/v4",
        model = "glm-5.1",
        api_key_name = "ZHIPU_CODE_API_KEY",
        extra_request_body = {
          thinking = {
            type = "enabled",
          },
        },
      },
      --- 本地 OpenAI 兼容服务
      ["gpt-5.5"] = {
        __inherited_from = "openai",
        endpoint = "http://localhost:8317/v1",
        model = "gpt-5.4",
        api_key_name = "PROXY_OPENAI_API_KEY",
        extra_request_body = {
          reasoning = {
            effort = "medium",
          },
        },
      },
      ["gpt-5.5-high"] = {
        __inherited_from = "openai",
        endpoint = "http://localhost:8317/v1",
        model = "gpt-5.4",
        api_key_name = "PROXY_OPENAI_API_KEY",
        extra_request_body = {
          reasoning = {
            effort = "high",
          },
        },
      },
      ["gpt-5.4"] = {
        __inherited_from = "openai",
        endpoint = "http://localhost:8317/v1",
        model = "gpt-5.4",
        api_key_name = "PROXY_OPENAI_API_KEY",
        extra_request_body = {
          reasoning = {
            effort = "medium",
          },
        },
      },
      ["gpt-5.4-high"] = {
        __inherited_from = "openai",
        endpoint = "http://localhost:8317/v1",
        model = "gpt-5.4",
        api_key_name = "PROXY_OPENAI_API_KEY",
        extra_request_body = {
          reasoning = {
            effort = "high",
          },
        },
      },
    },
    --- 其他 avante 配置
    behaviour = {
      auto_suggestions = false, -- 禁用自动建议，按需手动触发
      auto_set_keymaps = true, -- 自动设置快捷键
      support_paste_from_clipboard = true, -- 支持从剪贴板粘贴
    },
    mappings = {
      --- 快捷键配置
      ask = "<leader>aa", -- 打开 AI 询问窗口
      edit = "<leader>ae", -- 编辑选中文本
      refresh = "<leader>ar", -- 刷新
      --- 其他快捷键使用默认配置
    },
    hints = { enabled = true },
    windows = {
      --- 打开窗口的设置
      wrap = true, -- 自动换行
      width = 30, -- 侧边栏宽度
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    highlights = {
      --- 高亮设置
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- 代码差异显示
    diff = {
      autojump = true,
      --- 其他 diff 设置
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- 可选依赖
    "echasnovski/mini.pick", -- 用于文件选择器
    "nvim-telescope/telescope.nvim", -- 用于文件选择器
    "hrsh7th/nvim-cmp", -- 用于补全
    "zbirenbaum/copilot.lua", -- 可选的 Copilot 支持
  },
}
