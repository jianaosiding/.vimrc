" 插件管理
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" 自动缩进
Plugin 'vim-scripts/indentpython.vim'
" 自动补全
Plugin 'Valloric/YouCompleteMe'
" 语法检查/高亮
Plugin 'scrooloose/syntastic'
" 文件浏览
Plugin 'scooloose/nerdtree'
" 超级搜索
Plugin 'kien/ctrlp.vim'
" Powerline状态栏
Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'}
" 主题
Plugin 'morhetz/gruvbox'
" 符号自动补全
Plugin 'Raimondi/delimitMate'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 插件管理结束
" 启用语法高亮
filetype plugin on
syntax on
" 自动换行显示
autocmd FileType python set breakindentopt=shift:4
" 使用鼠标
set mouse=a
" 拼写检查
set spell
" 显示行号
set number
set relativenumber
" c文件自动缩进
set cindent
" 自动对齐
set autoindent
" 智能缩进
set smartindent
" PEP8风格
au BufNewFile, BufRead *.py
\set tabstop=4
\set softtabstop=4
\set shiftwidth=4
\set textwidth=79
\set expandtab
\set autoindent
\set fileformat=unix
" js和html, css
au BufNewFile, BufRead *.js, *.html, *.css
\set tabstop=2
\set softtabstop=2
\set shiftwidth=2
" 支持UTF-8编码
set encoding=utf-8
" 系统剪贴板
set clipboard=unnamed
" 主题设置
:colorscheme gruvbox
se t_Co=256
set background=dark
" Pathogen设置
execute pathogen#infect()
" 快速运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'cpp'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'java'
	exec "!javac %"
	exec "!time java %<"
elseif &filetype == 'sh'
	:!time bash %
elseif &filetype == 'python'
	exec "!time python3 %"
elseif &filetype == 'html'
	exec "!firefox %&"
elseif &filetype == 'go'
	exec "!go build %<"
	exec "!time go run %"
endif
endfunc
" NERDTree 设置
nnoremap <silent> <tt> :NERDTree<CR>
autocmd VimEnter * NERDTree
" 高亮显示行和列
set cursorcolumn
set cursorline
highlight CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" 符号自动补全
au FileType python let b:delimitMate_nesting_quotes = ['"'] 
