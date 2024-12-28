" Copied from https://hir0ki-tech.hatenablog.jp/entry/2019/07/02/022014
" Thanks!

"==================================language=======================================
set encoding=japan                      "
set encoding=utf-8                      "
set fileencodings=utf-8                    
set fileformats=unix,dos,mac
set ambiwidth=double                    "全角文字を半角2文字分で表現？


"===================================color==========================================
syntax on                               "コードの色分け
colorscheme molokai											"カラースキーム
set t_Co=256                            "色数


"===================================display========================================
set number                  "行番号の表示
set title                   "編集中ファイル名の表示
set showmatch               "括弧入力時に対応する括弧のハイライトを表示,また対応する括弧へ移動
set matchtime=0             "括弧入力時，括弧末へ移動する時間
set showmode                "モードを表示する
"set smartindent
set autoindent              "オートでインデントを入れる
set tabstop=2               "タブキーのスペース数
set shiftwidth=2            "オートインデントのスペース数
set showcmd                 "入力中のコマンドをステータスに表示
set cursorline              "現在の行を表示
set textwidth=0             "行の文字数制限の解除
set wrap                    "window幅より文字数が多いなら折り返し表示
set ruler                   "カーソルの位置を行列番号で表示
set cindent                 "C言語みたいなインデントを自動で入れる
set wildmenu                "タブ補完
set wildmode=list:longest   "


"====================================search===========================================
set ignorecase          "大文字小文字の区別をなくす
set hlsearch            "検索結果をハイライトをつけて表示


"====================================others==========================================
set history=200                        "コマンド/検索パターンをx件まで保存
set mouse=a                            "マウスの操作の有効化
set whichwrap=b,s,h,l,<,>,[,]          "行頭/行末の左右移動で行をまたぐ
set paste                              "貼り付けモードが動き出す
set visualbell t_vb=                   "ビープ音を視覚表示
set noerrorbells                       "エラーメッセージ表示時にビープ音を鳴らさない
set clipboard=unnamedplus,autoselect   "クリップボードを共有する
set noswapfile                         "スワップファイルを作らない

