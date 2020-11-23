"author Dustfall<dustfall@gmail.com>
"last change:2020/07/31
"
" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"relative line num
set nu rnu

"block the annoying ex mode
map Q <Nop>

"vundle config
filetype off                  " required
set encoding=utf-8

" ------------------------ Vundle config start------------------------------
" set the runtime path to include Vundle and initialize
" if has('unix')
" 	set rtp+=~/.vim/bundle/Vundle.vim
" else
" 	set rtp+=$USERPROFILE/vimfiles/bundle/Vundle.vim
" endif
" call vundle#begin('$USERPROFILE/.vim/bundle/')

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Leader key
let mapleader=';'

" ==BAK== alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" ============= plugin on GitHub repo =============
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'nvie/vim-flake8'
NeoBundle 'calviken/vim-gdscript3'
" NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-surround'
" Bundle 'OmniSharp/omnisharp-vim'
" Plugin 'davidhalter/jedi-vim'
NeoBundle 'XadillaX/json-formatter.vim'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release' } }
" Plugin 'w0rp/ale' 
" NeoBundle 'valloric/youcompleteme'
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'ThePrimeagen/vim-be-good', {'do': '.\install.sh'}
" NeoBundle 'rkulla/pydiction'
" NeoBundle 'kien/ctrlp.vim'
NeoBundle 'junegunn/fzf', { 'do': { -> fzf#install() } }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'habamax/vim-godot'
NeoBundle 'scrooloose/nerdcommenter'

" Theme related
NeoBundle 'KeitaNakamura/neodark.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sainnhe/lightline_foobar.vim'
" ============= Git plugin not hosted on GitHub =============
"
" All of your Plugins must be added before the following line
" call vundle#end()            " required
call neobundle#end()

NeoBundleCheck

" Theme setup
colorscheme neodark
let g:lightline = { }
let g:lightline.colorscheme = 'neodark_alter'

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" ******* Plugin Configurations ********

" nerdTree configs
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nmap <Leader>tt :NERDTree<CR>

" python indent settings
au BufNewFile,BufRead *.py:
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
     \ set textwidth=79 |
     \ set expandtab |
     \ set autoindent |
     \ set fileformat=unix

" YCM configuration
" let g:ycm_python_binary_path = 'd:\Python\Python37\python.exe'
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_min_num_identifier_candidate_chars = 1
" nmap gd :YcmCompleter GoTo<CR>


" =====================coc configs======================
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>fu <Plug>(coc-references)

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fc  <Plug>(coc-format-selected)
nmap <leader>fc  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use K to show documentation in preview window.
nnoremap <silent><leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------------------------ Vundle config end ------------------------------

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
" filetype plugin indent on   " 开启插件
set number                  " 显示行号
set nocursorline            " 不突出显示当前行
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set expandtab
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
"set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
" set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
"set nowrap                  " 不自动换行
set magic                  " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start	" 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)

" folding
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
"set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=99        " 设置折叠层数为
set foldclose=all           " 设置为自动关闭折叠
set nofoldenable

"colorscheme colorzone       " 设定配色方案
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
" 显示Tab符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set list

"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
"set foldexpr=1

"if has("gui_running")
"    set guioptions-=m " 隐藏菜单栏
"    set guioptions-=T " 隐藏工具栏
"    set guioptions-=L " 隐藏左侧滚动条
"    set guioptions-=r " 隐藏右侧滚动条
"    set guioptions-=b " 隐藏底部滚动条
"    set showtabline=0 " 隐藏Tab栏
"endif

"编辑vim配置文件
if has('unix')
    set fileformats=unix,dos,mac
    nmap <Leader>e :tabnew $HOME/.vimrc<CR>
    let $VIMFILES = $HOME.'/.vim'
else
    set fileformats=dos,unix,mac
    nmap <Leader>e :tabnew $VIM/_vimrc<CR>
    let $VIMFILES = $VIM.'/vimfiles'
endif

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif


" 大括号自动完成测试
ino { {}<esc>i
" ino { {}<esc>:let leavechar="}"<cr>

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
set helplang=cn
"set nobomb

" {{{ 编码字体设置
set termencoding=utf8
set fileencodings=ucs-bom,utf-8,default,gb2312,gbk,gb18030
set ambiwidth=double
set guifont=YaHei\ Consolas\ Hybrid:h9
" GuiFont! Source\ Code\ Pro\ Semibold:h10

" }}}

" {{{全文搜索选中的文字
:vmap <silent> <leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vmap <silent> <leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
" }}}

" 删除所有行未尾空格
nmap <F12> :%s/[ \t\r]\+$//g<CR>

" Buffers操作快捷方式!
nmap <C-L> :bnext<CR>
nmap <C-H> :bprevious<CR>

" Tab操作快捷方式!
nmap <S-J> :tabnext<CR>
nmap <S-K> :tabprev<CR>

" 插入模式下左右移动光标
imap <c-l> <esc>la
imap <c-h> <esc>ha

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
" nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" win下的全屏组件，需gvimfullscreen.dll的支持
" if !has('unix')
"     function! ToggleFullScreen()
"         let s:IsFullScreen=libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 27 + 29*256 + 30*256*256)
"     endfunction
"     map <F11> <Esc>:call ToggleFullScreen()<CR>
" endif

" leader-nl取消高亮
nmap <leader>nl :nohlsearch<CR>

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nmap <leader>1 :set filetype=xhtml<CR>
nmap <leader>2 :set filetype=css<CR>
nmap <leader>3 :set filetype=javascript<CR>
nmap <leader>4 :set filetype=php<CR>

" Python 文件的一般设置，比如不要 tab 等
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
"
" python syntax
let python_highlight_all=1

" 设置字典 ~/.vim/dict/文件的路径
"autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
"autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
"autocmd filetype php set dictionary=$VIMFILES/dict/php.dict

"python dict
if has('unix')
	let g:pydiction_location = '~/vimfiles/ftplugin'
else
	let g:pydiction_location = 'c:\Users\Administrator\vimfiles\ftplugin'
endif

"as3 dict
" au filetype actionscript call AddAS3Dict()
" function AddAS3Dict()
"     set dictionary-=$VIM/dict/as3_dict.txt dictionary+=$VIM/dict/as3_dict.txt
"     set complete-=k complete+=k
" endfunction

" {{{ plugin - vimExplorer.vim 文件管理器
" :VE 打开文件管理器       tab: 在树、列表窗口切换  
" Enter: 树窗口开关目录    u: 列表中在预览窗口打开文件
" ;r 打开Renamer插件
" let g:VEConf_systemEncoding='cp936'
"}}}


" {{{ plugin - renamer.vim 文件重命名
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}


