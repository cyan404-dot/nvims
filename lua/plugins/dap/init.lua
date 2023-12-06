local M = {}
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
local function configure()
end

local function configure_exts()
end

local function configure_debuggers()
end

function M.setup()
	configure() -- Configuration
	configure_exts() -- Extensions
	configure_debuggers() -- Debugger
    require("config.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

return M

--在 _dap.lua 中调用了 require("config.dap").setup()
--这个 setup 函数就是 config/dap/init.lua 中的 M.setup() 函数。
