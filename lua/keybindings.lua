-- 设置主键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }



-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)


-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("i", "<C-q>", "<Esc>", opt)
map("n", "W", ":w<CR>", opt)
map("n", "Q", ":q<CR>", opt)

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭

-- 复制
map("n", "ca", ":! xclip -sel c %<CR><CR>:lua vim.notify(\" Copied!\")<CR>", opt)
map("n", "<C-a>", "ggVG", opt)
map("n", "<C-c>", "y", opt)



