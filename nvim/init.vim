"-------------------- Vim-Plug --------------------"

call plug#begin('~/AppData/Local/nvim/plugged')     "Place where pluggins will be installed
Plug 'sainnhe/gruvbox-material'                     "Theme
Plug 'preservim/nerdtree'                           "Files explorer
Plug 'ryanoasis/vim-devicons'                       "Icons for file explorer (need to install a font)
Plug 'itchyny/lightline.vim'                        "Status bar theme
Plug 'maximbaz/lightline-ale'                       "Status bar linting
Plug 'dense-analysis/ale'                           "Linting (syntax checking and semantic errors)
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "Auto complete (need nodejs installed)
Plug 'Yggdroot/indentLine'                          "Display vertical lines for identation
Plug 'jiangmiao/auto-pairs'                         "Insert or delete brackets, parens, quotes in pair
call plug#end()

"-------------------- Basic Setup --------------------"

"" Personal
set number relativenumber
set mouse=a
set noshowmode                  "noshowmode if status bar plugin installed
set scrolloff=5
"set nowrap                     "text from one line doesn't go down to the next,just continues on the same line ad infinitum
set clipboard=unnamedplus
set laststatus=2
set autoindent
set numberwidth=1
set ruler
set title
set backspace=indent,eol,start  "Fix backspace indent
set hidden                      "Enable hidden buffers
"" Enconding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
"" Tabs May be overridden by autocmd rules
set tabstop=4
"set softtabstop=4
set shiftwidth=4
"set expandtab

"-------------------- Mappings --------------------"

let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

"-------------------- Visual & Pluggin Settings --------------------"

set updatetime=200

"" Theme
colorscheme gruvbox-material

"" COC
let g:copilot_no_tab_map = v:true "Avoid error that coc not work with tab
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

"" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <C-q> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoDeleteBuffer=1

"" VimDevIcons
let g:webdevicons_enable=1 "Loading the plugin
let g:webdevicons_enable_nerdtree=1 "Adding the flags to NERDTree

"" Lightline-ale
"Register the components:
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
"Set color to the components:
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
"Add the components to the lightline, for example to the right side:
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
"Lineinfo, fileformat, etc. have to be added additionaly:
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'filetype'] ] } " ['fileformat', 'fileencoding', 'filetype']
"Using icons as indicators (need to install a font):
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
