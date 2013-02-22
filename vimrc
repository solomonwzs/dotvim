" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" let mapleader=","

syntax enable

set sw=4
set ts=4
set expandtab
set smarttab
set autoindent
filetype indent on

set modeline

set hlsearch
set nu

colorscheme evening
highlight Directory cterm=bold ctermfg=4
highlight Comment cterm=bold ctermfg=4
highlight PmenuSel cterm=bold ctermbg=4 ctermfg=7
highlight LineNr cterm=reverse,bold ctermbg=0 ctermfg=7

"set nocp
"filetype plugin indent on

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

autocmd Filetype c      set omnifunc=ccomplete#Complete
autocmd Filetype html   set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml    set omnifunc=xmlcomplete#CompleteTags
autocmd Filetype python set omnifunc=pythoncomplete#CompleteTags
autocmd Filetype tex    set omnifunc=syntaxcomplete#Complete

let g:miniBufExplMapCTabSwitchBufs=1

" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
