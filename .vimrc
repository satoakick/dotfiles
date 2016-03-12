" ========================================
" 見た目とか
" ========================================
  " エンコード設定
  set encoding=utf-8
  scriptencoding utf-8
  " プログラムに彩りを
  syntax on
  " 行番号の設定
  set number
  " 行番号の色を設定
  hi LineNr ctermbg=0 ctermfg=0
  hi CursorLineNr ctermbg=4 ctermfg=0
  " 編集行の行番号を常にハイライトする
  set cursorline
  " カーソルラインは出さない
  hi clear CursorLine 
  " スワップファイル, バックアップファイルは残さない
  set noswapfile
  set nobackup
  "タブ、空白、改行の可視化
  set list
  set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
  ""全角スペースをハイライト表示
  function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
  endfunction
  if has('syntax')
    augroup ZenkakuSpace
      autocmd!
      autocmd ColorScheme       * call ZenkakuSpace()
      autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
  endif


" ========================================
" 検索系
" ========================================
  " 大文字小文字を区別せずに検索
  set ignorecase
  " インクリメンタルサーチ
  set incsearch
  " 検索マッチテキストをハイライト
  set hlsearch
  " バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
  cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
  cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" ========================================
" 編集系
" ========================================
  " マウスからの操作を有効にする
  set mouse=a
  " エラーメッセージ表示時にビープ音を出さない
  set noerrorbells
  " ビープ音を視覚表示し、ビープ音を出さないようにする
  set visualbell t_vb=

  """"""""""""""""""""""""""""""""
  " インデント                   "
  """"""""""""""""""""""""""""""""
  " ts(tabstop):
  "   ファイル中の<Tab>文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するかを指定する。
  "   既にあるファイルをどのように表示するのか指定したい時に便利。
  "
  " sw(shiftwidth):
  "   vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を、
  "   画面上の見た目で何文字分であるか指定します。自動的に挿入される量、と覚えておくと良いです。
  "
  " sts(softtabstop):
  "   キーボードで<Tab>キーを押した時に挿入される空白の量。
  "   'softtabstop'が0以外の時には、例え'ts'を4に設定していても、<Tab>を1度押しても'softtabstop'分だけ
  "   空白が挿入されます。逆に'softtabstop'が0の場合には挿入されるのは'ts'で指定した量になります。
  set expandtab
  set ts=2 sw=2 sts=0
  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
  set smartindent

  " ESCキーをjjに変更
  inoremap jj <Esc>



  " ========================================
  " vimshell
  " ========================================
  " vimshell setting
  let g:vimshell_interactive_update_time = 10
  " vimshell map
  nnoremap <silent> vs :VimShell<CR>
  nnoremap <silent> vsc :VimShellCreate<CR>
  nnoremap <silent> vp :VimShellPop<CR>



  " ========================================
  " START NerdTree
  " ========================================

  " vimコマンド単独実行時にNERDTreeを自動実行する
  autocmd vimenter * if !argc() | NERDTree | endif

  "<C-e>でNERDTreeをオンオフ。いつでもどこでも。
  nmap <silent> <C-e>      :NERDTreeToggle<CR>
  vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  omap <silent> <C-e>      :NERDTreeToggle<CR>
  imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
  " カーソルが外れているときは自動的にnerdtreeを隠す
  "function! ExecuteNERDTree()
  "    "b:nerdstatus = 1 : NERDTree 表示中
  "    "b:nerdstatus = 2 : NERDTree 非表示中
  " 
  "    if !exists('g:nerdstatus')
  "        execute 'NERDTree ./'
  "        let g:windowWidth = winwidth(winnr())
  "        let g:nerdtreebuf = bufnr('')
  "        let g:nerdstatus = 1
  " 
  "    elseif g:nerdstatus == 1
  "        execute 'wincmd t'
  "        execute 'vertical resize' 0
  "        execute 'wincmd p'
  "        let g:nerdstatus = 2
  "    elseif g:nerdstatus == 2
  "        execute 'wincmd t'
  "        execute 'vertical resize' g:windowWidth
  "        let g:nerdstatus = 1
  " 
  "    endif
  "endfunction
  "noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
  " ========================================
  " END NerdTree
  " ========================================



  " ========================================
  " START neobundle
  " ========================================
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
  " Required:
  call neobundle#begin(expand('~/.vim/bundle/')) "必ずNeoBundle管理のプラグインは'call neobundle#begin()'〜'call neobundle#end()'で囲むこと

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!
  NeoBundle 'Townk/vim-autoclose'

  """"""""""""""""""""""""""""""""
  "neocomplecache START          "
  """"""""""""""""""""""""""""""""
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  NeoBundle 'Shougo/neocomplcache'
    " 日本語入力モードでは補完しないようにする
    let g:neocomplcache#lock_iminsert = 1
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    "let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    "let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " 補完候補の色
    hi Pmenu ctermbg=4
    hi PmenuSel ctermbg=1
    hi PMenuSbar ctermbg=4
  """"""""""""""""""""""""""""""""
  "neocomplecache END            "
  """"""""""""""""""""""""""""""""


  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }

  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimshell.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'rking/ag.vim'

  NeoBundle 'tpope/vim-surround'
  NeoBundle 'vim-scripts/Align'
  NeoBundle 'vim-scripts/YankRing.vim'

  " インデントの可視化
  NeoBundle 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_guide_size = 1

  call neobundle#end() "必ずNeoBundle管理のプラグインは'call neobundle#begin()'〜'call neobundle#end()'で囲むこと

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck

  " ========================================
  " END neobundle
  " ========================================
