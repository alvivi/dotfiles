-- Defines a read-write directory for treesitter in nvim's cache dir
local parser_install_dir = vim.fn.expand("$HOME/.nvim-treesitter")
vim.fn.mkdir(parser_install_dir, "p")

vim.opt.runtimepath:append(parser_install_dir)

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  ignore_install = {"phpdoc", "verilog"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
  parser_install_dir = parser_install_dir,
  refactor = {
    highlight_definitions = {
      clear_on_cursor_move = true,
      enable = true,
      highlight_current_scope = { enable = true },
    },
  }
}


