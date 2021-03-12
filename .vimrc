" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Load some plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Load some colorschemes
Plug 'nerdypepper/agila.vim'

" Only load on graphical terminal
if &term !~ 'linux' && !has('gui_running')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " vim-airline configuration
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline_skip_empty_sections = 1
    let g:airline_theme = 'hybrid'

    let g:webdevicons_enable = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_airline_tabline = 1

endif

" Initialize plugin system
call plug#end()

" Shortcut for CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree configuations
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Exit nvim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Snippets
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger ='<Tab>'
let g:UltiSnipsJumpBackwardTrigger ='<C-b>'

" Shortcut to change buffer easier
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left> :bprevious<CR>

" Allow switching between buffers without saving
set hidden

" Shortcut for Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

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
