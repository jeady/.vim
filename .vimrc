let g:pathogen_disabled = ['YankRing']
filetype on  " Automatically detect file types.
filetype plugin indent on
set nocompatible  " We don't want vi compatibility.
syntax enable
set encoding=utf-8
set shell=bash

" Install pathogen to help manage plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

let mapleader = ","
let g:mapleader = ","
nnoremap ; :
inoremap <C-space> <Esc>

" When scrolling the viewport, scroll 3 lines at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Allows you to save the file as sudo after you
" have already opened as an unpriveleged user.
cmap w!! w !sudo tee % >/dev/null

" Toggle the tag list window
nnoremap <Leader>tt :TlistToggle<cr>
nnoremap <Leader>tb :TagbarToggle<cr>

" Fugitive
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>

" Show the command tree
set showcmd

" Show NERDTree using ,p
nnoremap <leader>nt :NERDTreeToggle<cr>

" CtrlP
nnoremap <leader>p :CtrlP<cr>

" YankRing
nnoremap <leader>y :YRShow<cr>

" show the terminal title
set title

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp " directory to place swap files in
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme

" Formatting
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Line Numbers
set nu

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

" Show $ at end of line and trailing space as ~
set list lcs=tab:\›\ ,trail:~,extends:>,precedes:<
" set list lcs=tab:\›\ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" Smart way to move btw. windows
map <C-j> <C-W>h
map <C-k> <C-W>l

" Tab configuration
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <C-l> :tabnext<cr>
map <C-h> :tabprev<cr>

" Enable OmniCompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" Ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Arduino
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Needed for iTerm2 solarized I guess
set background=light

set wrap
nnoremap j gj
nnoremap k gk

let g:Powerline_symbols = 'fancy'

highlight ColorColumn ctermbg=red
set colorcolumn=80,81

" Gundo
nnoremap <leader>gt :GundoToggle<CR>

" Get rid of vim-gitgutter gray band.
highlight clear SignColumn

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" QuickFix
noremap <leader>fo :copen<CR>
noremap <leader>fc :ccl<CR>
noremap <leader>fp :cp<CR>
noremap <leader>fn :cn<CR>
noremap <leader>ff :cnf<CR>
noremap <leader>lo :lopen<CR>
noremap <leader>lc :lcl<CR>
noremap <leader>lp :lp<CR>
noremap <leader>ln :ln<CR>
noremap <leader>lf :lnf<CR>
noremap <leader>e :Errors<CR>

" TagBar Golang support
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" OS X clipboard sharing
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
