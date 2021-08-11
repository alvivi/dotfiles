set encoding=utf8                              " UTF-8 Encoding
set hidden                                     " don't unload buffer when switching away
set modeline                                   " allow per-file settings via modeline
set secure                                     " disable unsafe commands in local .vimrc files
set noswapfile                                 " disable swap files
set hlsearch incsearch ignorecase smartcase    " search
set wildmenu                                   " completion
set backspace=indent,eol,start                 " sane backspace
set clipboard+=unnamed,unnamedplus             " use the system clipboard for yank/put/delete
set mouse=a                                    " enable mouse for all modes settings
set mousemodel=popup                           " right-click pops up context menu
set number                                     " show absolute line number of the current line
set scrolloff=10                               " scroll the window so we can always see 10 lines around the cursor
set sidescrolloff=5                            " horizontal scrolloff
set textwidth=80                               " wrap at 80 characters like a valid human
set nowrap                                     " do not break lines when they are too long
set showcmd                                    " show command in bottom bar
set cursorline                                 " highlight current line
filetype indent on                             " load filetype-specific indent files
set wildmenu                                   " visual autocomplete for command menu
set lazyredraw                                 " redraw only when we need to.
set showmatch                                  " highlight matching [{()}]
set spell                                      " spell checking
set splitbelow                                 " vertical split below
set splitright                                 " horizontal split right
set list                                       " show invisibles
set guioptions-=e                              " enable gui options
set nofoldenable                               " disable folding
set tabstop=2 shiftwidth=2 expandtab           " use spaces, indent size = 2
set lcs=tab:▸\ ,trail:·,nbsp:%                 " invisible characters
set shell=zsh                                  " use ZSH by default
let &colorcolumn="80,120" " show length column " column rules 
