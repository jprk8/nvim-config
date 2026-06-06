local opt = vim.opt

opt.termguicolors = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- undo
opt.undofile = true
opt.undolevels = 10000

-- ui
opt.updatetime = 200

-- lazyvim fillchars
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- spellchecker
opt.spelllang = "en_us"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
