set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=81
set expandtab

set fileformat=unix
set backspace=indent,eol,start
set encoding=utf-8
set ignorecase
set smartcase
set showmatch
set number
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required
Plugin 'vim-airline/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ap/vim-css-color'
Plugin 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'vue', 'html'] },

call vundle#end()            " required

filetype plugin indent on    " required

noremap <C-left> : tabprevious<CR>
noremap <C-right> :tabnext<CR>
noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <C-t> :tabnew<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"Disable text width for html files"
autocmd FileType html setlocal textwidth=0
 let g:fzf_action = {
 \ 'enter': 'vsplit',
   \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split' }
let g:user_emmet_leader_key=','
let g:airline_theme='base16_oceanicnext'
let g:isort_command = 'isort'
let g:user_emmet_install_global = 0
let g:ale_linters = {'python': ['flake8', 'isort']}
let g:ale_fixers = {
    \ 'python': ['autopep8', 'isort'],
    \}
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
autocmd FileType python setl makeprg=ale#Make
autocmd FileType html,css EmmetInstall

"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""
" " Enable syntax highlighting
syntax on
"
"
 let base16colorspace=256
 colorscheme default
 set background=dark
"
"
set cursorline    " highlight current active line
"
" """""""""""""""""""""""""""""""""""""""""""""""""
