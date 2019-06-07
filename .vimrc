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


"------------------------------------------------------
" dein vim settings
"------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  "----------------------------------------------------
  " Plugins
  "----------------------------------------------------
  " Add or remove your plugins here like this:
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('scrooloose/syntastic')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Yggdroot/indentLine')
  "----------------------------------------------------

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" indentLine
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = ''
" Enable indentLine 
:set list listchars=tab:\¦\ 


" Enable deoplete.vim
let g:deoplete#enable_at_atartup = 1

