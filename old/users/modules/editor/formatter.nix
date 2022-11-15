pkgs: ''
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1

  let g:neoformat_prettier = {
    \ 'exe': '${pkgs.nodePackages.prettier}/bin/prettier',
    \ 'args': ['--stdin-filepath', '"%:p"'],
    \ 'stdin': 1,
    \ }

  let g:neoformat_javascript_prettier = g:neoformat_prettier
  let g:neoformat_enabled_javascript = ['prettier']

  let g:neoformat_json_prettier = g:neoformat_prettier
  let g:neoformat_enabled_json = ['prettier']

  let g:neoformat_css_prettier = g:neoformat_prettier
  let g:neoformat_enabled_css = ['prettier']

  let g:neoformat_typescript_prettier = g:neoformat_prettier
  let g:neoformat_enabled_typescript = ['prettier']

  augroup fmt
    autocmd!
    au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END
''
