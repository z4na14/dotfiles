-- Reads the matugen-generated palette (colorscheme.json) and returns it
-- as a Lua table, e.g. { surface = "#0e1416", primary = "#83d2e3", ... }
-- Returns nil if the file is missing or contains invalid JSON.
local function get_palette()
  local palette_path = vim.fn.expand("~/.config/nvim/colorscheme.json")

  local file_lines, read_err = vim.fn.readfile(palette_path)
  if not file_lines then
    vim.notify("matugen: could not read palette file: " .. palette_path, vim.log.levels.WARN)
    return nil
  end

  local raw_json = table.concat(file_lines, "\n")

  local decode_ok, palette_or_err = pcall(vim.fn.json_decode, raw_json)
  if not decode_ok then
    vim.notify("matugen: failed to parse palette JSON: " .. tostring(palette_or_err), vim.log.levels.WARN)
    return nil
  end

  return palette_or_err
end

local palette = get_palette() or {}

local function apply_float_highlights()
  local set = vim.api.nvim_set_hl
  local bg = palette.surface
  local fg = palette.on_surface
  local border = palette.outline

  set(0, "NormalFloat", { bg = bg, fg = fg })
  set(0, "FloatBorder", { bg = bg, fg = border })

  set(0, "WhichKeyFloat", { bg = bg })
  set(0, "WhichKeyBorder", { bg = bg, fg = border })

  set(0, "NeoTreeNormal", { bg = bg, fg = fg })
  set(0, "NeoTreeNormalNC", { bg = bg, fg = fg })

  -- Telescope: overall + per-section (prompt/results/preview each have their own bg)
  set(0, "TelescopeNormal", { bg = bg, fg = fg })
  set(0, "TelescopeBorder", { bg = bg, fg = border })

  set(0, "TelescopePromptNormal", { bg = bg, fg = fg })
  set(0, "TelescopePromptBorder", { bg = bg, fg = border })
  set(0, "TelescopePromptTitle", { bg = bg, fg = palette.primary })

  set(0, "TelescopeResultsNormal", { bg = bg, fg = fg })
  set(0, "TelescopeResultsBorder", { bg = bg, fg = border })
  set(0, "TelescopeResultsTitle", { bg = bg, fg = palette.primary })

  set(0, "TelescopePreviewNormal", { bg = bg, fg = fg })
  set(0, "TelescopePreviewBorder", { bg = bg, fg = border })
  set(0, "TelescopePreviewTitle", { bg = bg, fg = palette.primary })

  set(0, "NoicePopup", { bg = bg })
  set(0, "NoicePopupBorder", { bg = bg, fg = border })
  set(0, "NoiceCmdlinePopup", { bg = bg })
  set(0, "NoiceCmdlinePopupBorder", { bg = bg, fg = border })
  set(0, "NoiceCmdlinePopupBorderSearch", { bg = bg, fg = border })
  set(0, "NoiceCmdlineIcon", { bg = bg, fg = fg })
  set(0, "NoiceCmdlineIconSearch", { bg = bg, fg = fg })

  set(0, "Cursor", { bg = palette.primary, fg = palette.on_primary })
end

apply_float_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_float_highlights,
})

-- #######################################################################################################

return {

  -- Tab for open files
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
        error_visible            = { bg = palette.surface_low },
      },
    },
  },


  -- File fuzzy finder
  {
    'nvim-telescope/telescope.nvim', version = '*',

    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
      { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Telescope buffers' },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
    },
  },


  -- Lower bar 
  {
    "nvim-lualine/lualine.nvim",
     opts = {
       sections = {
         lualine_z = {},
       },
       extensions = { "neo-tree" },
     },
  },


  -- Git integration
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


  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },

    lazy = false, -- neo-tree will lazily load itself
    cmd = "Neotree",

    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer (Neo-tree)" },
    },

    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },

    window = {
      width = 30,
      mappings = {
        ["<CR>"] = "open",
      }
    },
  },


  -- Binding looker
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },


  -- CMDLine replacement
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    }
  }

}