" {{{ plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"}}}


" {{{ plugin - bookmarking.vim 设置标记（标签）
" <F9> 设置标记    <F4> 向下跳转标记   <S-F4> 向上跳转标记
"map <F3>   :ToggleBookmark<CR>
"map <F4>   :NextBookmark<CR>
"map <S-F4> :PreviousBookmark<CR>
"}}}


" {{{ plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"}}}
nmap <c-p> :Files<CR>


" {{{ plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
" 你也可以使用visual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
nmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hr <Plug>MarkRegex

" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
"}}}

" {{{ plugin – winmove.vim 窗口移动
let g:wm_move_left  = "<A-h>"
let g:wm_move_right = "<A-l>"
let g:wm_move_up    = "<A-k>"
let g:wm_move_down  = "<A-j>"
"}}}


" {{{ plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
" }}}


" {{{ plugin - auto_mkdir.vim 自动创建目录
" }}}


" {{{ plugin - mru.vim 记录最近打开的文件
" let MRU_File = $VIMFILES.'/_vim_mru_files'
" let MRU_Max_Entries = 1000
" let MRU_Add_Menu = 0
" nmap <leader>f :MRU<CR>
" }}}

" {{{ plugin - surround.vim 快速替换、清除包围符号、标签
"  Old text                  Command     New text ~
"  "Hello *world!"           ds"         Hello world!
"  [123+4*56]/2              cs])        (123+456)/2
"  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
"  if *x>3 {                 ysW(        if ( x>3 ) {
"  my $str = *whee!;         vlllls'     my $str = 'whee!';
"  "Hello *world!"           ds"         Hello world!
"  (123+4*56)/2              ds)         123+456/2
"  <div>Yo!*</div>           dst         Yo!
"  Hello w*orld!             ysiw)       Hello (world)!
" }}}


" {{{ plugin - NERD_commenter.vim 注释代码用的，
" nmap <leader>cc 注释当前行
" nerdCommenter 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" trimming of trailing whitespaces when uncommenting
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
let g:NERDTrimTrailingWhitespace=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=0
let g:NERDToggleCheckAllLines=1
" nmap <leader>cs 以”性感”的方式注释
" nmap <leader>cA 在当前行尾添加注释符，并进入Insert模式
" nmap <leader>cu 取消注释
" nmap <leader>cm 添加块注释
" }}}

imap <S-Insert> <Esc>"+pa
nmap <S-Insert> <Esc>"+p
vmap <C-Insert> "+y<Esc>

" {{{ plugin - jsbeautify.vim 优化js代码，并不是简单的缩进，而是整个优化
" 开始优化整个文件
nmap <silent> <leader>js :call g:Jsbeautify()<cr>
" }}}

" 2017.4.25 copy matches ----------------
" http://vim.wikia.com/wiki/Copy_search_matches
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

map <leader>cm :CopyMatches +<CR>
" 2017.4.25 copy matches ---------------

" ------------Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>

if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo
" ------------
"
" godot vim coc
let godot_executable='d:\gotot3.2\Godot_v3.2.2-stable_win64.exe'
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

" Omnisharp-Vim
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_server_path = 'd:\omnisharp\OmniSharp.exe'
" let g:omnisharp_response_timeout = 500
" map <leader>gd  :OmniSharpGoToDefinition<CR>
" map <leader>fu  :OmniSharpFindUsage<CR>
" map <leader>gm  :OmniSharpFindSymbol<CR>
" map <leader>r  :OmniSharpRename<CR>



