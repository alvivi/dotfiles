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

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

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
" Sort words
"
vnoremap <Leader>sw d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>
