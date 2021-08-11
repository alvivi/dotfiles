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
