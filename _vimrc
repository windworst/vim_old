" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
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
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" -----------------------------------------------------------------------------
" VIM配置文件路径
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
if g:islinux
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Bundle

Bundle 'vim-scripts/ctags.vim'
Bundle 'git://github.com/scrooloose/nerdtree'
Bundle 'git://github.com/mattn/emmet-vim'
Bundle 'git://github.com/slim-template/vim-slim.git'
Bundle 'git://github.com/junegunn/vim-easy-align'
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

filetype plugin indent on    " required

" NerdTree

let NERDChristmasTree=1
let NERDTreeAutoCenter=1
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>


" 对部分语言设置单独的缩进
au FileType ruby,javascript,css,eruby,slim,coffee,sh,scss,sass set shiftwidth=2
au FileType ruby,javascript,css,eruby,slim,coffee,sh,scss,sass set tabstop=2
au FileType php,java set shiftwidth=4
au FileType php,java set tabstop=4


" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h   setlocal ft=c
au BufRead,BufNewFile *.sql setlocal ft=mysql
au BufRead,BufNewFile *.txt setlocal ft=txt
au BufRead,BufNewFile *.slim setlocal ft=slim
au BufRead,BufNewFile *.coffee setlocal ft=coffee
au BufRead,BufNewFile *.rb setlocal ft=ruby

" 设置不备份,不用交换文件
set nobackup
set noswapfile
set writebackup                             "保存文件前建立备份，保存成功后删除该备份

"  编写文件时的配置
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=2                                         "设置Tab键的宽度
set shiftwidth=2                                      "换行时自动缩进4个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
set autochdir                                         "设置工作路径
set autoindent                                        "自动缩进
syntax enable                                         "打开语法高亮
syntax on                                             "开启文件类型侦测
set list
set backspace=2                                       "退格键
set nu

" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

" 界面配置
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
" set guifont=YaHei_Consolas_Hybrid:h10                 "设置字体:字号（字体名称空格用下划线代替）
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set incsearch                                         "在输入要搜索的文字时，vim会实时匹配
set hlsearch                                          " 高亮显示结果

" 设置代码配色方案
if g:isGUI
    colorscheme Tomorrow-Night-Eighties               "Gvim配色方案
else
    colorscheme Tomorrow-Night-Eighties               "终端配色方案
endif

" 设置字体

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
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8
endif


" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
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

" 按键映射
:map <C-c> "+y<CR>
:map <C-v> "+p<CR>
:map <C-x> "+x<CR>
:map <C-z> u
:map <C-s> :w<CR>
:map <C-a> ggVG
" :map <C-w> :q<CR>
:map <C-t> :vnew<CR>
:map <C-S-t> :vsplit<CR>
:map <F12> :execute ":e ".g:vimrc_path<CR>
