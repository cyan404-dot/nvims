local M = {}


local whichkey = require "which-key"

function M.setup()
  -- 定义主要的快捷键映射
  local keymap = {
    d = {
      name = "DAP", -- DAP 相关的命令组
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "运行到光标处" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "计算输入表达式" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "设置条件断点" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "切换调试界面" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "步骤后退" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "继续运行程序" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "断开连接" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "计算表达式" },
      g = { "<cmd>lua require'dap'.session()<cr>", "获取会话" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "浮动显示变量" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "调试范围" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "步进到函数内部" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "跳过当前行" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "暂停程序运行" },
      q = { "<cmd>lua require'dap'.close()<cr>", "退出" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "切换 REPL 界面" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "开始调试" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "切换断点" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "结束调试" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "从函数内部跳出" },
    },
  }
  -- 设置快捷键的选项
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
  -- 注册快捷键
  whichkey.register(keymap, opts)

  -- 定义可视模式下的快捷键映射
  local keymap_v = {
    d = {
      name = "Debug", -- 调试相关的命令组
      e = { "<cmd>lua require'dapui'.eval()<cr>", "计算表达式" },
    },
  }
  -- 设置可视模式下快捷键的选项
  opts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
  -- 注册可视模式下的快捷键
  whichkey.register(keymap_v, opts)
end

return M
