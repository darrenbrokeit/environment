colorscheme slate

filetype on
filetype plugin on
filetype indent on

syntax on

set title

set nocompatible
set cursorline

" seach settings
set showmatch
set hlsearch
set history=1000

" line number settings - hybrid numbers when scrolling, absolute when editing
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
