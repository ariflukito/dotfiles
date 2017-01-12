" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Load some plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" vim-airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1

" Set solarized theme color
colorscheme solarized

" Use spaces instead of tabs
set expandtab

" Set tab to 4 spaces
set shiftwidth=4
set tabstop=4

" Keyword completion options
set ignorecase
"set infercase
set smartcase

" Highlight search term
set hlsearch

set laststatus=2
