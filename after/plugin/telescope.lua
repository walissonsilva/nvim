local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', bufopts)

local actions = require("telescope.actions")

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next,     -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = { "node_modules", "yarn.lock", ".git" },
    dynamic_preview_title = true,
    path_display = { 'smart' },
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
}
