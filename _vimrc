" =============================================================================
"        << OS:  Windows or  Linux or Terminal or Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < OS:  Windows or Linux >
" -----------------------------------------------------------------------------
"
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
  let g:iswindows = 1
else
  let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < Terminal or Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
  let g:isGUI = 1
else
  let g:isGUI = 0
endif

" -----------------------------------------------------------------------------
" VIMRC file path
let g:vimrc_home_path = expand("$HOME/.vimrc")
let g:vimdir_home_path = expand("$HOME/.vim/")

let g:vimrc_vimfile_path = expand("$VIM/_vimrc")
let g:vimdir_vimfile_path = expand("$VIM/vimfiles/")

let g:vimrc_path = ""
let g:vimdir_path = ""
if filereadable(g:vimrc_home_path)
  let g:vimrc_path = g:vimrc_home_path
  let g:vimdir_path = g:vimdir_home_path
elseif filereadable(g:vimrc_vimfile_path)
  let g:vimrc_path = g:vimrc_vimfile_path
  let g:vimdir_path = g:vimdir_vimfile_path
end
" -----------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
let vundle_path = g:vimdir_path."bundle/Vundle.vim/"
if !filereadable(vundle_path."autoload/vundle.vim")
  :execute "!git clone https://github.com/gmarik/Vundle.vim.git "."\"".vundle_path."\""
end
if filereadable(g:vimrc_home_path)
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#rc()
elseif filereadable(g:vimrc_vimfile_path)
  set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
  call vundle#rc('$VIM/vimfiles/bundle/')
end

set nocompatible              " be iMproved, required
filetype off                  " required

" Plugin
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'Lokaltog/vim-powerline'
Plugin 'a.vim'
Plugin 'Ack.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'tsaleh/vim-align'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jQuery'
Plugin 'tpope/vim-rails.git'
Plugin 'bling/vim-bufferline.git'
Plugin 'majutsushi/tagbar'
Plugin 'ngmy/vim-rubocop.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'markdown'
Plugin 'posva/vim-vue'
Plugin 'udalov/kotlin-vim'
" for fun
Plugin 'vim-scripts/TeTrIs.vim'
Plugin 'uguu-org/vim-matrix-screensaver'

filetype plugin indent on    " required

" NerdTree

let NERDChristmasTree=1
let NERDTreeAutoCenter=1
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>


" indent
au FileType ruby,javascript,css,eruby,slim,coffee,sh,scss,sass set shiftwidth=2
au FileType ruby,javascript,css,eruby,slim,coffee,sh,scss,sass set tabstop=2
au FileType php,java set shiftwidth=4
au FileType php,java set tabstop=4


" judge file-type by ext-name
au BufRead,BufNewFile *.h   setlocal ft=c
au BufRead,BufNewFile *.sql setlocal ft=mysql
au BufRead,BufNewFile *.txt setlocal ft=txt
au BufRead,BufNewFile *.slim setlocal ft=slim
au BufRead,BufNewFile *.coffee setlocal ft=coffee
au BufRead,BufNewFile *.rb setlocal ft=ruby

set nobackup
set noswapfile
set writebackup

" Edit file
filetype on
filetype plugin on
filetype plugin indent on
set smartindent
set expandtab                                         "Tab=>Space
set tabstop=2                                         "tab width
set shiftwidth=2                                      "tab = 2 space
set smarttab                                          " backspace will delete shiftwidth space
set autochdir
set autoindent
syntax enable
syntax on
" set list
set backspace=2                                       "BackSpace enable
set spelllang=en_GB.UTF-8                             "Spell Check
set nu                                                "Line Number"

" File Encoding
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

" Interface Configure
set laststatus=2                                      " Enable Status Message
set cmdheight=2
set cursorline
" set nowrap
set shortmess=atI                                     "remove welcome-page
set incsearch                                         "vim Realtime-match during search
set hlsearch                                          " HighLight Search result

" Code Color
if g:isGUI
  colorscheme Tomorrow-Night-Eighties               "Gvim
else
  colorscheme Tomorrow-Night-Eighties               "Terminal
endif

" font

"set guifont=DejaVu\ Sans\ mono\ 11
set guifont=Consolas:h10
if has("gui_gtk2")
  set guifont=DejaVu\ Sans\ Mono\ 11
elseif has("gui_macvim")
  set guifont=DejaVu_Sans_Mono:h11
elseif has("gui_win32")
  set guifont=Consolas:h10
end

if (g:iswindows && g:isGUI)
  "solve consle output mass code
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  language messages zh_CN.utf-8
endif

" color
hi Normal guibg=#1e1e1e guifg=White
hi LineNr guibg=#1e1e1e guifg=#99ccff ctermbg=239 ctermfg=blue
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=#002000

" Show/Hide Menu、Toolbar、RollLink，use Ctrl + F11 Switch
if g:isGUI
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
        \set guioptions-=b <Bar>
        \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
        \set guioptions+=b <Bar>
        \endif<CR>
endif

" Ctags
map <C-F12> :!ctags -R --fields=+iaS --extra=+q .<CR>

