return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  ["mason-lspconfig"] = {
      ensure_installed = { "dartls" }, -- install dartls
  },
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').opts.safe_labels = { 'h', 'a', 'f', 'l', 'g', 'u', 't', 'k', 'z', }
      require('leap').opts.labels = { 'h', 'a', 'f', 'l', 'g', 'u', 't', 'k', 'z' }
    end,
  },
  {
    "kwkarlwang/bufjump.nvim",
      config = function()
        require("bufjump").setup({
            forward = "<leader>o",
            backward = "<leader>n",
            on_success = nil
        })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  'folke/tokyonight.nvim',
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    after = "mason-lspconfig.nvim",
    config = function() require("flutter-tools").setup {
      lsp = require('astronvim.utils.lsp').config("dartls"),
    } end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = function()
      local global_commands = {
        system_open = function(state) require("astronvim.utils").system_open(state.tree:get_node():get_id()) end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
      }
      local get_icon = require("astronvim.utils").get_icon
      return {
        close_if_last_window = true,
        source_selector = {
          winbar = true,
          content_layout = "center",
          tab_labels = {
            filesystem = get_icon "FolderClosed" .. " File",
            buffers = get_icon "DefaultFile" .. " Bufs",
            git_status = get_icon "Git" .. " Git",
            diagnostics = get_icon "Diagnostic" .. " Diagnostic",
          },
        },
        default_component_configs = {
          indent = { padding = 0 },
          icon = {
            folder_closed = get_icon "FolderClosed",
            folder_open = get_icon "FolderOpen",
            folder_empty = get_icon "FolderEmpty",
            default = get_icon "DefaultFile",
          },
          modified = { symbol = get_icon "FileModified" },
          git_status = {
            symbols = {
              added = get_icon "GitAdd",
              deleted = get_icon "GitDelete",
              modified = get_icon "GitChange",
              renamed = get_icon "GitRenamed",
              untracked = get_icon "GitUntracked",
              ignored = get_icon "GitIgnored",
              unstaged = get_icon "GitUnstaged",
              staged = get_icon "GitStaged",
              conflict = get_icon "GitConflict",
            },
          },
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = false, -- disable space until we figure out which-key disabling
            ["[b"] = "prev_source",
            ["]b"] = "next_source",
            ["n"] = "parent_or_close",
            ["e"] = "select_down_node",
            -- i = "select_up_node",
            o = "open",
            O = "system_open",
            l = "child_or_open",
          },
        },
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          commands = global_commands,
        },
        buffers = { commands = global_commands },
        git_status = { commands = global_commands },
        event_handlers = {
          { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
        },
      }
    end
  }
}
