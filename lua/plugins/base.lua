return {
        -- add gruvbox
        { "ellisonleao/gruvbox.nvim" },
      
        -- Configure LazyVim to load gruvbox
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "gruvbox",
          },   
      },
      {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
          { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
          { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        },
        opts = {
          options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            diagnostics_indicator = function(_, _, diag)
              local icons = require("lazyvim.config").icons.diagnostics
              local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warn .. diag.warning or "")
              return vim.trim(ret)
            end,
            offsets = {
              {
                filetype = "neo-tree",
                text = "Neo-tree",
                highlight = "Directory",
                text_align = "left",
              },
            },
          },
        },
    },
      
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end
    },
    
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup {
                sort_by = "case_sensitive",
                  -- 是否显示 git 状态
                  git = {
                      enable = true,
                  },
                  -- 过滤文件
                  filters = {
                      dotfiles = true, -- 过滤 dotfile
                      custom = { "node_modules" }, -- 其他过滤目录
                  },
                view = {
                  -- 文件浏览器展示位置，左侧：left, 右侧：right
                  side = "left",
                  -- 行号是否显示
                  number = false,
                  relativenumber = false,
                  signcolumn = "yes", -- 显示图标
                  width = 30,
                },
                renderer = {
                  group_empty = true,
                },
              }

        end
    },
    {
        "folke/which-key.nvim",
        config = true,
    },
    {
        "echasnovski/mini.ai",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<leader>.',
                    ---Block-comment toggle keymap
                    block = 'gbc',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = '<leader>.',
                    ---Block-comment keymap
                    block = 'gb',
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = 'gcO',
                    ---Add comment on the line below
                    below = 'gco',
                    ---Add comment at the end of line
                    eol = 'gcA',
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
                ---Function to call before (un)comment
                pre_hook = nil,
                ---Function to call after (un)comment
                post_hook = nil,
            })
        end
    },

    {
      "xeluxee/competitest.nvim",
      ft = { "cpp" },
      dependencies = {
          "MunifTanjim/nui.nvim",
      },

      config = function()
          require('competitest').setup({
              -- runner_ui = {
              --     interface = "split",
              -- },
          })
          vim.keymap.set("n", "rr", "<cmd>CompetiTest run<CR>", { noremap = true })
          vim.keymap.set("n", "ra", "<cmd>CompetiTest add_testcase<CR>", { noremap = true })
          vim.keymap.set("n", "re", "<cmd>CompetiTest edit_testcase<CR>", { noremap = true })
          vim.keymap.set("n", "ri", "<cmd>CompetiTest receive testcases<CR>", { noremap = true })
          vim.keymap.set("n", "rd", "<cmd>CompetiTest delete_testcase<CR>", { noremap = true })
      end
  },
  
}