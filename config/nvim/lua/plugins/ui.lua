return {
  {
    "nvim-lualine/lualine.nvim",
     opts = {
       sections = {
         lualine_z = {},
       },
     },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        -- Preview diff (floating window / inline)
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = buffer, desc = "Preview Hunk Diff" })
        vim.keymap.set("n", "<leader>gi", gs.preview_hunk_inline, { buffer = buffer, desc = "Toggle Inline Hunk Diff" })

        -- Restore / Revert hunk under cursor
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = buffer, desc = "Reset/Restore Hunk" })

        -- Restore selected visual lines
        vim.keymap.set("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { buffer = buffer, desc = "Reset/Restore Selected Lines" })
      end,
    },
  },
}

