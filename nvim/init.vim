"------------------------------------------------------------------------------
" Plug (https://github.com/junegunn/vim-plug)
"------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-skeletons', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}

Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
"Plug 'avdgaag/vim-phoenix'

Plug 'ElmCast/elm-vim', {'for': 'elm'}

Plug 'zah/nim.vim', {'for': 'nim'}

call plug#end()

"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------
set nocompatible        " Not compatible with vi
set path=.,,**          " Search in dir of the current file, cwd, and subdirs
set hidden              " Allow switching buffers without saving
set autoread            " Set to auto read when a file is changed
set autowrite           " Automatically save before :next, :make etc.
set scrolloff=5         " Keep context when using j/k
set sidescroll=5        " Keep context when using h/l
set esckeys             " Cursor keys in insert mode
set magic               " Use 'magic' patterns
set nostartofline       " Keep the cursor's column when jumping to other rows
set nojoinspaces        " Insert just one space joining lines with J
set lazyredraw          " Don't redraw while executing macros (for performance)
set showcmd             " Show info about the current command
set showmatch           " Show matching brackets when typing them
set secure              " Forbid loading of .vimrc under $PWD
set nomodeline          " Modelines have been a source of vulnerabilities

" No annoying sound on errors
set noerrorbells novisualbell t_vb=

" backups and undo
set nobackup            " Disable backups when writing to a file
set nowritebackup       " Disable auto backup before overwriting a file
set swapfile            " Enable backups of changes buffers
set directory=~/.nvim/swap//     " Directory for swap files
set history=1000        " Lines of history to remember

" Statusline
set laststatus=2        " Always display a statusline
set noshowmode          " Do not show info about the current mode (plugin will)
set noruler             " Do not show current position (plugin will)

" Searching
set hlsearch            " Highlight search results
set incsearch           " Show partial match
set ignorecase          " Ignore case when searching
set smartcase           " Do not ignore case when capital letter is used

" Splitting
set splitright          " Open new vertical panes in the right
set splitbelow          " Open new horizontal panes in the bottom

" Which characters represent  hidden characters
set listchars=tab:▸\•
set listchars+=trail:▫
set listchars+=nbsp:·
set listchars+=eol:¬
set listchars+=extends:›
set lcs+=precedes:‹

" Allow arrows at the end/beginning of lines to move to the next/previous line
set whichwrap+=<,>,[,]

" Allow backspace on everything in insert mode
set backspace=eol,start,indent

" Indention and formatting
set autoindent          " Indent a new line according to the previous one
set copyindent          " Copy (exact) indention from the previous line
set nopreserveindent    " Do not try to preserve indention when indenting
set nosmartindent       " Turn off smartindent

" Whitespace
set tabstop=4           " Number of spaces a tab counts for
set shiftwidth=4        " Number of spaces to use for each step of indent
set shiftround          " Round indent to multiple of shiftwidth
set expandtab           " Expand tab with spaces
set smarttab            " <Tab> in front of line inserts 'shiftwidth' blanks

" Line numbers
set number              " Show line numbers
set norelativenumber    " Show absolute numbers by default

" Wrapping
set wrap                " Enable text wrapping
set linebreak           " Break after words only
set display+=lastline   " Show as much as possible from the last shown line
set textwidth=0         " Don't automatically wrap lines
" Disable automatic wrapping for all files (some filetype plugins set this to
" a different value)
au FileType * set textwidth=0

" Path, file, command completion
set wildmenu            " Enhanced command-line completion
set wildmode=list:longest

" Encoding
setglobal fenc=utf-8    " Default file encoding for new files
set enc=utf-8           " Internal encoding used by buffers, help and commands
set tenc=utf-8          " Terminal encoding used for terminal display
" Detect file encoding when opening a file and try to choose from the following
" encoding list (to check what file encoding was selected run ":set fenc")
set fencs=ucs-bom,utf-8,cp1250,latin2,latin1

