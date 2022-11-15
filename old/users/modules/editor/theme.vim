let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
syntax enable

lua << EOF
  local catppuccin = require("catppuccin")

  catppuccin.setup {}
  vim.cmd[[colorscheme catppuccin]]

  require('lualine').setup {
    options = {
      theme = "catppuccin"
    }
  }
EOF

hi VirtualColumn guifg=#575268
