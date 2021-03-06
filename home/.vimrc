" Globally applicable settings should be applied here, as well as anything else
" that needs to be loaded before the config files get executed.
let loaded_spellfile_plugin = 1

" don't try to play nice with vi
set nocompatible

" allow buffers to be hidden when they're not
set hidden

" save the last 100 commands/search terms
set history=100

" use ; for <Leader>
let mapleader = ";"    

"" shortmess settings:
" f - use "(3 of 5)" instead of "(file 3 of 5)"
" i - use "[noeol]" instead of "[Incomplete last line]"
" l - use "999L, 888C" instead of "999 lines, 888 characters"
" m - use "[+]" instead of "[Modified]"
" n - use "[New]" instead of "[New File]"
" r - use "[RO]" instead of "[readonly]"
" x - use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix
" format]", and "[mac]" instead of "[mac format]"
" t - truncate file message at the start if it is too long to fit on the
" command-line, "<" will appear in the left most column.
" T - trunctate other messages in the middle if they are too long to fit on
" the command line. "..." will appear in the middle.
" I - don't give the intro message when starting Vim.
set shortmess=atfilmnrxtTI

" turn filetype settings off so that stuff gets loaded from pathogen
filetype off

let xml_tag_completion_map = "<C-l>"
" use pathogen to load plugins/etc.
"call pathogen#runtime_append_all_bundles()
"call pathogen#infect()


" turn on all filetype settings, syntax, etc.
filetype plugin indent on
syntax on

if has('gui_running')
  "    set guioptions-=T   " Get rid of toolbar "
  "  set guioptions-=m   " Get rid of menu    "
endif

" load everything else in its own config file
runtime! config/**/*


let g:syntastic_disabled_filetypes = ['perl', 'html', 'ruby']
set wildmode=longest,list:longest,list:full
set wildignore+=*.o,*.obj,.git,.svn,*.gif,*.pdf,*.jpg,*.png


" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

set nofoldenable 

autocmd BufRead,BufNewFile *.txt   setfiletype text
autocmd FileType text setlocal spell spelllang=en
