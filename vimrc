" vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" my bundles
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'ervandew/supertab.git'
Bundle 'jpalardy/vim-slime.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim.git'
Bundle 'mhinz/vim-signify'
Bundle 'myusuf3/numbers.vim.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'spiiph/vim-space.git'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-vinegar'
Bundle 'rking/ag.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'plasticboy/vim-markdown'

syntax enable
set background=dark
colorscheme molokai 

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

set autoindent
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set cursorline
set directory=~/.vim/temp
set encoding=utf-8
set hidden
set hlsearch
set ignorecase
set laststatus=2
set modelines=0
set nowrap
set number
set scrolloff=5
set sidescrolloff=5
set smartindent
set t_Co=256
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set wildmode=list:longest
set wildignore+=node_modules/**

nnoremap ; :
inoremap jj <Esc>
let mapleader = ","
"nnoremap <leader><leader> <C-^>

nnoremap <leader>w <C-w>v<C-w>l

filetype plugin indent on

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

autocmd FileType ruby,jade,haml,eruby,yaml,html,javascript,sass,cucumber,rabl set ai sw=2 sts=2 et

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" xml folding
let g:xml_syntax_folding=1
au FileType xml,kml setlocal foldmethod=syntax

map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" copy, paste functions
map <leader>c "+y
map <leader>v "+p

map <leader>t :CtrlP<cr>
" make ctrlp ignore tmp directories
set wildignore+=.git,tmp/**
let g:ctrlp_show_hidden = 1

" vim-space config
let g:space_no_character_movements = 1

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

let g:slime_target = "tmux"

" highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=yellow guibg=yellow
:match ExtraWhitespace /\s\+$/

" remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" disable line numbers with F3
nnoremap <F3> :NumbersToggle<CR>:set nonumber<CR>

au BufNewFile,BufReadPost *.coffee,*.scss setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" gist settings
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_comman = 'pbcopy'
let g:gist_detect_filetype = 1

"Prevent auto-comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <C-n> :NERDTreeToggle<CR>

" Stop Syntastic checking angular html templates"
let g:syntastic_html_checkers=[]

let g:vim_markdown_folding_disabled=1

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" run GoFmt on save
au FileType go au BufWritePre <buffer> Fmt

let g:rspec_command = "!zeus rspec {spec}"
