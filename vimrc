" http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
" https://javascriptplayground.com/blog/2017/01/vim-for-javascript/
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" http://marcgg.com/blog/2016/03/01/vimrc-example/

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'crusoexia/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'wincent/command-t'
Plug 'tpope/vim-fugitive'
Plug 'chr4/nginx.vim'

" Python
Plug 'nvie/vim-flake8'
" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'

Plug 'mustache/vim-mustache-handlebars'

" Initialize plugin system
call plug#end()

set encoding=utf-8

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

filetype plugin indent on
if !exists("g:syntax_on")
    syntax enable
endif

" Highlight searches
set hlsearch

colorscheme monokai
" colorscheme base16-default-dark
" colors zenburn
" set background=dark
" colorscheme solarized

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

" Python
autocmd BufNewFile,BufRead *.py,*.hbs
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd BufNewFile,BufRead *.js,*.html,*.css,*.jinja,*.jinja2
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set shiftwidth=2

" Javascript
let g:jsx_ext_required = 0

