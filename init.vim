" Кодировка UTF-8
set encoding=utf8

" enable normal color
set termguicolors

"enable italic
set t_ZH=[3m
set t_ZR=[23m

"python support
let g:python3_host_prog = '/usr/bin/python'

"nodejs support
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

"nvim-tmux-navigation plugin
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>

" cursor
set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor

" Save as sudo
ca w!! w !sudo tee "%"

" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible

" Игнорировать регистр при поиске
set ignorecase

" Не игнорировать регистр, если в паттерне есть большие буквы
set smartcase

" Подсвечивать найденный паттерн
set hlsearch

" Интерактивный поиск
set incsearch

" Размер табов - 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Превратить табы в пробелы
set expandtab

" Таб перед строкой будет вставлять количество пробелов определённое в shiftwidth
set smarttab

" Копировать отступ на новой строке
set autoindent
set smartindent

" Показывать номера строк
set number

" Относительные номера строк
set relativenumber

" Автокомплиты в командной строке
set wildmode=longest,list

" Подсветка синтаксиса
syntax on

" Разрешить использование мыши
set mouse=a

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Быстрый скроллинг
set ttyfast

" Курсор во время скроллинга будет всегда в середине экрана
set so=30

" Встроенный плагин для распознавания отступов
filetype plugin indent on

call plug#begin("~/.vim/plugged")

Plug 'alexghergh/nvim-tmux-navigation' "tmux nvim navigation
"Plug 'scrooloose/nerdtree' "right bar 
"Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons' "icons
Plug 'neoclide/coc.nvim' "autocompletiong
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " catppuccin colorscheme

Plug 'ray-x/web-tools.nvim' "html/css live server with livereload
Plug 'xiyaowong/transparent.nvim' "transparent nvim

"Startup screen
Plug 'startup-nvim/startup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'antonk52/bad-practices.nvim' "to help me give up on bad practices
Plug 'm4xshen/hardtime.nvim' "to help me establish good practices

Plug 'tpope/vim-surround' " quicky wrap text with quotes/brackets/markup
Plug 'tpope/vim-commentary' " commenting made easier
Plug 'mattn/emmet-vim' " expand abbreviations to html/css
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine for vim

"Python
Plug 'jeetsukumaran/vim-pythonsense' "python sense
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf
Plug 'junegunn/fzf.vim'
Plug 'Vimjas/vim-python-pep8-indent' "pep8 indent
Plug 'dense-analysis/ale' "ALE
Plug 'davidhalter/jedi-vim' " jedi vim
Plug 'ycm-core/YouCompleteMe' " YouCompleteMe autocomplete

" JS/TS
Plug 'chemzqm/vim-jsx-improve' " uses vim-javascript and vim-jsx-pretty
Plug 'HerringtonDarkholme/yats.vim' " ts syntax highlighter
Plug 'peitalin/vim-jsx-typescript' " highlighting for jsx in ts
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " for styled or css syntax in js/ts files
call plug#end()

" color scheme
colorscheme catppuccin-mocha  "catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

set rtp+=~/.vim/bundle/nerdtree

" Автоматическое открытие NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | wincmd p

" Включить/выключить NERDTree при нажатии \n
"nnoremap <leader>n :NERDTreeToggle<CR>
" Юникодные иконки папок (Работает только с плагином vim-devicons)
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Показывает количество строк в файлах
"let g:NERDTreeFileLines = 1
" Игнорировать указанные папки
"let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$']
" Закрыть vim, если единственная вкладка - это NERDTree
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Автокомплиты через Tab
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
