require("mason").setup()
require("mason-lspconfig").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'eslint-lsp',
    'graphql-language-service-cli',
    'json-lsp',
    'lua-language-server',
    'prettierd',
    'rust-analyzer',
    'stylua',
    'typescript-language-server',
    'tailwindcss'
  },
  auto_update = true,
}
