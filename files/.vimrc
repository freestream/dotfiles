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

let g:indentLine_leadingSpaceEnabled = 1                    " Highlight whitespaces
let g:indentLine_leadingSpaceChar = "."                     " Highlight leading space as '.'
set list listchars=tab:»·,trail:·                           " Highlight tailing whitespaces as '·'
set list lcs=tab:\|_                                        " Highlight all tabs as '_'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256                                                " 256 colors in terminal
colorscheme molokai                                         " Sets the color scheme
let g:molokai_original = 1                                  " Color scheme theme to use
let g:rehash256 = 1                                         " Use 256 color scheme

set cursorline                                              " Enables cursor lines
hi CursorLine term=bold cterm=bold guibg=#2c2d27            " Highlight color for cursor lines

" Highlight the 80 and 120 and fallback for Vim < v7.3

if exists('+colorcolumn')
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,".join(range(120,999),",")
else
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on                                   " File-type based indentation
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab          " Tab settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Helpers
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
nnoremap <leader>no :NERDTree /var/www/

" Automatically close nerdtree on file open
let NERDTreeQuitOnOpen=1

" Auto open NERDTree if no file is specified.

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

nnoremap <leader>tw :call TrimWhiteSpace()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Refactoring of variables
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
