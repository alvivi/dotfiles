
--
-- NeoVim Remote
--

vim.fn.setenv("VISUAL", "nvr -cc split --remote-wait") 

--
-- Leader
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--
-- Netrw
--

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- FIX: vim.cmd([[ let s:treedepthstring= "|> "]])

--
-- Startify
--

vim.g.startify_custom_header = {}

vim.api.nvim_create_autocmd("User", {
  pattern = "Startified",
  command = "setlocal buftype=nofile"
})

--
-- Easy Motion
--

vim.g.EasyMotion_use_smartsign_us = 1
vim.g.EasyMotion_smartcase = 1

vim.keymap.set("", "<Leader>j", "<Plug>(easymotion-j)")
vim.keymap.set("", "<Leader>k", "<Plug>(easymotion-k)")
vim.keymap.set("n", "s", "<Plug>(easymotion-s2)")

vim.keymap.set("", "/", "<Plug>(easymotion-sn)")
vim.keymap.set("o", "/", "<Plug>(easymotion-tn)")

--
-- Replace Word
--

vim.keymap.set("n", "<Leader>r", ":%s/\\<<C-r><C-w>\\>/")

--
-- Sort Words
--

vim.keymap.set("v", "<Leader>sw", "d:execute 'normal i' . join(sort(split(getreg('\"'))), ' ')<CR>")

--
-- Tabs (BarBar)
--

-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>")

-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")

-- Go to buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>")

-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--
-- Indent Blankline
--

require("ibl").setup()

--
-- Virtual Column
--

require("virt-column").setup({
  virtcolumn = "80,120"
})