" End of line
set ffs=unix,mac,dos    " List of preferred EOLs

" Colors
syntax on               " Syntax highlighting
set background=dark

" Spellcheck
set nospell             " Disable spellchecking by default (F1 toggles it)
set spelllang=en_us,en_gb

" Clipboard
set clipboard=unnamed

" Session
set sessionoptions=blank
set sessionoptions+=buffers
set sessionoptions+=curdir
set sessionoptions+=globals
set sessionoptions+=help
set sessionoptions+=localoptions
set sessionoptions+=resize
set sessionoptions+=tabpages
set sessionoptions+=winpos
set sessionoptions+=winsize
" TODO: shada?

" Python paths
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"------------------------------------------------------------------------------
" Key mappings
"------------------------------------------------------------------------------
let mapleader = ','     " <Leader>
let maplocalleader = ','

" Create/close buffer
nnoremap <Leader>bn :enew<CR>
nnoremap <Leader>B :bprevious <BAR> bdelete! #<CR>
nnoremap <Leader>BB :bprevious <BAR> bwipeout! #<CR>

" Move to previous/next buffer
noremap <silent> J :bnext<CR>
noremap <silent> K :bprevious<CR>

" Create/close tab
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>

" Move to previous/next tab (also possible with airline-tabline)
noremap <silent> H gT
noremap <silent> L gt

" Join lines by <Leader>+j because J is mapped to 'go to previous tab'
noremap <Leader>j J

" Moving cursor through wrapped lines
" http://stackoverflow.com/a/21000307/2580955
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Quit
noremap <silent> Q :q!<CR>

" Save all buffers
nnoremap <silent> <C-s> :w<CR>:wa<CR>
inoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>
vnoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>

" Windows switching
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
vnoremap <A-j> <C-\><C-n><C-w>j
vnoremap <A-k> <C-\><C-n><C-w>k
vnoremap <A-h> <C-\><C-n><C-w>h
vnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-l> <C-\><C-n><C-w>l
cnoremap <A-j> <C-\><C-n><C-w>j
cnoremap <A-k> <C-\><C-n><C-w>k
cnoremap <A-h> <C-\><C-n><C-w>h
cnoremap <A-l> <C-\><C-n><C-w>l

" Terminal
if has('nvim')
    nnoremap <silent> <Leader>to :terminal<CR>
    nnoremap <silent> <Leader>tvo :vsplit term://$SHELL<CR>
    nnoremap <silent> <Leader>tho :split term://$SHELL<CR>
    tnoremap <A-q> <C-\><C-n>
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-l> <C-\><C-n><C-w>l
    " TODO set title
    au BufWinEnter,WinEnter term://* startinsert
    au WinEnter *pid:* call feedkeys('i')
endif

" Disable search highlight
noremap <silent> <Space> :silent nohlsearch<CR>

" Switch CWD to the directory of the open buffer
noremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

" Open config files in tabs
nnoremap <Leader>zsh :tabnew ~/.zshrc<CR>
nnoremap <Leader>nvim :tabnew ~/.config/nvim/init.vim<CR>

" Reload nvim's config
nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>

"Toggle spell checker (spell toggle)
nnoremap <silent> <Leader>st :set spell!<CR>:set spell?<CR>

" Toggle spell dictionary between English and Slovak (spell lang toggle)
function! s:ToggleSpelllang()
    if &spelllang =~ 'en'
        set spelllang=sk
    else
        set spelllang=en_us,en_gb
    endif
    set spelllang?
endfunction
nnoremap <silent> <Leader>slt :call <SID>ToggleSpelllang()<CR>

" Toggle the display of unprintable characters (unprintable toggle)
nnoremap <silent> <Leader>ut :set list!<CR>:set list?<CR>

