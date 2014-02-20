" Ian Finlayson's .vimrc

" prettify
set number
set cursorline
set background=dark
colorscheme solarized
syntax on

" don't worry about old vi cruft
set nocompatible

" tab options
set ts=4
set sw=4
set expandtab
set cindent

" make vim not expand tabs for Makefiles
autocmd FileType make set noexpandtab

" search incrementally
set incsearch

" make vim highlight words
set hlsearch

" make enter clear the past search
nnoremap <CR> :noh<CR><CR>

" make up and down go by visual lines by default
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" use space bar as the leader
let mapleader=" "

" always increment/decrement in decima (07 -> 08) instead of (07 -> 10)
set nrformats=

" space-m saves and runs make on the command line
nnoremap <Leader>m :w<CR>:make<CR>

" space-s toggles spell check
map <Leader>s :set spell!<CR>

" space-p toggles copy/paste mode
map <Leader>p :set paste!<CR>:set number!<CR>

" abbreviations
ab tumw The University of Mary Washington
ab iff Ian Finlayson

" c++ template
ab cppt <ESC>:set paste<CR>i#include <iostream><CR>using namespace std;<CR><CR>int main( ) {<CR>   !cursor!<CR><CR><CR>    return 0;<CR>}<CR><ESC>:set nopaste<CR>?!cursor!<CR>cf!

" java template
ab javat <ESC>:set paste<CR>ipublic class <C-R>=expand("%:t:r")<CR> {<CR>    public static void main(String args[]) {<CR>       !cursor!<CR><CR><CR>    }<CR>}<CR><ESC>:set nopaste<CR>?!cursor!<CR>cf!

" LaTeX niceties
ab tlist \begin{itemize}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{itemize}<ESC>?!cursor!<CR>cf!
ab tenum \begin{enumerate}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{enumerate}<ESC>?!cursor!<CR>cf!
ab tslide \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>?!cursor!<CR>cf!
ab tframe \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>?!cursor!<CR>cf!
ab tblock \begin{block}{!cursor!}<CR>\end{block}<ESC>?!cursor!<CR>cf!

" HTML
ab hul <ul><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ul><CR><ESC>?!cursor!<CR>cf!
ab hol <ol><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ol><CR><ESC>?!cursor!<CR>cf!
ab hsec <hr /><CR><h3>!cursor!</h3><CR><CR><CR><ESC>?!cursor!<CR>cf!
ab hdlist <ul><CR><li><p><b>!cursor!</b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li></ul><CR><ESC>?!cursor!<CR>cf!

" syntax files
au BufRead,BufNewFile *.go set filetype=go

" use wrapping and spell check on text files
au BufRead,BufNewFile *.txt set textwidth=80 spell noai nocindent

" use spell check on HTML and LaTeX
au BufRead,BufNewFile *.html set spell noai nocindent
au BufRead,BufNewFile *.tex set spell noai nocindent

" make vim jump to last position in file
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
 \| exe "normal! g'\"" | endif
endif

" let matchit know the filetype
filetype plugin on

" setup pathogen bundler
call pathogen#infect()

