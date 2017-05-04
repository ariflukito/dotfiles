" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Load some plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap', { 'on': 'MinimapToggle' }

" Only load on graphical terminal
if &term !~ 'linux'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endif

" Initialize plugin system
call plug#end()

" vim-airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1

" Shortcut for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Shortcut to change buffer easier
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Shortcut for Tagbar
nmap <F8> :TagbarToggle<CR>

" Set theme color
if &term =~ 'linux'
    colorscheme slate
else
    set background=dark
    colorscheme solarized
endif

" Use spaces instead of tabs
set expandtab

" Set tab to 4 spaces
set shiftwidth=4
set tabstop=4

" Show line numbers
set number

" Keyword completion options
set ignorecase
"set infercase
set smartcase

" Highlight search term
set hlsearch
