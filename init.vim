call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary' "gc gcc
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify' "Fancy start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Code completion
Plug 'janko/vim-test'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'arzg/vim-colors-xcode' "A vim colorscheme
Plug 'ryanoasis/vim-devicons' "icons
call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
filetype plugin indent on
set nocompatible
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread
set clipboard=unnamed
set relativenumber
set expandtab                     " expands tabs to spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set encoding=UTF-8
set wrap
set incsearch
set hlsearch
set mouse=a
set clipboard^=unnamedplus " Use the system resgister for everything"
set foldmethod=indent

syntax on 
let mapleader = "\<Space>"

let g:strip_whitespace_on_save = 1
set ttimeout
set ttimeoutlen=0

"Imap ESC to jj
:imap jj <Esc>

"Map nohighlight
nnoremap <F4> :noh<CR>

"Map colon to semicolon
nnoremap ; :

"----------------------------------------------
"" Layer: Themes
"----------------------------------------------
set termguicolors
set background=dark
colorscheme dracula

"----------------------------------------------
"" Auto open NERDTREE 
"----------------------------------------------
"autocmd VimEnter * NERDTree | wincmd p

" FZF 
nnoremap <silent> <C-p> :GFiles --exclude-standard --others --cached<CR>
nnoremap <silent> <Space>bb :Buffer<CR>

" NERDTREE
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>                      " File > Tree
nnoremap <silent> <Leader>fT :NERDTreeFind<CR>                        " File > Tree > Find

"----------------------------------------------
" Linter
"----------------------------------------------
" Enable completion where available.
let g:ale_completion_enabled = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_lint_on_save = 1

let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'json': ['jq'],
      \   'ruby': ['rubocop'],
      \}

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'json': ['jsonlint'],
      \   'ruby': ['rubocop'],
      \}

let g:ale_lint_on_text_changed="never"
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"----------------------------------------------
" Plug 'itchyny/lightline.vim'
"----------------------------------------------
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '✓' : printf(
    \   'Linter %d🚸 %d⛔️',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'alestatus'] ]
      \ },
      \ 'component_function': {
      \   'alestatus': 'LinterStatus'
      \ },
      \ }
"=========

" Buffer
nnoremap <silent> <Leader>bb :Buffer<CR>    " List Buffers

" Solargraph
let g:coc_global_extensions = ['coc-solargraph']

" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
