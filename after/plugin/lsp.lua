local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.setup()

local on_attach = function()
  local Format = vim.api.nvim_create_augroup("Format", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = Format,
    callback = function()
      local ts = require("typescript").actions
      ts.addMissingImports({ sync = true })
      ts.organizeImports({ sync = true })
      ts.removeUnused({ sync = true })
      vim.lsp.buf.format()
    end,
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
  on_attach = function()
    on_attach()
  end,
}

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(lsp_config)
  end,
  lua_ls = function()
    require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }))
  end,
  tsserver = function()
    require("typescript").setup({
      server = vim.tbl_extend("force", lsp_config, {
        on_attach = function()
          on_attach()
        end,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "project=relative",
            jsxAttributeCompletionStyle = "none",
          },
        },
      }),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
