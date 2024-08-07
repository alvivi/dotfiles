local catppuccin = require("catppuccin")

catppuccin.setup({})
vim.cmd.colorscheme("catppuccin")

require('lualine').setup {
  options = {
    theme = "catppuccin"
  }
}

vim.cmd("hi VirtualColumn guifg=#575268")
