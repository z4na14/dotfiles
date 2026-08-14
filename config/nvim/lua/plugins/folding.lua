return {
  "kevinhwang91/nvim-ufo",
  
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",

  init = function()
    vim.opt.foldcolumn = "1"
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true
  end,

  opts = {
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  },

  config = function(_, opts)
    require("ufo").setup(opts)

    vim.keymap.set('n', '<leader>za', 'za', { desc = 'Toggle fold under cursor' })
    vim.keymap.set('n', '<leader>zo', 'zo', { desc = 'Open fold under cursor' })
    vim.keymap.set('n', '<leader>zc', 'zc', { desc = 'Close fold under cursor' })
    vim.keymap.set('n', '<leader>zr', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', '<leader>zm', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', '<leader>zj', 'zj', { desc = 'Jump to next fold' })
    vim.keymap.set('n', '<leader>zk', 'zk', { desc = 'Jump to previous fold' })
    vim.keymap.set('n', '<leader>zp', function()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Peek folded lines under cursor' })
  end,

}
