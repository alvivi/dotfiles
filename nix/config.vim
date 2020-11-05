"
" Common Configuration
"

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

"
" Color Scheme & Theme
"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
syntax enable

let g:airline_theme='one'
let g:one_allow_italics = 1
set background=dark
colorscheme one

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" NeoVim Remote
"

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

"
" Leader
"

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
let maplocalleader = "\\"

"
" Netrw
"

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let s:treedepthstring= "|> "

"
" Buffer Navigation
"

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

"
" Terminal emulation
"

augroup terminal
autocmd TermOpen * setlocal nospell
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * setlocal scrollback=1000
autocmd TermOpen * setlocal signcolumn=no
augroup END
nnoremap <leader>zz :terminal<CR>
nnoremap <leader>zh :new<CR>:terminal<CR>
nnoremap <leader>zv :vnew<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=teal guifg=white ctermbg=1 ctermfg=15

" https://github.com/neovim/neovim/issues/11072
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=10

"
" Startify
"

let g:startify_custom_header = []

"
" GitGutter
"

let g:gitgutter_eager = 1    " runs diffs on buffer switch
let g:gitgutter_enabled = 1  " enables gitgutter (hunks only)
let g:gitgutter_realtime = 1 " runs diffs when stop writting
let g:gitgutter_signs = 1    " shows signs on the gutter
let g:gitgutter_sign_added= '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'
noremap <Leader>hn :GitGutterNextHunk<CR>
noremap <Leader>hp :GitGutterPrevHunk<CR>
noremap <Leader>hs :GitGutterStageHunk<CR>
noremap <Leader>hu :GitGutterUndoHunk<CR>

"
" Vim as Git tool
"

autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

"
" Fugitive
"

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
noremap <Leader>gs :Gstatus<cr>
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

"
" Easy Motion
"

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-s2)

let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

"
" FZF
"

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
noremap <Leader>sc :Ag<CR>
noremap <Leader>se :Rg<CR>
noremap <Leader>sf :FZF<CR>
noremap <Leader>sg :GitFiles<CR>

"
" ALE
"

let g:airline#extensions#ale#enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_completion_enabled = 1
let g:ale_cursor_detail = 1
let g:ale_echo_delay = 1000
let g:ale_elixir_elixir_ls_release = '/home/alvivi/Projects/elixir-ls/release'
let g:ale_elixir_mix_executable = '/home/alvivi/.config/nixpkgs/mix_wrapper.sh'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\}

nnoremap <silent> K :ALEHover<CR>
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> gds :ALEGoToDefinitionInSplit<CR>
nmap <silent> gdt :ALEGoToDefinitionInTab<CR>
nmap <silent> gr :ALEFindReferences<CR>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

"
" Vim-Mix-Format
"

let g:mix_format_on_save = 1

