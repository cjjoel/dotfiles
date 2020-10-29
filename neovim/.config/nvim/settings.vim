set number
set hidden
set nowrap
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set mouse=a
set clipboard=unnamedplus
" Remember last cursor position in file
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" coc
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" vim-polyglot
set nocompatible

" theme
syntax on
colorscheme onedark
