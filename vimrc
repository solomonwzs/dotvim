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

" Encrypt
set cm=blowfish2
set viminfo=
set nobackup
set nowritebackup

" Setting for ocamlmerlin (ocaml)
set rtp+=/usr/share/ocamlmerlin/vim

" Setting for cabal (haskell)
let $PATH=$PATH.':'.expand("$HOME/.cabal/bin")


" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set t_Co=256

colorscheme candy

let mapleader="\\"
let maplocalleader=","

map <leader>h :help <C-R>=expand("<cword>")<CR><CR>
vmap <C-c> "+y

syntax enable

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
filetype plugin indent on

set modeline

set mouse=a

set number
set ruler

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

set foldmethod=indent
set nofoldenable
set foldlevel=1

set noea

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"

autocmd Filetype c setlocal omnifunc=ccomplete#Complete
autocmd Filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype python setlocal omnifunc=pythoncomplete#CompleteTags
autocmd FileType python setlocal completeopt-=preview
autocmd Filetype tex setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
if executable('ghc-mod')
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
endif

let g:html_indent_inctags="li,body,head"
autocmd FileType html,xml,yaml setlocal sw=2 tabstop=2 softtabstop=2

set cursorline
highlight clear CursorLine
highlight LineNR ctermfg=242
highlight CursorLineNR cterm=bold ctermfg=255
highlight CursorLine ctermbg=237
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

highlight DiffAdd ctermbg=24
highlight DiffDelete ctermbg=81
highlight DiffChange ctermbg=53
highlight DiffText ctermbg=243

highlight SignatureMarkLine ctermbg=96
highlight SignatureMarkText cterm=bold ctermbg=96
highlight SignatureMarkerLine ctermbg=95
highlight SignatureMarkerText cterm=bold ctermbg=95


" Setting for javacompile
" autocmd Filetype java setlocal omnifunc=javacomplete#Complete
" autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo


" Setting for search
set hlsearch
set magic


" Setting for auto reload file
set autoread


" Setting for row control
set linebreak
set wrap


" Setting for miniBufExplorer
" let g:miniBufExplMapCTabSwitchBufs=1


" Settings for taglist
" let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=0
" let Tlist_Enable_Fold_Column=0
" let Tlist_Compact_Format=0
" let Tlist_WinWidth=28
" let Tlist_Exit_OnlyWindow=1
" let Tlist_File_Fold_Auto_Close=1


" Settings for tagbar
let g:tagbar_phpctags_bin='$HOME/.vim/bundle/phpctags/phpctags'
let g:tagbar_type_javascript={
            \   'ctagsbin': 'jsctags'
            \}
let g:tagbar_type_mkd = {
            \   'ctagstype': 'markdown',
            \   'kinds': [
            \       'h:headings'
            \   ],
            \   'sort': 0
            \}


" Setting for clang-complete
let g:clang_use_library=1


" Setting for powerline
" let g:Powerline_symbols='compatible'


" Setting for thrift
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source /usr/share/vim/vimfiles/syntax/thrift.vim


" Setting for vim-erlang-tags
set runtimepath^=$HOME/.vim/bundle/vim-erlang-tags


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
nmap <C-@>u :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.cc' > cscope.files<CR>
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
" let g:syntastic_python_checkers=['pylint']
let g:syntastic_ignore_files=['\.py$']
let g:syntastic_ocaml_checkers=['merlin']
let g:syntastic_go_checkers = ['go']
" let g:syntastic_rust_checkers = ['rustc']

function s:syntastic_check_toggle()
    if !exists("b:syntastic_skip_checks")
        let b:syntastic_skip_checks=1
    else
        let b:syntastic_skip_checks=!b:syntastic_skip_checks
    endif
endfunction

command! -nargs=0 SyntasticCheckToggle call s:syntastic_check_toggle()


" Mapping
inoremap <expr><CR> pumvisible()?"\<C-Y>":"\<CR>"


" Restore cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" Setting for python-mode
" let g:pymode=0
let g:pymode_python="python3"
let g:pymode_options_colorcolumn=0

let g:pymode_run=1
let g:pymode_run_key='<leader>r'

let g:pymode_lint=1
let g:pymode_lint_unmodified=1
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_lint_todo_symbol='!'
let g:pymode_lint_error_symbol='X'
let g:pymode_lint_cwindow=0

let g:pymode_indent=1
let g:pymode_folding=0

let g:pymode_doc=1
let g:pymode_doc_key='<leader>K'


" Setting for w3m
highlight! link w3mLink      Function
highlight! link w3mLinkHover SpecialKey
highlight! link w3mSubmit    Special
highlight! link w3mInput     String
highlight! link w3mBold      Comment
highlight! link w3mUnderline Underlined
highlight! link w3mHitAHint  Question
highlight! link w3mAnchor    Label
let g:w3m#disable_default_keymap=0
let g:w3m#search_engine='%s'


