" {{{ VIM-PLUG
" _________ ensure vim-plug is installed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" _________ the plugins

call plug#begin('~/.vim/plugged')
Plug 'sts10/vim-pink-moon'
Plug 'sjl/badwolf'
Plug 'junegunn/seoul256.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'posva/vim-vue'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'raimondi/delimitmate'

call plug#end()

" VIM-PLUG }}}

" {{{ EDITOR

" it really does make vim more useful:
" even though having a vimrc turns compatible off,
" there are times, like when using -u to launch vim,
" when it's helpful to set this explicitly.
set nocompatible

syntax on
" necessary for correct rendering in tmux
if &term =~ '256color'
  set t_ut=
endif
"let &background = 'dark'
let g:seoul256_background=233
colorscheme seoul256
"colorscheme pink-moon
filetype plugin indent on
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" adds a menu to tab completion
set wildmenu
" allow backspace over:
" indent (autoindent),
" eol (line breaks),
" start (start of insert)
set backspace=indent,eol,start
" turns \Delimitmate\ off by default;
" use ':DelimitMateSwitch' to toggle
let delimitMate_offByDefault = 1

" _________ statusline
" by default, statusline is only shown when there are two or more windows
" setting it to '2' always shows the statusline
set laststatus=2
" show the file's relative path
set statusline=%f
" add a space
set statusline+=\
" show filetype
set statusline+=%y
" add a space
set statusline+=\
" flags; modified, read-only
set statusline+=%(%m%r%)
" show the format options
set statusline+=[%{&fo}]
" switch to right side of statusline
set statusline+=%=
" show column position
set statusline+=%c
" add a space
set statusline+=\
" show current line/total lines in file
set statusline+=[%04l\/%04L]


" _________ emmet


" EDITOR }}}

" {{{ MAPPINGS{{{

" _________ leaders

let mapleader = ","
let maplocalleader = "\\"

" _________ editor

" enter normal mode from insert mode
" enter normal mode from insert
inoremap jk <esc>
" disable the <esc> key
inoremap <esc> <nop>
" disable the arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
" and in insert mode
"inoremap <up> <nop>
"inoremap <right> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop> 

" switches to next buffer
"nnoremap <leader>L :bnext<cr>

" _________ moving around

" moves to the beginning of the current line.
" overwrites the default mapping of 'H' which moves to the first line.
nnoremap H 0
" moves to the end of the current line.
" overwrites the default mapping of 'L' which moves to the last line.
nnoremap L $
" switch to next buffer (forward)
nnoremap <leader>f :bnext<cr>
" switch to previous tab (reverse)
nnoremap <leader>r :bprevious<cr>

" _________ vimrc editing

" open ~/.vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" _______________ comments

" comment opening
nnoremap <leader>cmt o"  <esc>3i{<esc>a
" comment sub-section
nnoremap <leader>2mt o"  <esc>9i_<esc>a
" comment sub-sub-section
nnoremap <leader>3mt o"  <esc>15i_<esc>a
" comment closing
nnoremap <leader>tmc o"  <esc>3i}<esc>3ha <esc>i

" _________ moving lines around

" select the current line, delete it, then paste it below.
nnoremap <leader>_ Vdp
" same as above, but pastes it above the current line.
nnoremap <leader>- VdkP
" surround current line with empty lines
nnoremap <leader><c-o> O<esc>jo<esc>
" copy current line, paste it below, move to end of line, end in visual mode
nnoremap <leader>oo 0Vyp$v
" increase indent level
nnoremap <a-]> 0i<tab><esc>

" ________ text manipulation

" in insert mode, make current word UPPERCASE
inoremap <leader><c-u> <esc>vawUi
" do the same THING in normal mode
nnoremap <leader><c-u> viwU<esc>
" surround current word with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround current word with single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" surround current selection with double quotes
vnoremap <leader>" y`<i"<esc>`>a"<esc>
" surround current selection with single quotes
vnoremap <leader>' y`<i'<esc>`>a'<esc>
" replace charecter under the cursor with a '.'
nnoremap <leader>. s.<esc>2w<esc>

" _________ operator pending mappings

" _______________ parentheses

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" _______________ curly brackets

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" ________ dummy mappings

nnoremap <leader>ec :echo "ohai!"<cr>
" another dummy mapping, but maybe useful?
" comments?
" copies a line and pastes it below the current one, offset by 9 spaces.
nnoremap <leader>9 Vyp0i         <esc>

" MAPPINGS }}}}}}

" {{{ AUTOCOMMANDS

" _________ general

augroup warning_strip
  autocmd!
  autocmd BufRead * highlight OverLength ctermbg=53
  autocmd BufRead * match Overlength /\%80v.*/
augroup END

" _________ filetype

augroup rainbow_paren
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
augroup END

augroup javascript_libs
  autocmd!
  autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
augroup END

" strip whitespace on save for certain filetypes
augroup strip_whitespace
  autocmd!
  autocmd BufRead * EnableWhitespace
  autocmd FileType javascript,vue EnableStripWhitespaceOnSave
augroup END

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  autocmd FileType javascript setlocal list
  autocmd FileType javascript setlocal number
  autocmd FileType javascript setlocal relativenumber
  autocmd FileType javascript setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*//'
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup filetype_yaml
  autocmd!
  autocmd FileType yaml setlocal lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  autocmd FileType yaml setlocal list
  autocmd FileType yaml setlocal number
  autocmd FileType yaml setlocal relativenumber
  autocmd FileType yaml nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_markdown
  autocmd!
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd FileType markdown onoremap <buffer> ht
        \ :<c-u>execute "normal!
        \ ?^[-=]\\{2,}$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> hg
        \ :<c-u>execute "normal!
        \ ?^[-=]\\{2,}$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_vue
  autocmd!
  autocmd FileType vue setlocal lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  autocmd FileType vue setlocal list
  autocmd FileType vue setlocal number
  autocmd FileType vue setlocal relativenumber
  autocmd FileType vue nnoremap <buffer> <localleader>c 0i//<esc>
augroup END

" _________ snippets

augroup snippets_javascript
  autocmd!
  autocmd FileType javascript iabbrev <buffer> fcn function () {
        \<cr>
        \<cr>
        \}
augroup END

augroup snippets_html
  autocmd!
  autocmd FileType html iabbrev <buffer> doctype <!DOCTYPE html>
augroup END

" _________ folding
" Vimscript file settings ---------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" AUTOCOMMANDS }}}
