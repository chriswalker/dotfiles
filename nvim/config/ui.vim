" -----------------------------------------------------------------------------
" General UI and theme config
" -----------------------------------------------------------------------------

"
" General UI settings
" -----------------------------------------------------------------------------
set number
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set laststatus=2
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set fillchars+=vert:\ 

" Highlight all chars past col 100 to encourage line breaks; "Float" defaults
" to red in theme
"call matchadd('Float', '\%101v.\+', 100)
set colorcolumn=100

" Folding
set foldmethod=indent
set foldnestmax=1

" Force truecolour
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" Set height of completions menus
set pumheight=10

" Allow mouse usage
set mouse=a

" Theme settings 
" -----------------------------------------------------------------------------
set background=dark
set termguicolors

let g:nord_italic_comments=1
let g:nord_underline=1
let g:nord_italic = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1

augroup nord-theme-overrides
  autocmd!
  " Override fold background
  autocmd ColorScheme nord highlight Folded guibg=#2E3440                    " bg=Nord0
  " Override statusline fore/background
  autocmd ColorScheme nord highlight StatusLine guifg=#D8DEE9 guibg=#3B4252  " fg=Nord4, bg=Nord1
  " Override Terminal Cursor colour when in a terminal
  autocmd ColorScheme nord highlight TermCursorNC guibg=#88C0D0              " fg=Nord8
augroup END

colorscheme nord

syntax on
highlight Comment cterm=italic
highlight TermCursor ctermfg=red

