execute pathogen#infect()

"" Set the colorscheme
colorscheme solarized
set background=dark

"" base setup (read: can't figure out where else to place these)
set nocompatible
syntax on
set encoding=utf-8
set number
set showcmd
filetype plugin indent on
set colorcolumn=80

"" Cygwin and Vim fix to use a block cursor
if has("win32unix") || has("win32") || has("win16")
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif

"" syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

"" support for new filetypes
au BufRead,BufNewFile *.md set filetype=markdown

"" global whitespace
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start

"" filetype specific whitespace
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype php setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab tw=80
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype less setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype htmldjango.twig setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Powerline settings
let g:airline_powerline_fonts = 1

"" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

"" TaskList options
let g:tlTokenList = ['TODO', '@todo']

"" Add modeline support in the first two lines
set modelines=2

"" Indent guides
let g:indent_guides_auto_colors = 0
au FileType yaml autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=10
au FileType yaml autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=11

"" Disable background color erase
if &term =~ '256color'
    set t_ut=
endif
