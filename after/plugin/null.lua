local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint.with({
      condition = function(utils)
        return utils.has_file({ "package.json" })
      end,
    }),
    null_ls.builtins.completion.spell,
  },
})