" Toggle highlighting of characters exceeding textwidth (long line toggle)
" TODO
au BufEnter * hi ExceedCharsGroup guibg=darkblue guifg=white ctermbg=darkblue ctermfg=white
function! s:ToggleExceedingCharsHighlight()
    if exists('w:long_line_match')
        silent! call matchdelete(w:long_line_match)
        unlet w:long_line_match
        echo 'Disable highlighting'
    elseif &textwidth > 0
        let w:long_line_match=matchadd('ExceedCharsGroup', '\%>' . &textwidth . 'v.\+', -1)
        let w:long_line_match=matchadd('ExceedCharsGroup', '\%>80v.\+', -1)
        echo 'Enable highlighting after 80 characters'
    endif
endfunction
nnoremap <silent> <Leader>llt :call <SID>ToggleExceedingCharsHighlight()<CR>

" Toggle line wrapping (line wrap toggle)
nnoremap <silent> <Leader>lwt :set nowrap!<CR>:set nowrap?<CR>

" Toggle the display of colorcolumn (color column toggle)
function! s:ToggleColorColumn()
    if &colorcolumn > 0
        set colorcolumn=""
    elseif &textwidth > 0
        let &colorcolumn = &textwidth
    else
        set colorcolumn=80
    endif
endfunction
nnoremap <silent> <Leader>cct :call <SID>ToggleColorColumn()<CR>

" Toggle hexdump view of binary files (hex view toggle)
function! s:ToggleHexdumpView()
    if &filetype ==# 'xxd'
        " Turn off hexdump view
        silent! :%!xxd -r
        set filetype=
    else
        " Turn on hexdump view
        silent! :%!xxd
        set filetype=xxd
    endif
endfunction
nnoremap <silent> <Leader>hvt :call <SID>ToggleHexdumpView()<CR>

" Toggle objdump view of binary files (obj view toggle)
function! s:ToggleObjdumpView()
    if &filetype ==# 'objdump'
        " Turn off objdump view
        " Replace the buffer with the original content of the buffer, stored in
        " the Z register
        normal! ggVG"ZP
        set filetype=
        set noreadonly
    else
        " Turn on objdump view.
        " Cut the original content of the buffer into the Z register so I can
        " use it later to restore the original content
        normal! ggVG"Zd
        " Get the output from objdump and paste it into the buffer
        silent! :read !objdump -S %
        " Go to the beginning of the file
        normal! ggdd
        " Set a proper file type to enable syntax highlighting through
        " http://www.vim.org/scripts/script.php?script_id=530
        set filetype=objdump
        " Prevent accidental overwrites
        set readonly
    endif
endfunction
nnoremap <silent> <Leader>ovt :call <SID>ToggleObjdumpView()<CR>

" Toggle relative/absolute numbers (number toggle)
nnoremap <silent> <Leader>nt :set relativenumber!<CR>:set relativenumber?<CR>

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
" zfz.vim
let g:fzf_command_prefix = 'FZF'
nnoremap <Leader>bo :FZFBuffers<CR>
nnoremap <Leader>fo :FZFFiles<CR>
nnoremap <Leader>go :FZFGFiles<CR>
nnoremap <Leader>wo :FZFWindows<CR>
nnoremap <Leader>co :FZFBCommits<CR>
nnoremap <Leader>sho :FZFHistory/<CR>
nnoremap <Leader>cho :FZFHistory:<CR>
imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-j> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)

" vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" vim-session
let g:session_directory = '~/.nvim/session'
let g:session_command_aliases = 1
nnoremap <Leader>so :SessionOpen<Space>
nnoremap <Leader>ss :SessionSave<Space>
nnoremap <Leader>sd :SessionDelete<CR>
nnoremap <Leader>sc :SessionClose<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme = 'wombat'
" Airline - tabline
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9
nmap <A-Tab> <Plug>AirlineSelectNextTab
" TODO nmap <A-S-Tab> <Plug>AirlineSelectPrevTab

" Neomake
" TODO

let g:solarized_termcolors=256
colorscheme solarized
