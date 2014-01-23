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

" use a better shell
set shell=/bin/zsh

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

" space-m saves and runs make on the command line
nnoremap <Leader>m :w<CR>:!make<CR>

" space-s toggles spell check
map <Leader>s :set spell!<CR>

" space-p toggles copy/paste mode
map <Leader>p :set paste!<CR>:set number!<CR>

" abbreviations
ab tumw The University of Mary Washington
ab iff Ian Finlayson

" c++ template
ab cppt <ESC>:set paste<CR>i#include <iostream><CR>using namespace std;<CR><CR>int main( ) {<CR>   !cursor!<CR><CR><CR>    return 0;<CR>}<CR><ESC>:set nopaste<CR>:call search('!cursor!', 'b')<CR>cf!

" java template
ab javat <ESC>:set paste<CR>ipublic class <C-R>=expand("%:t:r")<CR> {<CR>    public static void main(String args[]) {<CR>       !cursor!<CR><CR><CR>    }<CR>}<CR><ESC>:set nopaste<CR>:call search('!cursor!', 'b')<CR>cf!

" LaTeX niceties
ab tlist \begin{itemize}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{itemize}<ESC>:call search('!cursor!', 'b')<CR>cf!
ab tenum \begin{enumerate}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{enumerate}<ESC>:call search('!cursor!', 'b')<CR>cf!
ab tslide \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>:call search('!cursor!', 'b')<CR>cf!
ab tframe \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>:call search('!cursor!', 'b')<CR>cf!
ab tblock \begin{block}{!cursor!}<CR>\end{block}<ESC>:call search('!cursor!', 'b')<CR>cf!

" HTML
ab hul <ul><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ul><CR><ESC>:call search('!cursor!', 'b')<CR>cf!
ab hol <ol><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ol><CR><ESC>:call search('!cursor!', 'b')<CR>cf!
ab hsec <hr /><CR><h3>!cursor!</h3><CR><CR><CR><ESC>:call search('!cursor!', 'b')<CR>cf!
ab hdlist <ul><CR><li><p><b>!cursor!</b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li></ul><CR><ESC>:call search('!cursor!', 'b')<CR>cf!

" syntax files
au BufRead,BufNewFile *.go set filetype=go

" use wrapping and spell check on text files
au BufRead,BufNewFile *.txt set textwidth=80 spell

" use spell check on HTML and LaTeX
au BufRead,BufNewFile *.html set spell
au BufRead,BufNewFile *.tex set spell

" make vim jump to last position in file
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
 \| exe "normal! g'\"" | endif
endif

" are these needed?
"let g:syntastic_html_checkers=[]
"let g:syntastic_tex_checkers=[]

" let matchit know the filetype
filetype plugin on

" setup pathogen bundler
call pathogen#infect()
