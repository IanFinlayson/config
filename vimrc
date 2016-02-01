" .vimrc

set number
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set background=dark
syntax on
colorscheme ians

" tab options
set ts=4
set sw=4
set expandtab
set cindent

" search incrementally
set incsearch

" make vim highlight words
set hlsearch

" change leader
let mapleader=" "

" normal mode key mapping (toggle line numbers)
nmap <Leader>n :set number!<CR>


" space-s toggles spell check
nmap <Leader>s :set spell!<CR>

" space-p toggles copy/paste mode
nmap <Leader>p :set paste!<CR>:set number!<CR>

" space-f reformats the file and returns back
nmap <Leader>f magg=G`a

" bring up the command history window on colon colon
nnoremap :: q:

" make history size bigger
set history=1000

" abbreviations
ab tumw The University of Mary Washington


