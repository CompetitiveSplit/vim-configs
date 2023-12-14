"leader 
let mapleader = "\ "
"Gumber
set number 
set relativenumber

"copy + paste
set clipboard=unnamed

"idk
syntax on
set ruler
set encoding=utf-8
set sw=2
set mouse=a

"show commands
set showcmd

"plugins
call plug#begin('~/.vim/plugged')

"theme
Plug 'sainnhe/everforest'

"autocomplete / suggestions
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'github/copilot.vim'

"status bar
Plug 'vim-airline/vim-airline'

"tree
Plug 'scrooloose/nerdtree'

"typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"fzf
Plug 'junegunn/fzf'

call plug#end()

"everforest conf
"IMPORTANT!
if has('termguicolors')
  set termguicolors
endif

"other option: set background=light
set background=dark 
"other opcion: let g:everforest_background='hard' or 'medium' or 'soft'
let g:everforest_background='hard'
colorscheme everforest


"LSP conf
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"Bar conf
"tabs
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#righy_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme='everforest'
let g:airline_extensions = []
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set noshowmode 
"always show tabs 
set showtabline=2


"NerdTree conf
nnoremap <silent> <leader>t :NERDTreeToggle<CR>


