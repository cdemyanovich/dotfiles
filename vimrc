" References
" http://dougblack.io/words/a-good-vimrc.html

call pathogen#infect()
call pathogen#helptags()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set ruler
set showcmd                     " display incomplete commands
set autowrite                   " Automatically :write before running commands
set laststatus=2                " always show status line

filetype plugin indent on       " load file type plugins + indentation

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

" use comma as <Leader> key instead of backslash
let mapleader=","

" custom filetype mappings
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile Capfile setfiletype ruby
au BufRead,BufNewFile *.hiccup setfiletype clojure

let g:sql_type_default = 'postgresql'

" ignore these files and directories in listings
set wildignore+=tags,*/tmp/*,*/coverage/*

" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

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

" Fix slow scrolling when cursorline is enabled
" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

set list
set listchars=tab:▸\ ,eol:¬,trail:-

" Automatically hide altered buffers when navigating away from them
set hidden

" provide some context when editing
set scrolloff=3

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

