local opt = vim.opt

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
