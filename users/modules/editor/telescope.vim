lua << EOF
local actions = require('telescope.actions')

require('telescope').setup {
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
EOF

noremap <Leader>fb <cmd>Telescope buffers<cr>
noremap <Leader>ff <cmd>Telescope find_files<cr>
noremap <Leader>fg <cmd>Telescope live_grep<cr>
noremap <Leader>fh <cmd>Telescope help_tags<cr>
noremap <Leader>fs <cmd>Telescope symbols<cr>
