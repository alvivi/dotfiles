local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["q"] = actions.close,
      }
    }
  }
}

vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<Leader>fs", "<cmd>Telescope symbols<cr>")
