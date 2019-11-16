" enter normal mode from insert
inoremap jk <esc>

" leaders

let mapleader = "," 
let maplocalleader = "\\"

" open vimrc in a vertical split
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
" open this file in a vertical split
nnoremap <leader>kv :vsplit ~/.vim/keymaps.vim<cr>

" source vimrc
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

" _________ moving lines around

" select the current line, delete it, then paste it below.
nnoremap <leader>_ Vdp
" same as above, but pastes it above the current line.
nnoremap <leader>- VdkP
" surround current line with empty lines
nnoremap <leader><c-o> O<esc>jo<esc>
" copy current line, paste it below, move to end of line 
nnoremap <leader>oo 0Vyp$
" increase indent level
nnoremap <a-]> 0i<tab><esc>

" ________ text manipulation

" in insert mode, make current word UPPERCASE
inoremap <leader>U <esc>vawUi
" ditto, but lowercase
inoremap <leader>u <esc>vawui
" do the same THING in normal mode
nnoremap <leader>U viwU<esc>
" ditto, but lowercase
nnoremap <leader>u viwu<esc>
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
" delete selected text into black hole register
vnoremap <leader>d "_d

