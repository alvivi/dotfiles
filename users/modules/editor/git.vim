"
" GitSigns
"

lua require('gitsigns').setup()

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
