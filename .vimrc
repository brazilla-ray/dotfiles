" it really does make vim more useful:
" 	even though having a vimrc turns compatible off,
"	there are times, like when using -u to launch vim,
"	when it's helpful to set this explicitly.
set nocompatible

" MAPPINGS
" leaders
let mapleader = "," 
let maplocalleader = "\\"
" select the current line, delete it, then paste it below current line.
nnoremap <leader>- Vdp
" same as above, but pastes line above current.
nnoremap <leader>_ VdkP
" in insert mode, make current word uppercase
inoremap <c-<leader>u> <esc>vawUi
" do the same thing in normal mode
nnoremap <c-<leader>u> vawU<esc>


