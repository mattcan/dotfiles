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
autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab tw=80
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

"" NERDTree settings
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
silent! map <F3> :NERDTreeFind<CR>

"" CtrlP settings
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

"" Disable background color erase
if &term =~ '256color'
    set t_ut=
endif
