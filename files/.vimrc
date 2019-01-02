"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Anton Samuelsson Vim Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="'"                                           " Set leader key
source ~/.vim-plugins                                       " Include plugin dependencies

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden                                                  " Don't unload buffer when switching away
set secure                                                  " Disable unsafe commands in local .vimrc files
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8    " Saving and encoding
set nobackup nowritebackup noswapfile autoread              " No backup or swap
set hlsearch incsearch ignorecase smartcase                 " Search
set nomousehide                                             " Don't hide the mouse cursor while typing
set ruler                                                   " Show cursor position in status barset number
set number                                                  " Show absolute line number of the current line
set nofoldenable                                            " No code folding!
set laststatus=2                                            " Always show status bar
set shell=bash                                              " ...
set title                                                   " Xterm title
set ttyfast                                                 " Fast scrolling
set nowrap                                                  " No wrapping of lines!
set ww+=<,>                                                 " Make the left/right movement wrap to previous/next line
set spell                                                   " Spell check of strings
set nobomb                                                  " Have no interest in those

set conceallevel=0
set list
set listchars=tab:▸\ ,trail:·                               " Highlight tailing whitespaces as '·'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                                                   " Show syntax highlighting
set t_Co=256                                                " 256 colors in terminal

set background=dark
colorscheme OceanicNext

set cursorline                                              " Enables cursor lines
hi CursorLine term=bold cterm=bold guibg=#2c2d27            " Highlight color for cursor lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on                                   " File-type based indentation
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab          " Tab settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable GIT in gutter
let g:gitgutter_enabled = 1

" ProjectRootCD - Automatically cd to current project
autocmd BufEnter * ProjectRootCD

" Open at buffers project root
nnoremap <leader>n :ProjectRootExe NERDTree<CR>

" Toggle NerdTree (CTRL+n)
nnoremap <C-n> :NERDTreeToggle<CR>

" Shortcut to open the www folder
nnoremap <leader>no :NERDTree ~/www/

" Automatically close nerdtree on file open
let NERDTreeQuitOnOpen=1

" Show hidden files in tree by default
let NERDTreeShowHidden = 1

" Auto open NERDTree if no file is specified.

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" AirLine
set noshowmode

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set ttimeoutlen=50

let g:powerline_symbols = 'fancy'
let g:airline_theme = 'oceanicnext'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 1

let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" VIM-GO
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

nnoremap <leader>tw :call TrimWhiteSpace()<CR>

autocmd BufWritePre * :call TrimWhiteSpace()

" TName
" Set tab name automatically
augroup tabname
    autocmd!
    autocmd BufEnter * TName substitute(system('basename "$PWD"'), "\@", "", "")
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Refactoring of variables
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

