local map = vim.keymap.set
local fzf = require("fzf-lua")

-- local wk = require("which-key")
-- wk.add({
--   { "<leader>f", group = "Find" },
--   { "<leader>b", group = "Buffers" },
--   { "<leader>g", group = "Git" },
--   { "<leader>c", group = "Code" },
--   { "<leader>q", group = "Quit" },
-- })

-- Explorer
-- map("n", "<leader>e", function() vim.cmd("Ex") end, { desc = "netrw" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "Explorer" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bi", function()
  Snacks.bufdelete.invisible()
end, { desc = "Delete Invisible Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- fzf-lua
map("n", "<leader>ff", fzf.files, { desc = "Find files" })
map("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- search
map({ "i", "n", "s" }, "<Esc>", function()
  vim.cmd("noh")
  return "<Esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- terminal
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>ft", function()
  Snacks.terminal(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
end, { desc = "Terminal (Root Dir)" })
map({ "n", "t" }, "<C-/>", function()
  Snacks.terminal.focus(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
end, { desc = "Terminal (Root Dir)" })
map({ "n", "t" }, "<C-_>", function()
  Snacks.terminal.focus(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
end, { desc = "which_key_ignore" })

-- scratch
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
map("n", "<leader>dps", function() Snacks.profiler.scratch() end, { desc = "Profiler Scratch Buffer" })

map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to Left Window" })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to Lower Window" })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to Upper Window" })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to Right Window" })
