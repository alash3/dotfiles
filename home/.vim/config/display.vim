"""""""""""""""""""""""""""""""""""""""""""""""""""
"" loads display-related option (colorscheme, etc.)
"""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256
" use the desert256 colorscheme (works better with console than zenburn)
" colorscheme desert256
" colorscheme desert
" let g:zenburn_high_Contrast = 1
colorscheme zenburn


set laststatus=2   " always display a status line
set number         " show line numbers
set ruler          " display coordinates in status bar
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set showmode       " display the current mode in the status bar
set title          " show file in titlebar

" status bar
set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=(%l,%c%V)\ %<%P                               " offset
