vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim"
})

local icons = {
  Error = " ",
  Warn = " ",
}

local bufferline = require("bufferline")

bufferline.setup({
  highlights = {
    fill = { bg = "NONE" },
    background = { bg = "NONE" },
    tab = { bg = "NONE" },
    tab_selected = { bg = "NONE" },
    tab_separator = { bg = "NONE" },
    tab_separator_selected = { bg = "NONE" },
    buffer_selected = { bg = "NONE" },
    buffer_visible = { bg = "NONE" },
    tab_close = { bg = "NONE" },
    close_button = { bg = "NONE" },
    close_button_visible = { bg = "NONE" },
    close_button_selected = { bg = "NONE" },
    separator = { bg = "NONE" },
    separator_visible = { bg = "NONE" },
    separator_selected = { bg = "NONE" },

    diagnostic = { bg = "NONE" },
    diagnostic_visible = { bg = "NONE" },
    diagnostic_selected = { bg = "NONE" },
    error = { bg = "NONE" },
    error_visible = { bg = "NONE" },
    error_selected = { bg = "NONE" },
    error_diagnostic = { bg = "NONE" },
    error_diagnostic_visible = { bg = "NONE" },
    error_diagnostic_selected = { bg = "NONE" },
    warning = { bg = "NONE" },
    warning_visible = { bg = "NONE" },
    warning_selected = { bg = "NONE" },
    warning_diagnostic = { bg = "NONE" },
    warning_diagnostic_visible = { bg = "NONE" },
    warning_diagnostic_selected = { bg = "NONE" },

    offset_separator = { fg = "#6e6a86", bg = "NONE" },
  },

  options = {
    -- use Snacks for safe buffer deletion
    close_command = function(n)
      Snacks.bufdelete(n)
    end,

    right_mouse_command = function(n)
      Snacks.bufdelete(n)
    end,

    diagnostics = "nvim_lsp",
    always_show_bufferline = false,

    diagnostics_indicator = function(_, _, diag)
      local ret = (diag.error and icons.Error .. diag.error .. " " or "")
      .. (diag.warning and icons.Warn .. diag.warning or "")
      return vim.trim(ret)
    end,

    separator_style = { "", "" },

    offsets = {
      {
        filetype = "snacks_layout_box",
        separator = true,
      },
    },
  },
})
