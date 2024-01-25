" Кодировка UTF-8
set encoding=utf8

" enable normal color
set termguicolors

"enable italic
set t_ZH=[3m
set t_ZR=[23m

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

Plug 'alexghergh/nvim-tmux-navigation'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

" color scheme
colorscheme catppuccin-mocha  "catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

set rtp+=~/.vim/bundle/nerdtree

" Автоматическое открытие NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p

" Включить/выключить NERDTree при нажатии \n
nnoremap <leader>n :NERDTreeToggle<CR>
" Юникодные иконки папок (Работает только с плагином vim-devicons)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Показывает количество строк в файлах
let g:NERDTreeFileLines = 1
" Игнорировать указанные папки
let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$']
" Закрыть vim, если единственная вкладка - это NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Автокомплиты через Tab
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
