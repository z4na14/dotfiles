local function get_palette()
  local path = vim.fn.expand("~/.config/nvim/colorscheme.json")
  local ok, content = pcall(vim.fn.readfile, path)
  if not ok then return nil end
  local ok2, decoded = pcall(vim.fn.json_decode, table.concat(content, "\n"))
  if not ok2 then return nil end
  return decoded
end

local palette = get_palette() or {}

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      tab_size = 18,
      padding = 2,
      color_icons = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
    highlights = {
      fill = { bg = palette.surface },
      background = { bg = palette.surface_low, fg = palette.on_surface_variant },

      buffer_visible = { bg = palette.surface_low, fg = palette.on_surface_variant },
      buffer_selected = {
        bg = palette.surface_high,
        fg = palette.on_surface,
        bold = true,
      },

      -- these are what actually control the icon patch
      -- omit fg here so each filetype's own icon color is kept,
      -- only bg is forced to match the tab
      diagnostic_selected      = { bg = palette.surface_high },
      diagnostic_visible       = { bg = palette.surface_low },
      hint_selected            = { bg = palette.surface_high },
      hint_visible             = { bg = palette.surface_low },
      info_selected            = { bg = palette.surface_high },
      info_visible             = { bg = palette.surface_low },
      warning_selected         = { bg = palette.surface_high },
      warning_visible          = { bg = palette.surface_low },
      error_selected           = { bg = palette.surface_high },
      error_visible             = { bg = palette.surface_low },
    },
  },
  }
}
