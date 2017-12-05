" it really does make vim more useful:
         " it really does make vim more useful:
" 	even though having a vimrc turns compatible off,
"	there are times, like when using -u to launch vim,
"	when it's helpful to set this explicitly.

set nocompatible

syntax on
colorscheme badwolf

set textwidth=80
 
" ==============================================================================
" ___ MAPPINGS, etc. ___________________________________________________________ 


" _________ general ____________________________________________________________ 

" enter normal mode from insert mode
inoremap jk <esc>
" disable the <esc> key
inoremap <esc> <nop>
" disable the arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
" and in insert mode
inoremap <up> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

" _________ moving around ______________________________________________________ 

" moves to the beginning of the current line.
" overwrites the default mapping of 'H' which moves to the first line.
nnoremap H 0
" moves to the end of the current line.
" overwrites the default mapping of 'L' which moves to the last line.
nnoremap L $

" _________ leaders ____________________________________________________________ 

let mapleader = "," 
let maplocalleader = "\\"


" _________ vimrc editing ______________________________________________________ 

" open ~/.vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" _______________ comments _____________________________________________________ 

" comment opening
nnoremap <leader>cmt o" <esc>78a=<esc>a<cr>"  <esc>3i_<esc>a <esc>74a_<esc>bR
" comment sub-section 
nnoremap <leader>2mt o"  <esc>9i_<esc>a <esc>68a_<esc>bR
" comment sub-sub-section
nnoremap <leader>3mt o"  <esc>15i_<esc>a <esc>62a_<esc>bR
" comment closing 
nnoremap <leader>tmc o" <esc>78a_<esc>o" <esc>78a=<esc>k$3h

" _________ moving lines around ________________________________________________ 

" select the current line, delete it, then paste it below.
nnoremap <leader>- Vdp
" same as above, but pastes it above the current line.
nnoremap <leader>_ VdkP
" surround current line with empty lines
nnoremap <leader><c-o> O<esc>jo<esc>

" _________ text manipulation __________________________________________________ 

" in insert mode, make current word UPPERCASE
inoremap <leader><c-u> <esc>vawUi
" do the same THING in normal mode
nnoremap <leader><c-u> viwU<esc>
" surround current word with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround current word with single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" surround currentt selection with double quotes
vnoremap <leader>" y`<i"<esc>`>a"<esc>
" surround currentt selection with single quotes
vnoremap <leader>' y`<i'<esc>`>a'<esc>

" ________ dummy mappings _____________________________________________________ 
nnoremap <leader>ec :echo "ohai!"<cr>
" another dummy mapping, but maybe useful?
" comments?
" copies a line and pastes it below the current one, offset by 9 spaces.
nnoremap <leader>9 Vyp0i         <esc>

" _________________________________________________________________ mappings ___
" ==============================================================================
