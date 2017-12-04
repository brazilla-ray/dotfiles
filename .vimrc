" it really does make vim more useful:
         " it really does make vim more useful:
" 	even though having a vimrc turns compatible off,
"	there are times, like when using -u to launch vim,
"	when it's helpful to set this explicitly.

set nocompatible

syntax on
colorscheme badwolf


" ==============================================================================
" ___ MAPPINGS, etc. ___________________________________________________________ 

" _________ leaders ____________________________________________________________ 
let mapleader = "," 
let maplocalleader = "\\"

" _________ vimrc editing ______________________________________________________ 
" _______________ open ~/.vimrc in a vertical split_____________________________ 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" _______________ source ~/.vimrc ______________________________________________ 
nnoremap <leader>sv :source $MYVIMRC<cr>
" _______________ select the current line, delete it, then paste it below. _____ 
nnoremap <leader>- Vdp
" _______________ same as above, but pastes it above the current line.__________ 
nnoremap <leader>_ VdkP
" _______________ in insert mode, make current word UPPERCASE __________________ 
inoremap <leader><c-u> <esc>vawUi
" _______________ do the same THING in normal mode _____________________________ 
nnoremap <leader><c-u> viwU<esc>
" _______________ surround current line with empty lines _______________________ 
" put an empty line before and after the current line

nnoremap <leader><c-o> O<esc>jo<esc>

" dummy mapping
nnoremap <leader>ec :echo "ohai!"<cr>
" another dummy mapping, but maybe useful?
" comments?
" copies a line and pastes it below the current one, offset by 9 spaces.
nnoremap <leader>9 Vyp0i         <esc>

"  
" ==============================================================================
" ___ COMMENTS _________________________________________________________________ 

" _______________ comment opening ______________________________________________ 
nnoremap <leader>cmt o" <esc>78a=<esc>a<cr>"  <esc>3i_<esc>a <esc>74a_<esc>bR
" _______________ comment sub-section __________________________________________ 
nnoremap <leader>2mt o"  <esc>9i_<esc>a <esc>68a_<esc>bR
" _______________ comment text _________________________________________________ 
nnoremap <leader>cx o"  <esc>15i_<esc>a <esc>62a_<esc>bR
" _______________ comment closing_______________________________________________ 
nnoremap <leader>tmc o" <esc>78a_<esc>k0i
" ______________________________________________________________________________


" ==============================================================================
" ___ ABBREVIATIONS ____________________________________________________________ 

iabbrev @@ william@mrwilliamwhitaker.com
" ______________________________________________________________________________
