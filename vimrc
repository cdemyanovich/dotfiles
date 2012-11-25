call pathogen#infect()
call pathogen#helptags()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " replace all occurrences on line instead of only first

" use comma as <Leader> key instead of backslash
let mapleader=","

" custom filetype mappings
au BufRead,BufNewFile *.rabl setfiletype ruby
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile *.hiccup setfiletype clojure
au BufRead,BufNewFile *.go setfiletype go

" ignore these files and directories in listings
set wildignore+=tags,*/tmp/*,*/coverage/*

" configure Command-T plugin
" let g:CommandTMaxHeight=10
" let g:CommandTMatchWindowReverse=1

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set relativenumber

" switch between absolute and relative numbers when focus is lost or gained,
" respectively
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" switch between absolute an drelative numbers when switching modes
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set cursorline
set cursorcolumn
" set colorcolumn=80

set list
set listchars=tab:▸\ ,eol:¬,trail:-

" always show status line
set laststatus=2
set ruler
set showcmd

" Automatically hide altered buffers when navigating away from them
set hidden

" Default indentation
set ts=2 sts=2 sw=2 expandtab

set linespace=4

" provide some context when editing
set scrolloff=3

" Powerline https://github.com/Lokaltog/vim-powerline
let g:Powerline_symbols = 'unicode'
" let g:Powerline_theme = 'skwp'
" let g:Powerline_colorscheme = 'skwp'
call Pl#Theme#RemoveSegment('fugitive:branch')

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
