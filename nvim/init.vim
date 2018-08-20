" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Project/Navigation

" fzf installed via Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Initialize plugin system
call plug#end()
