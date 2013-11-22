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

let mapleader=","
let g:mapleader=","

syntax enable

set sw=4
set ts=4
set expandtab
set smarttab
set autoindent
filetype indent on

set modeline

set number
set ruler

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

set foldmethod=indent
set nofoldenable
set foldlevel=1

colorscheme elflord

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

autocmd Filetype c setlocal omnifunc=ccomplete#Complete
autocmd Filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype python setlocal omnifunc=pythoncomplete#CompleteTags
autocmd Filetype tex setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" Setting for javacompile
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" Setting for search
set hlsearch
set magic

" Auto reload file
set autoread

" Setting for row control
set linebreak
set wrap

" Setting for miniBufExplorer
let g:miniBufExplMapCTabSwitchBufs=1

" Settings for taglist
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1

" Settings for tagbar
let g:tagbar_phpctags_bin='/home/solomon/.vim/bundle/phpctags/phpctags'
let g:tagbar_type_javascript = {
            \ 'ctagsbin' : 'jsctags'
            \ }

" Setting for clang-complete
let g:clang_use_library=1

" Setting for powerline
let g:Powerline_symbols='compatible'
set t_Co=256

" Setting for thrift
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source /usr/share/vim/vimfiles/syntax/thrift.vim

" Setting for vim-erlang-tags
set runtimepath^=/home/solomon/.vim/bundle/vim-erlang-tags

" Setting for cscope setting
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " Add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>u :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
            \:!cscope -bq -i cscope.files -f cscope.out<CR>
            \:cs reset<CR>
nmap <C-@>S :scs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>G :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>C :scs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>T :scs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>E :scs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>F :scs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>I :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>D :scs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

set cscopequickfix=s-,d-,c-,t-,e-,f-,i-

" Setting for vim-markdown
let g:vim_markdown_folding_disabled=1

" Setting for syntastic
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_python_checkers=['flake8']

" Mapping
inoremap <expr><CR> pumvisible()?"\<C-Y>":"\<CR>"

" Restore cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
