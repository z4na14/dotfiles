vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.bo.expandtab = true    -- Force tabs to become spaces
    vim.bo.shiftwidth = 4      -- Indent by 4 spaces
    vim.bo.tabstop = 4         -- Render tabs as 4 spaces
    vim.bo.softtabstop = 4     -- Tab key inserts 4 spaces
  end,
})

