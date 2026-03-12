return {
  -- 替换/交换操作符
  "gbprod/substitute.nvim",
  config = function()
    -- 初始化
    require("substitute").setup({})

    -- 快捷引用
    local substitute = require "substitute"
    local exchange = require "substitute.exchange"
    local map = vim.keymap.set
    local opts_common = { noremap = true, silent = true }

    -- ========== 推荐映射（不覆盖原生 s/S） ==========
    -- 普通模式 operator / 行 / 到行尾
    -- operator: <leader>ss + motion
    map("n", "<leader>ss", substitute.operator, vim.tbl_extend("force", opts_common, { desc = "Substitute operator" }))
    -- 整行替换
    map("n", "<leader>sS", substitute.line, vim.tbl_extend("force", opts_common, { desc = "Substitute line" }))
    -- 替换到行尾
    map("n", "<leader>se", substitute.eol, vim.tbl_extend("force", opts_common, { desc = "Substitute to EOL" }))
    -- 可视模式替换
    map("x", "<leader>ss", substitute.visual, vim.tbl_extend("force", opts_common, { desc = "Substitute visual" }))

    -- 交换（exchange）使用 <leader>sx 开头
    map("n", "<leader>sx", exchange.operator, vim.tbl_extend("force", opts_common, { desc = "Exchange operator" }))
    map("n", "<leader>sxl", exchange.line, vim.tbl_extend("force", opts_common, { desc = "Exchange line" }))
    map("x", "<leader>sX", exchange.visual, vim.tbl_extend("force", opts_common, { desc = "Exchange visual" }))
    map("n", "<leader>sxc", exchange.cancel, vim.tbl_extend("force", opts_common, { desc = "Exchange cancel" }))

    -- ========== 备选映射（如果你想覆盖 s） ==========
    -- 使用原生风格映射（取消注释并按需使用）
    -- map("n", "s", substitute.operator, { desc = "Substitute operator", noremap = true, silent = true })
    -- map("n", "ss", substitute.line, { desc = "Substitute line", noremap = true, silent = true })
    -- map("n", "S", substitute.eol, { desc = "Substitute to EOL", noremap = true, silent = true })
    -- map("x", "s", substitute.visual, { desc = "Substitute visual", noremap = true, silent = true })
    -- map("n", "sx", exchange.operator, { desc = "Exchange operator", noremap = true, silent = true })
    -- map("n", "sxx", exchange.line, { desc = "Exchange line", noremap = true, silent = true })
    -- map("x", "X", exchange.visual, { desc = "Exchange visual", noremap = true, silent = true })
    -- map("n", "sxc", exchange.cancel, { desc = "Exchange cancel", noremap = true, silent = true })

    -- ========== 示例：带 modifiers 的替换（可选） ==========
    -- 这个示例演示如何在调用 operator 时传入 modifiers（如 trim/reindent）
    map("n", "<leader>sr", function()
      substitute.operator { modifiers = { "trim", "reindent" } }
    end, vim.tbl_extend("force", opts_common, { desc = "Substitute with trim+reindent" }))

    -- ========== which-key 支持（如果你使用 which-key） ==========
    -- 下面这段是可选的，放在你的 which-key 注册处会更友好
    -- require("which-key").register({
    --   s = {
    --     name = "Substitute",
    --     s = "Operator",
    --     S = "Line",
    --     e = "To EOL",
    --     x = "Exchange",
    --     r = "Operator trim+reindent",
    --   },
    -- }, { prefix = "<leader>" })
  end,
}