" Setting for ctrlp
" set wildignore+=*/tmp/*,*.so,*.swp
let g:ctrlp_custom_ignore={
            \   'dir'  : '\v[\/]\.(git|hg|svn)$',
            \   'file' : '\v\.(so|swp|zip|class|beam|tar|gz|o|pyc)$'
            \}
let g:ctrlp_switch_buffer='e'
let g:ctrlp_regexp=1
let g:ctrlp_reuse_window='netrw\|help\|quickfix'
"let g:ctrlp_user_command={
"            \ 'types'   : {
"            \ 1 : ['.git', 'cd %s && git ls-files'],
"            \ 2 : ['.hg', 'hg --cwd %s locate -I .']
"            \ },
"            \ 'fallback': 'find %s -type f'}
" let g:ctrlp_open_new_file='h'
let g:ctrlp_working_path_mode='rw'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


" Setting for unite
nmap <C-u>p :Unite -start-insert -auto-resize file file_rec/async<CR>
nmap <C-u>g :Unite grep:.<CR>
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif


" Setting for git-gutter
highlight GitGutterAdd ctermbg=black ctermfg=green
highlight GitGutterChange ctermbg=black ctermfg=yellow
highlight GitGutterDelete ctermbg=black ctermfg=red
highlight GitGutterChangeDelete ctermbg=black ctermfg=red


" Setting for vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
" let g:airline_theme="bubblegum"

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    let a:palette.inactive.airline_x[2]=232
    let a:palette.inactive.airline_x[3]=238

    let a:palette.inactive.airline_y[2]=232
    let a:palette.inactive.airline_y[3]=236

    let a:palette.inactive.airline_z[2]=240
    let a:palette.inactive.airline_z[3]=234

    " let a:palette.inactive.airline_a[2]=100

    " let a:palette.inactive.airline_b[2]=244

    let a:palette.inactive.airline_c[2]=232
    let a:palette.inactive.airline_c[3]=241
endfunction


" Setting for tmuxline
" let g:tmuxline_preset={
"             \'a'    : '#S',
"             \'b'    : '#W',
"             \'win'  : '#I #W',
"             \'cwin' : '#I #W #F',
"             \'x'    : '#(uptime | cut -d, -f2,3,4,5)',
"             \'y'    : '%F %R %a',
"             \'z'    : '#(whoami)@#H'}


" Setting for vim-slime
let g:slime_target='tmux'
let g:slime_paste_file='/tmp/.slime_paste'
let g:slime_default_config={'socket_name': 'default', 'target_pane': '1'}


" Setting for vim-go
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

let g:go_fmt_command = "goimports"

let $GOPATH .= ":".getcwd()


" Setting for vim-lua-ftplugin
let g:lua_complete_omni=1


" Setting for vim-commentary
autocmd FileType nginx setlocal commentstring=#\ %s


" Setting for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" Setting for rust
let g:rustfmt_autosave = 1

" ~/.ctags
" --langdef=Rust
" --langmap=Rust:.rs
" --regex-Rust=/^[ \t]*(#\[[^\]]\][ \t]*)*(pub[ \t]+)?(extern[ \t]+)?("[^"]+"[ \t]+)?(unsafe[ \t]+)?fn[ \t]+([a-zA-Z0-9_]+)/\6/f,functions,function definitions/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?type[ \t]+([a-zA-Z0-9_]+)/\2/T,types,type definitions/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?enum[ \t]+([a-zA-Z0-9_]+)/\2/g,enum,enumeration names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?struct[ \t]+([a-zA-Z0-9_]+)/\2/s,structure names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?mod[ \t]+([a-zA-Z0-9_]+)/\2/m,modules,module names/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(static|const)[ \t]+(mut[ \t]+)?([a-zA-Z0-9_]+)/\4/c,consts,static constants/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(unsafe[ \t]+)?trait[ \t]+([a-zA-Z0-9_]+)/\3/t,traits,traits/
" --regex-Rust=/^[ \t]*(pub[ \t]+)?(unsafe[ \t]+)?impl([ \t\n]*<[^>]*>)?[ \t]+(([a-zA-Z0-9_:]+)[ \t]*(<[^>]*>)?[ \t]+(for)[ \t]+)?([a-zA-Z0-9_]+)/\5 \7 \8/i,impls,trait implementations/
" --regex-Rust=/^[ \t]*macro_rules![ \t]+([a-zA-Z0-9_]+)/\1/d,macros,macro definitions/
let g:tagbar_type_rust = {
            \   'ctagstype' : 'rust',
            \   'kinds' : [
            \       'T:types,type definitions',
            \       'f:functions,function definitions',
            \       'g:enum,enumeration names',
            \       's:structure names',
            \       'm:modules,module names',
            \       'c:consts,static constants',
            \       't:traits',
            \       'i:impls,trait implementations',
            \   ]
            \}


" Setting for ycm
let g:ycm_server_python_interpreter = "python2"
let g:ycm_global_ycm_extra_conf = "/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_list_stop_completion = ['<CR>']
