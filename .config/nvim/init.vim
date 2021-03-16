" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Load some plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Load some colorschemes
Plug 'nerdypepper/agila.vim'

let myterm = $TERM

" Only load on graphical terminal
if myterm !~ 'linux'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " vim-airline configuration
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline#extensions#coc#enabled = 1
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

" FZF configurations
let g:fzf_colors = {
    \ 'gutter'    : ['bg', 'Normal'],
    \ 'bg+'       : ['bg', 'Folded'],
    \ 'pointer'   : ['fg', 'TabLineSel'],
    \ 'marker'    : ['fg', 'TabLineSel'],
    \ 'info'      : ['fg', 'Comment'],
\}

" ALE configurations
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['yapf'],
\}
let g:ale_fix_on_save = 1

" CoC configurations
" Make <CR> auto-select the first completion itemm
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
if myterm =~ 'linux'
    set guicursor=
    colorscheme agila
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

" Merge signcolumn and number column
"set signcolumn=number

" Keyword completion options
set ignorecase
"set infercase
set smartcase

" Use clipboard buffer in X (requires xsel)
set clipboard+=unnamedplus
