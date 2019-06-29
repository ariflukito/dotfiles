" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Load some plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'vim-syntastic/syntastic'
"Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'

" Load agila colorscheme
Plug 'nerdypepper/agila.vim'

" Only load on graphical terminal
if &term !~ 'linux' && !has('gui_running')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " vim-airline configuration
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline_skip_empty_sections = 1
    let g:airline_theme = 'hybrid'

    " vim-syntastic configuration
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
    set t_Co=256
    colorscheme agila
elseif has('gui_running')
    colorscheme default
else
    " True colors
    if (has("termguicolors"))
        set termguicolors
    endif
    colorscheme agila
endif

" Disable intro message
set shortmess+=I

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

" Use clipboard buffer in X
set clipboard=unnamedplus
