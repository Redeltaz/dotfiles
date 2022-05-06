" control-c to escape edit mode
nnoremap <C-c> <Esc>

" allow multiple tab
vnoremap < <gv
vnoremap > >gv

" BufferLine
nnoremap <silent> <S-l> :BufferLineCycleNext<CR>
nnoremap <silent> <S-h> :BufferLineCyclePrev<CR>
nnoremap <silent> <C-d> :bd<CR>
