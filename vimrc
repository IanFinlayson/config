" .vimrc
" Ian Finlayson's .vimrc

" run a command on all mutt files to remove
augroup autocom
    autocmd!
    " executes my command on quit
     autocmd VimLeave /tmp/mutt-* !/home/finlayson/bin/email-process %
augroup END

" used for removing trailing space from abbreviations
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" used to see what syntax type the thing under the cursor is
" this is handy for seeing how I want to change my highlights
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" prettify
set number
set cursorline
set background=dark
syntax on
colorscheme ians

" don't worry about old vi cruft
set nocompatible

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" use vundle itself
Plugin 'gmarik/Vundle.vim'

" syntastic checker
Plugin 'scrooloose/syntastic'

" supertab
Plugin 'ervandew/supertab'

" Racket support
Plugin 'wlangstroth/vim-racket'

" finish with the plugins
call vundle#end()
filetype plugin indent on

" tab options
set ts=4
set sw=4
set expandtab
set cindent

" make Vim remember more lines in registers
set viminfo='20,<1000

" this one makes indentation of switch cases less intense?
set cinoptions=l1

" make vim not expand tabs for Makefiles
autocmd FileType make set noexpandtab

" search incrementally
set incsearch

" make vim highlight words
set hlsearch

" make enter clear the past search
nnoremap <CR> :noh<CR><CR>

" use space bar as the leader
let mapleader=" "

" always increment/decrement in decima (07 -> 08) instead of (07 -> 10)
set nrformats=

" space-m saves and runs make on the command line
nmap <Leader>m :w<CR>:make<CR>

" space-s toggles spell check
nmap <Leader>s :set spell!<CR>

" space-p toggles copy/paste mode
nmap <Leader>p :set paste!<CR>:set number!<CR>

"  corrects a word
map qw z=1<CR><CR>

" make history size bigger
set history=1000

" abbreviations
ab tumw The University of Mary Washington
ab iff Ian Finlayson

" easier window switching
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-n> <C-W>w

" c++ template
ab cppt <ESC>:set paste<CR>i#include <iostream><CR>using namespace std;<CR><CR>int main( ) {<CR> !cursor!<CR><CR><CR>  return 0;<CR>}<CR><ESC>:set nopaste<CR>?!cursor!<CR>cf!

" java template
ab javat <ESC>:set paste<CR>ipublic class <C-R>=expand("%:t:r")<CR> {<CR>    public static void main(String args[]) {<CR>       !cursor!<CR><CR><CR>    }<CR>}<CR><ESC>:set nopaste<CR>?!cursor!<CR>cf!

" LaTeX niceties
ab titems \begin{itemize}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{itemize}<ESC>?!cursor!<CR>cf!
ab tenum \begin{enumerate}<CR>\item!cursor!<CR>\item <CR>\item <CR>\end{enumerate}<ESC>?!cursor!<CR>cf!
ab tslide \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab tframe \begin{frame}{!cursor!}\begin{center}<CR><CR>\end{center}\end{frame}<ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab tblock \begin{block}{!cursor!}<CR>\end{block}<ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab tverb \begin{verbatim}<CR>!cursor!<CR>\end{verbatim}<ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>

" HTML
ab hul <ul><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ul><CR><ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab hol <ol><CR><li>!cursor!</li><CR><li></li><CR><li></li><CR></ol><CR><ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab hsec <hr /><CR><h3>!cursor!</h3><CR><CR><CR><ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>
ab hdlist <ul><CR><li><p><b>!cursor!</b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li><CR><li><p><b></b></p><p><CR><CR><CR></p></li></ul><CR><ESC>?!cursor!<CR>cf!<C-R>=Eatchar('\s')<CR>

" syntax files
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.rkt,*.rktl  set filetype=racket
au BufRead,BufNewFile *.ttr set filetype=tetra

" use wrapping and spell check on text files
au BufRead,BufNewFile *.txt set textwidth=80 spell noai nocindent

" use spell check on HTML, mark down, and LaTeX
au BufRead,BufNewFile *.html set spell noai nocindent inde=
au BufRead,BufNewFile *.html NoMatchParen
au BufRead,BufNewFile *.tex set spell noai nocindent
au BufRead,BufNewFile *.md set textwidth=80 spell noai nocindent

" don't use C indenting for Python, it's awful
au BufRead,BufNewFile *.py set autoindent nocindent

" make vim jump to last position in file
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
 \| exe "normal! g'\"" | endif
endif

" disable syntastic for Latex
let g:syntastic_tex_checkers=[]
let g:syntastic_enable_racket_racket_checker=1

" start centered on screen
autocmd VimEnter * :normal zz

