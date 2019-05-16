execute pathogen#infect()

"" Set the colorscheme
colorscheme nord
set background=dark

"" base setup (read: can't figure out where else to place these)
set nocompatible
syntax on
set encoding=utf-8
set number
set showcmd
filetype plugin indent on
set colorcolumn=80

"" change cursor
"" normal: block
"" insert: bar
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"" C++ projects should have doxygen
augroup cpp
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp.doxygen
augroup END

"" syntastic settings
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["cpp"] }
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

"" support for new filetypes
au BufRead,BufNewFile *.md set filetype=markdown

"" global whitespace
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start

"" filetype specific whitespace
autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab tw=80
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype cpp.doxygen setlocal noexpandtab tabstop=2 softtabstop=0

"" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Powerline settings
let g:airline_powerline_fonts = 1

"" disable cursor keys in normal mode
map <Left>  :echo "No!"<cr>
map <Right> :echo "No!"<cr>
map <Up>    :echo "No!"<cr>
map <Down>  :echo "No!"<cr>

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
