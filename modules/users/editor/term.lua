local termGroup = vim.api.nvim_create_augroup("Terminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = termgroup,
  callback = function()
    vim.cmd("setlocal nospell")
    vim.cmd("setlocal nonumber")
    vim.cmd("setlocal scrollback=1000")
    vim.cmd("setlocal signcolumn=no")
  end
})

-- https://github.com/neovim/neovim/issues/11072

vim.api.nvim_create_autocmd("TermEnter", {
  group = termgroup,
  command = "setlocal scrolloff=0"
})

vim.api.nvim_create_autocmd("TermLeave", {
  group = termgroup,
  command = "setlocal scrolloff=10"
})

vim.keymap.set("n", "<leader>zz", ":terminal<CR>")
vim.keymap.set("n", "<leader>zh", ":new<CR>:terminal<CR>")
vim.keymap.set("n", "<leader>zv", ":vnew<CR>:terminal<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-v><Esc>", "<Esc>")

vim.cmd("highlight! link TermCursor Cursor")
vim.cmd("highlight! TermCursorNC guibg=teal guifg=white ctermbg=1 ctermfg=15")

