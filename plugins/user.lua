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
      require('leap').opts.safe_labels = { 'h', 'f', 'l', 'u', 't' }
      require('leap').opts.labels = { 'h', 'f', 'l', 'u', 't' }
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
}
