set shell=/bin/bash

filetype off
set nocompatible              " be iMproved, required
set ignorecase
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set autoread
Plugin 'VundleVim/Vundle.vim'
Plugin 'benekastah/neomake'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'vim-scripts/Emmet.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ericbn/vim-solarized'
Plugin 'nightsense/carbonized'
Plugin 'sheerun/vim-polyglot'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType elixir,ex,exs,eex let g:syntastic_enable_elixir_checker = 1


if has('nvim')
  " fix for <C-h> mapping
  nmap <silent><bs> :<c-u>TmuxNavigateLeft<CR>
endif

call vundle#end()            " required

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
colorscheme solarized
syntax on

let g:ctrlp_show_hidden = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep'
endif

let g:ag_prg="ag --nocolor --column"
let g:ag_working_path_mode="r"

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_vim_enabled_makers = []

autocmd! BufWritePost * Neomake

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

set nowrap
set nobackup
set noswapfile
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

highlight OverLength ctermbg=darkred ctermfg=white guibg=black
match OverLength /\%101v.\+/

hi Search cterm=bold ctermfg=white ctermbg=black

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
" Avoids showing the current mode below status line
set noshowmode

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" indent-guides
let g:indent_guides_guide_size = 2

let mapleader=" "
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1

nmap <Leader>f :noh<CR>
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

nmap <Leader>n :tabnew<CR>
nmap <Leader>v :vnew<CR>:CtrlP<CR>
nmap <Leader>w :q!<CR>
nmap <Leader><S-S> :w!
nmap <Leader>s :w<CR>
nmap <Esc> :w<CR>
nmap <Leader>kb :NERDTree<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
"
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!rspec {spec}"

autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
set runtimepath^=~/.vim/bundle/ag

set number norelativenumber
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W', '#F'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

