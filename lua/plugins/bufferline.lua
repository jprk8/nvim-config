vim.pack.add({
    "https://github.com/akinsho/bufferline.nvim"
})

local icons = {
  Error = " ",
  Warn = " ",
}

require("bufferline").setup({
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

    -- remove neo-tree, keep snacks explorer
    offsets = {
      {
        filetype = "snacks_layout_box",
        text = "Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})
