-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    ["j"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    }, 
    ["n"] = "h",
    ["e"] = "j",
    ["i"] = "k",
    ["o"] = "l",
    ["s"] = "i",
    ["t"] = "o",
    ["h"] = { 
      function()
        require("leap").leap { offset = 1 }
      end,
      desc = "Leap forward"
    },
    ["H"] = { 
      function()
        require("leap").leap { offset = 1, backward = true }
      end,
      desc = "Leap forward"
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>wh"] = {
      "<cmd>split<cr>",
      desc = "Horizontal split buffer from tabline",
    },
    ["<leader>wv"] = {
      "<cmd>vsplit<cr>",
      desc = "Vertical split buffer from tabline",
    },
    ["<leader>wn"] = { "<cmd>wincmd h<cr>", desc = "Move to left split" },
    ["<leader>we"] = { "<cmd>wincmd j<cr>", desc = "Move to down split" },
    ["<leader>wi"] = { "<cmd>wincmd k<cr>", desc = "Move to up split" },
    ["<leader>wo"] = { "<cmd>wincmd l<cr>", desc = "Move to right split" },
    ["ga"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    }
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["n"] = "h",
    ["e"] = "j",
    ["i"] = "k",
    ["o"] = "l",
    ["h"] = { 
      function()
        require("leap").leap { offset = 1 }
      end,
      desc = "Leap forward"
    },
    ["H"] = { 
      function()
        require("leap").leap { offset = 1, backward = true }
      end,
      desc = "Leap forward"
    },
  }
}
