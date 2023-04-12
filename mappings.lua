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
    ["<leader>bn"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    ["<leader>w"] = { "<cmd>w<cr>", desc = "Save" },
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
    ["f"] = "e",
    ["k"] = "f",
    ["l"] = "n",
    ["L"] = "N",
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
    ["<leader>wq"] = {
      "<cmd>close<cr>",
      desc = "Close window",
    },
    ["<c-n>"] = { "<cmd>wincmd h<cr>", desc = "Move to left split" },
    ["<c-e>"] = { "<cmd>wincmd j<cr>", desc = "Move to down split" },
    ["<c-i>"] = { "<cmd>wincmd k<cr>", desc = "Move to up split" },
    ["<c-o>"] = { "<cmd>wincmd l<cr>", desc = "Move to right split" },
    ["ga"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
    ["<leader>n"] = { "<c-o>", desc = "Jump back" },
    ["<leader>o"] = { "<c-i>", desc = "Jump forward" },
    ["<c-f>"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["<leader>e"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
    ["<leader>i"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<leader>fo"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>ff"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
    ["<leader>r"] = {
      function() vim.lsp.buf.rename() end,
      desc = "Rename current symbol",
    },
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
    ["f"] = "e",
    ["k"] = "f",
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
