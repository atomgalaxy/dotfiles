"vimrc for atom
""
" GENERAL 
""

set nocompatible

"pathogen
call pathogen#infect()

filetype on
set history=1000
set cf " error files and error jumping
"set clipboard+=unnamed
"set ffs=unix
set viminfo+=!
filetype plugin on
filetype indent on
syntax on
set modeline
""
" FORMATTING
""
set encoding=utf-8
set formatoptions=tcrn
set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
""
" USER INTERFACE
""
map - <c-w>w
set number
set mouse=a
set showmatch  " show matching brackets
set mat=5      " blink matching brackets for half a second
set nohlsearch " do not highlight searchstrings
set incsearch  " do incremental searching
set so=10      " always see 10 lines up/down
set wildmenu
set backspace=2 " allow backspace over everything

"set foldminlines=60
set foldlevel=3
set foldmethod=marker

set completeopt=menuone,preview

set autowrite

set colorcolumn=+1

""
" CTags
""
"set tags+=../tags,../../tags,../../../tags
function! XhtmlSettings()
    set tabstop=2
    set shiftwidth=2
    set textwidth=0
endfunction

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd FileType * set formatoptions+=t
    autocmd FocusLost * :wa

    autocmd BufEnter *.hs compiler ghc
    autocmd BufEnter *.vert set filetype=glsl
    autocmd BufEnter *.frag set filetype=glsl
    autocmd BufNewFile,BufRead SCons* set filetype=python

    autocmd BufWritePost cpp call g:ClangUpdateQuickFix()
    autocmd BufWritePost c call g:ClangUpdateQuickFix()

"    autocmd FileType cpp map <F11> :call GenTags()<CR>
"    autocmd FileType cpp imap <F11> <C-O><F11>
"    autocmd FileType cpp setlocal tags+=~/.vim/tags/stl.tags
"    autocmd FileType cpp call GenTags()
    autocmd FileType cpp map <F10> :call g:ClangUpdateQuickFix()<CR>
    autocmd FileType cpp map <F7> :TlistToggle<CR>
    autocmd FileTYpe cpp iab $$$ \f$

"    autocmd FileType c   map <F11> :call GenTags()<CR>
"    autocmd FileType c   imap <F11> <C-O><F11>
"    autocmd FileType c   call GenTags()
    autocmd FileType c   map <F10> :call g:ClangUpdateQuickFix()<CR>
    autocmd FileType c   map <F7> :TlistToggle<CR>

    autocmd FileType xhtml set tabstop=2
    autocmd FileType xhtml set shiftwidth=2
    autocmd FileType xhtml set textwidth=0

    autocmd FileType html set tabstop=2
    autocmd FileType html set shiftwidth=2
    autocmd FileType html set textwidth=0

    autocmd FileType xml set tabstop=2
    autocmd FileType xml set shiftwidth=2
    autocmd FileType xml set textwidth=0

    autocmd FileType php set makeprg=php\ -l\ %
    autocmd FileType php set comments=s1:/*,mb:*,ex:*/,://,:#
    autocmd FileType php set indentexpr=GetPhpIndent()

    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    autocmd FileType python set textwidth=80
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType pi set filetype=python

    autocmd FileType haskell set sw=2
    autocmd FileType haskell set ts=2

    autocmd FileType CMake* set commentstring=#%s

    autocmd FileType qf call QuickfixHeight#AdjustWindowHeight(3, 7)
endif 

" 
" syntax highlighting stuff
" 


" c stuff
let c_comment_strings=1
let c_space_errors=1

" csupport stuff
let g:C_FormatDate = "%F"
let g:C_TemplateOverwrittenMsg = 'no'

" doxygen stuff
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1

" php stuff
let g:syntax_extra_php='doxygen'
let php_sql_query=1
let php_htmlInStrings=1
let php_parent_error_close=1
let php_parent_error_open=1
let php_folding=0

"enhanced commentify script settings.
let g:EnhCommentifyUseSyntax='Yes'
let g:EnhCommentifyTraditionalMode='No'
let g:EnhCommentifyFirstLineMode='Yes'

let g:SuperTabDefaultCompletionType = "context"

function EnhCommentifyCallback(ft)
    if a:ft == 'd'
        let b:ECcommentOpen  = '//'
        let b:ECcommentClose = ''
    elseif a:ft == 'cmake'
        let b:ECcommentOpen  = '#'
        let b:ECcommentClose = ''
    endif
endfunction
let g:EnhCommentifyCallbackExists = 'Yes'

" python hightlighting
let python_highlight_all=1

" haskell prefs
let g:haddock_browser='links'
let g:haddock_docdir="/usr/share/doc/ghc/libraries/"

" take care of the normal terminal
if &term != 'linux'
    set t_Co=256
    colorscheme inkpot
"    colorscheme neverland-darker
endif

" latex-suite stuff
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='okular'

" git-vim stuff
set laststatus=2
set statusline=%n:%f\ %(%m%r%h%w%y%)\ %(\ %{fugitive#statusline()}%)[%l/%L=%p%%]\ [%c%V]


" clang_complete stuff
let g:clang_auto_select=1
let g:clang_complete_copen=1
let g:clang_complete_auto=0
let g:clang_periodic_quickfix=0
let g:clang_hl_errors=1
let g:clang_use_library=1
if isdirectory("/opt/local/libexec/llvm-3.2/lib/")
    let g:clang_library_path="/opt/local/libexec/llvm-3.2/lib/"
else
    let g:clang_library_path="/usr/lib/llvm/"
endif
let g:clang_snippets_engine = 'clang_complete'
let g:clang_snippets = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let	g:clang_conceal_snippets = 1
let g:clang_close_preview = 1
let g:clang_trailing_placeholder = 1
set conceallevel=2

" let g:clang_library_path="/home/atom/make/clang/llvm/Release+Asserts/lib/"
"let g:clang_library_path="/home/atom/make/clang/llvm/Release+Asserts/lib/"
" "
