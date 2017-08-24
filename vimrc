set number
syntax on

call plug#begin()

	Plug 'scrooloose/nerdtree'
	Plug 'flazz/vim-colorschemes'
	Plug 'Valloric/YouCompleteMe'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'bling/vim-airline'
	Plug 'matze/vim-move'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'thaerkh/vim-workspace'

call plug#end()

"NERDTree autoloader"
function! StartUp()
	if 0 == argc()
		NERDTree
	end
endfunction 
autocmd VimEnter * call StartUp()

"NERDTree closer"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"color scheme"
colorscheme Monokai

"mouse movement"
set mouse=a

"Indent Guides auto launch"
let g:indent_guides_enable_on_vim_startup = 1

"autosave function"
let g:workspace_autosave_always = 1

