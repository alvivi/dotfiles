vim.opt.encoding = "utf-8" -- UTF-8 encoding
vim.opt.hidden = true      -- Don't unload buffer when switching away
vim.opt.modeline = true    -- Allow per-file settings via modeline
vim.opt.secure = true      -- Disable unsafe commands in local .vimrc files
vim.opt.swapfile = false   -- Disable swap files

vim.opt.hlsearch = true   -- Highlight search results
vim.opt.incsearch = true  -- Enable incremental search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Use smart case when searching

vim.opt.lazyredraw = true   -- Redraw only when needed
vim.opt.termguicolors = true -- Enable GUI colors

vim.opt.showmatch = true -- Highlight matching [{()}]

vim.opt.backspace = {'indent', 'eol', 'start'} -- Sane backspace

vim.opt.clipboard = vim.opt.clipboard + {'unnamed', 'unnamedplus'} -- Use the system clipboard for yank/put/delete

vim.opt.mouse = 'a'          -- Enable mouse for all modes settings
vim.opt.mousemodel = 'popup' -- Right-click pops up context menu 

vim.opt.number = true     -- Show absolute line number of the current line
vim.opt.scrolloff = 10    -- Scroll the window so we can always see 10 lines around the cursor
vim.opt.sidescrolloff = 5 -- Horizontal scrolloff
vim.opt.textwidth = 80    -- Wrap at 80 characters like a valid human
vim.opt.cursorline = true -- Highlight current line

vim.opt.wrap = false -- Do not break lines when they are too long

vim.opt.showcmd = true -- Show command in bottom bar

vim.opt.wildmenu = true -- Visual autocomplete for command menu

vim.opt.spell = true -- Enable spell checking
vim.opt.spelllang = {'en', 'es'} -- Spell languages
vim.opt.spelloptions = 'camel' -- Check CamelCase as separate words

vim.opt.splitbelow = true -- Vertical split below
vim.opt.splitright = true -- Horizontal split right

vim.opt.list = true                     -- Show invisibles
vim.opt.lcs = 'tab:▸\\ ,trail:·,nbsp:%' -- Invisible characters

vim.opt.foldenable = false -- Disable folding

vim.opt.shell = 'zsh' -- Use ZSH by default

vim.opt.tabstop = 2      -- Set tab size
vim.opt.shiftwidth = 2   -- Set indent size
vim.opt.expandtab = true -- Use spaces for tab
