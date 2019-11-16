" LaTex stuff
let g:vimtex_view_method = 'skim'
let g:tex_flavor = "latex"
"let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_latexlog = {
	\ 'ignore_filters' : ['Command'],
	\}

augroup filetype_tex
  autocmd!
" spellchecking
  autocmd FileType tex setlocal spell spelllang=en_us
  autocmd FileType tex setlocal textwidth=0
  autocmd FileType tex setlocal linebreak
  autocmd FileType tex setlocal formatoptions=taw
augroup END
