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
let g:vimrc_path = ""
let g:vimrc_home_path = expand("$HOME/.vimrc")
let g:vimrc_vimfile_path = expand("$VIM/_vimrc")

if filereadable(g:vimrc_home_path)
  let g:vimrc_path = g:vimrc_home_path
elseif filereadable(g:vimrc_vimfile_path)
  let g:vimrc_path = g:vimrc_vimfile_path
end

" -----------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
let vundle_path = "bundle/Vundle.vim/"
let vundle_vim_path = "autoload/vundle.vim"
if g:islinux
    if !filereadable(expand("$HOME/.vim/").vundle_path.vundle_vim_path)
      :execute "!git clone git@github.com:gmarik/Vundle.vim.git ".expand("$HOME/.vim/").vundle_path
    end
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()
else
    if !filereadable(expand("$VIM/vimfiles/").vundle_path.vundle_vim_path)
      :execute "!git clone git@github.com:gmarik/Vundle.vim.git ".expand("$VIM/vimfiles/").vundle_path
    end
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Bundle
Bundle 'gmarik/Vundle.vim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/emmet-vim'
Bundle 'slim-template/vim-slim.git'
Bundle 'junegunn/vim-easy-align'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'jQuery'
Bundle 'tpope/vim-rails.git'
Bundle 'bling/vim-bufferline.git'
Bundle 'majutsushi/tagbar'
Bundle 'ngmy/vim-rubocop.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'brookhong/cloudboard.vim'
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'Yggdroot/indentLine'

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
set list
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
" set guifont=YaHei_Consolas_Hybrid:h10
set nowrap
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
set guifont=YaHei_Consolas_Hybrid:h10
if has("gui_gtk2")
set guifont=DejaVu\ Sans\ Mono\ 11
elseif has("gui_macvim")
set guifont=DejaVu_Sans_Mono:h11
elseif has("gui_win32")
set guifont=YaHei_Consolas_Hybrid:h10
end

if (g:iswindows && g:isGUI)
    "solve consle output mass code
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    language messages zh_CN.utf-8
endif

" color
 hi Normal guibg=#000020 guifg=White
 hi LineNr guibg=#003366 guifg=#99ccff ctermbg=7777 ctermfg=blue
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
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
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

" Key Mapping
:map <C-c> "+y<CR>
:map <C-v> "+p<CR>
:map <C-x> "+x<CR>
:map <C-z> u
:map <C-s> :w<CR>
:map <C-a> ggVG
" :map <C-w> :q<CR>
:map <C-n> :vnew<CR>
:map <C-t> :vsplit<CR>
:map <F12> :execute ":e ".g:vimrc_path<CR>
