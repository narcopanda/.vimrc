syntax on
"set number 
"set relativenumber 
set clipboard=unnamedplus

let mapleader = ","

"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

imap jj <esc>
vmap m <esc>
"shortcut for saving 
map <Leader>w <esc>:w<CR>
"shortcut for save and quiting
map <Leader>wq <esc>:wq<CR>

"this is for moving lines up and down
nnoremap <S-j> :m+<CR>==
nnoremap <S-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <S-j> :m'>+<CR>gv=gv
vnoremap <S-k> :m-2<CR>gv=gv


call plug#begin()

        Plug 'scrooloose/nerdtree'
        Plug 'Valloric/YouCompleteMe'
        Plug 'flazz/vim-colorschemes'
        Plug 'tpope/vim-fugitive'
        Plug 'thaerkh/vim-workspace'
        Plug 'artur-shaik/vim-javacomplete2'
        Plug 'thaerkh/vim-workspace'
        Plug 'airblade/vim-gitgutter'
        Plug 'bling/vim-airline'
        Plug 'jiangmiao/auto-pairs'
        Plug 'joshdick/onedark.vim'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'ervandew/supertab'

call plug#end()



" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"sets the path of clang for ycm 
"let g:clang_library_path='/usr/lib/libclang.so'
let g:ycm_autoclose_preview_window_after_insertion = 1

"NERDTree autoloader"
function! StartUp()
        if 0 == argc()
                NERDTree
        end
endfunction
autocmd VimEnter * call StartUp()

"NERDTree closer"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"color scheme"
"--------------------"
"colorscheme Monokai"
colorscheme onedark
se t_Co=256


"java autocomplete function"
autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-IMports-RemoveUnused)



nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

"airline tab functions"
let g:airlinge#extensions#tabline#show_splits = 1

"check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime
set modifiable

autocmd FileType javascript setlocal omnifunc=tern#Complete
