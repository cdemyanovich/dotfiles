" References
" http://dougblack.io/words/a-good-vimrc.html

call pathogen#infect()
call pathogen#helptags()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" let g:solarized_termcolors=256
set background=dark
" colorscheme solarized

" Access colors present in 256 colorspace
" See also: https://github.com/chriskempson/base16-iterm2
let base16colorspace=256
colorscheme base16-default-dark

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
au BufRead,BufNewFile Capfile setfiletype ruby
au BufRead,BufNewFile *.thor setfiletype ruby
au BufRead,BufNewFile *.hiccup setfiletype clojure

let g:sql_type_default = 'postgresql'

" ignore these files and directories in listings
set wildignore+=tags,*/tmp/*,*/coverage/*

" Ag (the_silver_searcher) settings
let g:ag_prg="ag --column --hidden"

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

