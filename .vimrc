" vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'

call plug#end()

"""" General stuff
set nocompatible
set encoding=utf8
" Make backspace behavior normal
set backspace=indent,eol,start
" Syntax highlighting
syntax on
" file type detection -> sensible intending
filetype plugin indent on
" Relative line numbers
set number
" swp file dir
set directory^=$HOME/.vim/tmp//

" current line highlighted
"set cursorline

" autocomplete menu
" set wildmenu

" show matching parens 
set showmatch

"""" Search
" Search as you type
set incsearch
" Highlight search matches
set hlsearch

"""" Spaces
" Use spaces for tabs
set expandtab
" Number of spaces shown for a real tab
set tabstop=4
" Number of spaces inserted when tabbing in insert mode
set softtabstop=4

"""" Status line
" always show statusline
set laststatus=2
" Display last command in bottom bar
set showcmd

"""" Color
