return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
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
}
