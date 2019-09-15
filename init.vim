set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'szw/vim-g'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'wellle/tmux-complete.vim'
Plugin 'xolox/vim-misc'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'regedarek/ZoomWin'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'corntrace/bufexplorer'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-speeddating'
Plugin 'chrisbra/csv.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tmhedberg/matchit'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'elzr/vim-json'
Plugin 'mklabs/grunt.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree.git'
Plugin 'chrisbra/NrrwRgn'
"Plugin 'aklt/plantuml-syntax'
"Plugin 'ktvoelker/sbt-vim.git'
Plugin 'scrooloose/syntastic'
Plugin 'mkitt/tabline.vim.git'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-scripts/vcscommand.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mhinz/vim-signify'
Plugin 'jpalardy/vim-slime.git'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'othree/xml.vim'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"execute pathogen#infect()
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.zsh setlocal filetype=sh

"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org            call org#SetOrgFileType()
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

syntax on

let g:utl_cfg_hdl_scm_http_system = "silent !google-chrome %u &"

set number
set relativenumber
set smartindent
" size of tabstop
set tabstop=2
set incsearch
set fileformat=unix

" size of an indent
set shiftwidth=2

" indent at beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoshowtag = 0

nnoremap <F5> :silent update<Bar>silent !google-chrome %:p &<CR>
"nnoremap <F15>c :exe ':silent !google-chrome %'<CR>
"nmap <silent> <leader>w :exec 'silent !google-chrome % &'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"let g:syntastic_disabled_filetypes=['scala', 'sbt']
let g:syntastic_scala_checkers=['']
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:sqlutil_keyword_case = '\U'
let g:sqlutil_align_where = 1
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_align_comma = 1
let g:multi_cursor_exit_from_insert_mode=0
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'
" Always show statusline
set laststatus=2
set noshowmode

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_auto_trigger=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0

let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ctrlp_working_path_mode = 'a'

syntax enable
set t_Co=256
colorscheme monokai

let g:ycm_server_keep_logfiles = '1'
set t_ut=

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
inoremap jj <esc>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let maplocalleader = ',,'

let g:EclimCompletionMethod = 'omnifunc'
let g:SuperTabDefaultCompletionType = 'context'

" Rainbow parantheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Automatically reload vim config(s)
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=237
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 2

" VimShell
" Use current directory as vimshell prompt.
"let g:vimshell_prompt_expr =
"\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
"let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" easytags
"let g:easytags_async = 1
"let g:easytags_auto_highlight = 0

" tmuxcomplete
let g:tmuxcomplete#trigger = 'omnifunc'

"easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

let mapleader = "\<Space>"

map <Leader> <Plug>(easymotion-prefix)

map  <Leader>j <Plug>(easymotion-bd-f)
nmap <Leader>j <Plug>(easymotion-overwin-f)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

"noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
"nerdtree
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>w :update<CR>

