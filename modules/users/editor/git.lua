
--
-- Vim as Git tool
--

vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"gitcommit", "gitrebase" , "gitconfig"},
  command = "set bufhidden=delete"
})

--
-- GitSigns
--

require('gitsigns').setup()

-- Fugitive
--

vim.keymap.set("n", "<leader>gs", ":Gstatus<CR>")