":set ff=unix
map <C-S-F1> :%s/\r\+$//g <CR>
map <C-S-F2> :%s/\t/  /g<CR>

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 1
" let g:syntastic_mode_map = { 'passive_filetypes': ['scss'] }
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_python_checkers=['python3']
let g:syntastic_ruby_exec = 'ruby2.1.1'
let g:syntastic_ruby_mri_checkers = ['rubocop']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffee-config.json"


"------------------------------------------------------------------------------
"  < Compile, Link, Run >
"------------------------------------------------------------------------------
" F9 Save & Compile & Link & Run
map <F9> :call Run()<CR>
imap <F9> <ESC>:call Run()<CR>

" Ctrl + F9 Save & Compile
map <c-F9> :call Compile()<CR>
imap <c-F9> <ESC>:call Compile()<CR>

" Ctrl + F10 Save & Link
map <c-F10> :call Link()<CR>
imap <c-F10> <ESC>:call Link()<CR>

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Sou_Error = 0

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

func! Compile()
  exe ":ccl"
  exe ":update"
  if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
    let s:Sou_Error = 0
    let s:LastShellReturn_C = 0
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    let Obj_Name = expand("%:p:t:r").s:Obj_Extension
    let v:statusmsg = ''
    if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
      redraw!
      if expand("%:e") == "c"
        if g:iswindows
          exe ":setlocal makeprg=".s:windows_CFlags
        else
          exe ":setlocal makeprg=".s:linux_CFlags
        endif
        echohl WarningMsg | echo " compiling..."
        silent make
      elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
        if g:iswindows
          exe ":setlocal makeprg=".s:windows_CPPFlags
        else
          exe ":setlocal makeprg=".s:linux_CPPFlags
        endif
        echohl WarningMsg | echo " compiling..."
        silent make
      endif
      redraw!
      if v:shell_error != 0
        let s:LastShellReturn_C = v:shell_error
      endif
      if g:iswindows
        if s:LastShellReturn_C != 0
          exe ":bo cope"
          echohl WarningMsg | echo " compilation failed"
        else
          if s:ShowWarning
            exe ":bo cw"
          endif
          echohl WarningMsg | echo " compilation successful"
        endif
      else
        if empty(v:statusmsg)
          echohl WarningMsg | echo " compilation successful"
        else
          exe ":bo cope"
        endif
      endif
    else
      echohl WarningMsg | echo ""Obj_Name"is up to date"
    endif
  else
    let s:Sou_Error = 1
    echohl WarningMsg | echo " please choose the correct source file"
  endif
  exe ":setlocal makeprg=make"
endfunc

func! Link()
  call Compile()
  if s:Sou_Error || s:LastShellReturn_C != 0
    return
  endif
  let s:LastShellReturn_L = 0
  let Sou = expand("%:p")
  let Obj = expand("%:p:r").s:Obj_Extension
  if g:iswindows
    let Exe = expand("%:p:r").s:Exe_Extension
    let Exe_Name = expand("%:p:t:r").s:Exe_Extension
  else
    let Exe = expand("%:p:r")
    let Exe_Name = expand("%:p:t:r")
  endif
  let v:statusmsg = ''
  if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
    redraw!
    if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
      if expand("%:e") == "c"
        setlocal makeprg=gcc\ -o\ %<\ %<.o
        echohl WarningMsg | echo " linking..."
        silent make
      elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
        setlocal makeprg=g++\ -o\ %<\ %<.o
        echohl WarningMsg | echo " linking..."
        silent make
      endif
      redraw!
      if v:shell_error != 0
        let s:LastShellReturn_L = v:shell_error
      endif
      if g:iswindows
        if s:LastShellReturn_L != 0
          exe ":bo cope"
          echohl WarningMsg | echo " linking failed"
        else
          if s:ShowWarning
            exe ":bo cw"
          endif
          echohl WarningMsg | echo " linking successful"
        endif
      else
        if empty(v:statusmsg)
          echohl WarningMsg | echo " linking successful"
        else
          exe ":bo cope"
        endif
      endif
    else
      echohl WarningMsg | echo ""Exe_Name"is up to date"
    endif
  endif
  setlocal makeprg=make
endfunc

func! Run()
  let s:ShowWarning = 0
  call Link()
  let s:ShowWarning = 1
  if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
    return
  endif
  let Sou = expand("%:p")
  let Obj = expand("%:p:r").s:Obj_Extension
  if g:iswindows
    let Exe = expand("%:p:r").s:Exe_Extension
  else
    let Exe = expand("%:p:r")
  endif
  if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
    redraw!
    echohl WarningMsg | echo " running..."
    if g:iswindows
      exe ":!%<.exe"
    else
      if g:isGUI
        exe ":!gnome-terminal -e ./%<"
      else
        exe ":!./%<"
      endif
    endif
    redraw!
    echohl WarningMsg | echo " running finish"
  endif
endfunc

" Key Mapping
:map <C-c> "+y<CR>
:map <C-v> "+p<CR>
:map <C-x> "+x<CR>
:map <C-z> u
:map <C-s> :w!<CR>
:map <C-a> ggVG
" :map <C-w> :q<CR>
:map <C-n> :split<CR>
:map <A-n> :vsplit<CR>
:map <F12> :execute ":e ".g:vimrc_path<CR>


"""""""""""""""""""""""""""""""""""""""
"
""             ctrap
"
""""""""""""""""""""""""""""""""""""""""
" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif "MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
