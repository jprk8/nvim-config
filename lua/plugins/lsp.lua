local lsp_servers = {
  lua_ls = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("lua", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },

  yamlls = {},
  bashls = {},
  dockerls = {},
  jsonls = {},
  html = {},
  cssls = {},
  pyright = {},
  ts_ls = {},
}

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
}, { confirm = false })

require("mason").setup()

require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
  ensure_installed = vim.tbl_keys(lsp_servers),
})

for server, config in pairs(lsp_servers) do
  vim.lsp.config(server, {
    settings = config,

    on_attach = function(_, bufnr)
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end,
  })
end

vim.lsp.enable(vim.tbl_keys(lsp_servers))
