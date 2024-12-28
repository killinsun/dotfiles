" tabstop nums
set tabstop=2
set softtabstop=2
" Number of (>>/<<)indent
set expandtab
set shiftwidth=2
" Auto indent
set autoindent


" Show cursor
set number
set ruler

" Default file encoding
set fileencoding=utf-8
" set fileencodings=sjis,utf-8,iso-2022-jp,euc-jp

" backspace setting
set backspace=indent,eol,start

set nocp
" Hilights of match texts when search
set showmatch
set hlsearch

" When change insertmode, turn off IME
set iminsert=0
set imsearch=0

:set list
:set listchars=tab:>-,extends:<,trail:-,eol:<

set wildmenu
set history=5000

" Enable linking clipboard
set clipboard+=unnamed


" Disable color schema background
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" Show infomation of last using.
colorscheme molokai
" set t_Co=256

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
set breakindent


"------------------------------------------------------
" for :SyntaxInfo command
"------------------------------------------------------
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()


