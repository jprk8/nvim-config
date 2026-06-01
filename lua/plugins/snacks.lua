vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local plugins = #vim.pack.get()

require("snacks").setup({
  explorer = { enabled = true },
  picker = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 2 },
      {
        text = {
          { "󰏖  " .. plugins .. " total plugins\n\n", hl = "@parameter" },
          { "⚡ by vim.pack\n\n", hl = "Normal" },
          { "󰋑", hl = "Error" },
        },
        align = "center",
        padding = 1,
      },
    },
  },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  terminal = { enabled = true },
})

-- Disable mini.completion during explorer search/filter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_picker_input",
  callback = function()
    vim.b.minicompletion_disable = true
  end,
})
