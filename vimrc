"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath^=/Users/fdiazsmith/vim/bundle/repos/github.com/Shougo/dein.vim

  " Required:
  call dein#begin(expand('/Users/fdiazsmith/vim/bundle/'))

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()

  " Required:
  filetype plugin indent on

  " If you want to install not installed plugins on startup.
  "if dein#check_install()
  "  call dein#install()
  "endif

  "End dein Scripts-------------------------







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
