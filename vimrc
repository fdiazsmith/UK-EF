set fileformat=mac
"Fer's vims set up
"Highlight the words as you are typing them
set incsearch
"Match case when you search for it, and don't when it's all lower case
set ignorecase
set smartcase
"Never place the cursor on the first line of last one
set scrolloff=3
"Display line numbers
set number
"Control gutter
set numberwidth=3
" Enable syntax highlighting
syntax enable

" ... and a bunch of other things
set nocompatible
set sh=/bin/bash
set backupdir=~/.vim_backup//
set directory=~/.vim_swp//
set ruler
set number
set expandtab
set laststatus=2
set incsearch
set autoindent
set showcmd
set tabstop=2
set shiftwidth=2
set numberwidth=5
"set textwidth=80
set tags=./tags;
set guioptions-=T
set guioptions-=r
set foldenable
set foldmethod=manual
set mouse=a
set colorcolumn=80
set backspace=indent,eol,start
set nowrap
set cursorline

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t
