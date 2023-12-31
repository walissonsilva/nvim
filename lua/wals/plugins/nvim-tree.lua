return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set("n", "<c-e>", "<cmd>NvimTreeToggle<cr>")
    local nvimtree = require("nvim-tree")
    nvimtree.setup({
      sort_by = "case_sensitive",
      actions = {
        open_file = { quit_on_open = true },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        adaptive_size = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = true,
        custom = { "^.git$" },
      },
      git = {
        enable = true,
      },
      log = {
        enable = true,
        types = {
          diagnostics = true,
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set(
          "n",
          "<c-e>",
          "<cmd>NvimTreeToggle<cr>",
          { desc = "toggle", buffer = bufnr, noremap = true, silent = true, nowait = true }
        )
      end,
    })

    vim.keymap.set("n", "<c-e>", "<cmd>NvimTreeToggle<cr>")
  end,
}
