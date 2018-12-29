"------------------------------------------------------------------------------
" Plug (https://github.com/junegunn/vim-plug)
"------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'ervandew/supertab'
Plug 'dietsche/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vimwiki/vimwiki'

Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-skeletons', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}

Plug 'tomlion/vim-solidity'

Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
"Plug 'avdgaag/vim-phoenix'

Plug 'autozimu/LanguageClient-neovim', {'for': 'rust', 'do': ':UpdateRemotePlugins'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}

Plug 'cespare/vim-toml', {'for': 'toml'}

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
set magic               " Use 'magic' patterns
set nostartofline       " Keep the cursor's column when jumping to other rows
set nojoinspaces        " Insert just one space joining lines with J
set lazyredraw          " Don't redraw while executing macros (for performance)
set showcmd             " Show info about the current command
set showmatch           " Show matching brackets when typing them
set nomodeline          " Modelines have been a source of vulnerabilities
set iskeyword+=-        " Makes foo-bar one word
set mouse=a             " Allow mouse

" No annoying sound on errors
set noerrorbells novisualbell t_vb=

" backups and undo
set nobackup            " Disable backups when writing to a file
set nowritebackup       " Disable auto backup before overwriting a file
set directory=~/.nvim/swap//    " Directory for swap files
set swapfile            " Enable backups of changed buffers
set undodir=~/.nvim/undo//      " Directory for undo history
set undofile            " Enable backups of undos
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
set softtabstop=4       " Causes backspace to delete 4 spaces
set shiftwidth=4        " Number of spaces to use for each step of indent
set shiftround          " Round indent to multiple of shiftwidth
set expandtab           " Expand tab with spaces

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

" Spellcheck
set nospell             " Disable spellchecking by default
set spelllang=en_us,en_gb

" Clipboard
if has('clipboard')
    set clipboard=unnamed
else
    " Yanked text is propagated to the host (OSX)
    function! PropagatePasteBufferToOSX()
        let @n=getreg('"')
        call system('rpbcopy', @n)
        echo "remote copy done"
    endfunction

    " System clipboard from the host (OSX) is pasted
    function! PopulatePasteBufferFromOSX()
        let @" = system('rpbpaste')
        echo "remote paste done"
    endfunction

    nnoremap <leader>9 :call PropagatePasteBufferToOSX()<cr>
    nnoremap <leader>0 :call PopulatePasteBufferFromOSX()<cr>
endif

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

"------------------------------------------------------------------------------
" Colors
"------------------------------------------------------------------------------
syntax on               " Syntax highlighting
"set background=dark
colorscheme molokai

hi ExceedChars ctermfg=white ctermbg=darkblue

"------------------------------------------------------------------------------
" Key mappings
"------------------------------------------------------------------------------
let mapleader=','       " <leader>
let maplocalleader=','

" Create/close buffer
nnoremap <leader>bn :enew<CR>
nnoremap <leader>B :bprevious <BAR> bwipeout! #<CR>
nnoremap <silent> Z :bprevious <BAR> bdelete! #<CR>

" Move to previous/next buffer
noremap <silent> J :bnext<CR>
noremap <silent> K :bprevious<CR>

" Create/close tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>T :tabclose<CR>

" Move to previous/next tab (also possible with airline-tabline)
noremap <silent> H gT
noremap <silent> L gt

" Join lines by <leader>+j because J is mapped to 'go to previous tab'
noremap <leader>j J

" Moving cursor through wrapped lines
" http://stackoverflow.com/a/21000307/2580955
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Quit
noremap <silent> Q :q!<CR>

" Search and replace
nnoremap <leader>r :%s//g<Left><Left>

" Save all buffers
nnoremap <silent> <C-s> :w<CR>:wa<CR>
inoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>
vnoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>

" Windows switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Terminal
nnoremap <silent> <leader>to :terminal<CR>
nnoremap <silent> <leader>tvo :vsplit term://$SHELL<CR>
nnoremap <silent> <leader>tho :split term://$SHELL<CR>

" Leave insert mode in terminal (Alt-q)
tnoremap <A-q> <C-\><C-n>

" Terminal windows switching
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
" TODO set terminal title
" Start insert mode when switched to terminal
" au BufWinEnter,WinEnter term://* startinsert
" au WinEnter *pid:* call feedkeys('i')

" Disable search highlight
noremap <silent> <Space> :silent nohlsearch<CR>

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

" Open config files in tabs
nnoremap <leader>zsh :tabnew ~/.zshrc<CR>
nnoremap <leader>nvim :tabnew ~/.config/nvim/init.vim<CR>

" Reload nvim's config
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>

"Toggle spell checker (spell toggle)
nnoremap <silent> <leader>st :set spell!<CR>:set spell?<CR>

" Toggle spell dictionary between English and Slovak (spell lang toggle)
function! s:ToggleSpelllang()
    if &spelllang =~ 'en'
        set spelllang=sk
    else
        set spelllang=en_us,en_gb
    endif
    set spelllang?
endfunction
nnoremap <silent> <leader>slt :call <SID>ToggleSpelllang()<CR>

" Toggle the display of unprintable characters (unprintable toggle)
nnoremap <silent> <leader>ut :set list!<CR>:set list?<CR>

" Toggle highlighting of characters exceeding textwidth (long line toggle)
function! s:ToggleExceedingCharsHighlight()
    if exists('w:long_line_match')
        silent! call matchdelete(w:long_line_match)
        unlet w:long_line_match
        echo 'Disable highlighting.'
    elseif &textwidth > 0
        let w:long_line_match=matchadd('ExceedChars', '\%>' . &textwidth . 'v.\+', -1)
        echo 'Enable highlighting after ' . &textwidth . ' characters.'
    else
        let w:long_line_match=matchadd('ExceedChars', '\%>80v.\+', -1)
        echo 'Enable highlighting after 80 characters.'
    endif
endfunction
nnoremap <silent> <leader>llt :call <SID>ToggleExceedingCharsHighlight()<CR>

" Toggle line wrapping (line wrap toggle)
nnoremap <silent> <leader>lwt :set nowrap!<CR>:set nowrap?<CR>

" Toggle the display of colorcolumn (color column toggle)
function! s:ToggleColorColumn()
    if &colorcolumn > 0
        set colorcolumn=""
    elseif &textwidth > 0
        let &colorcolumn=&textwidth
    else
        set colorcolumn=80
    endif
endfunction
nnoremap <silent> <leader>cct :call <SID>ToggleColorColumn()<CR>

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
nnoremap <silent> <leader>hvt :call <SID>ToggleHexdumpView()<CR>

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
nnoremap <silent> <leader>ovt :call <SID>ToggleObjdumpView()<CR>

" Toggle relative/absolute numbers (number toggle)
nnoremap <silent> <leader>nt :set relativenumber!<CR>:set relativenumber?<CR>

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
"FZF
" Add fzf binary to runtime path
set rtp+=/usr/local/opt/fzf

" zfz.vim
let g:fzf_command_prefix='FZF'
let g:fzf_layout={'window': 'enew'}
nnoremap <leader>bo :FZFBuffers<CR>
nnoremap <leader>fo :FZFFiles<CR>
nnoremap <leader>go :FZFGFiles<CR>
nnoremap <leader>wo :FZFWindows<CR>
nnoremap <leader>co :FZFBCommits<CR>
nnoremap <leader>sho :FZFHistory/<CR>
nnoremap <leader>cho :FZFHistory:<CR>
imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-j> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)

" netrw
let g:netrw_banner=0
let g:netrw_home='~/.nvim/netrw'
noremap <leader><space> :Lex<CR>

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" vim-session
let g:session_directory='~/.nvim/session'
let g:session_command_aliases=1
let g:session_autosave='no'
nnoremap <leader>so :SessionOpen<Space>
nnoremap <leader>ss :SessionSave<Space>
nnoremap <leader>sd :SessionDelete<CR>
nnoremap <leader>sc :SessionClose<CR>

" lightline
let g:lightline = {
    \   'colorscheme': 'wombat',
    \   'active': {
    \       'left':[ [ 'mode', 'paste' ],
    \                [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ]
    \   },
    \   'component': {
    \       'lineinfo': ' %3l:%-2v',
    \    },
    \   'component_function': {
    \       'gitbranch': 'fugitive#head',
    \   }
    \}
let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}
let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}

" gitgutter (this is to have faster refresh, default is 4000 ms!)
set updatetime=100      " in ms
let g:gitgutter_max_signs=1000

" Vimwiki
let g:vimwiki_list=[{'path': '~/vimwikitest/'}]

" Neomake
" Neomake - elixir
au BufWritePost *.ex Neomake
au BufWritePost *.exs Neomake
let g:neomake_elixir_mix_maker={
      \ 'exe': 'mix',
      \ 'args': ['compile', '%:p', '--warnings-as-errors'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }
let g:neomake_elixir_credo_maker={
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m'
      \ }
let g:neomake_elixir_enabled_makers=['mix']
let g:neomake_verbose=2
let g:neomake_open_list=2
let g:neomake_list_height=5
let g:neomake_serialize=1
let g:neomake_serialize_abort_on_error=1

" elm-vim
let g:elm_jump_to_error=1
let g:elm_make_show_warnings=0
let g:elm_syntastic_show_warnings=0
let g:elm_format_autosave=1
let g:elm_browser_command=""
" TODO: E776: no location list

" rust.vim
let g:rustfmt_autosave=1

" rust language server
let g:LanguageClient_serverCommands={
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart=1

"------------------------------------------------------------------------------
" Autocmd
"------------------------------------------------------------------------------
augroup file_types
    au!
    au BufNewFile,BufRead relx.config setl filetype=erlang
    au BufNewFile,BufRead *.envrc setl filetype=sh
augroup end

augroup elixir
    au!
    au FileType elixir setl tabstop=2
    au FileType elixir setl softtabstop=2
    au FileType elixir setl shiftwidth=2
    " TODO: place custom mappings to 'after' directory
    au FileType elixir nunmap <buffer> <silent> K
    au FileType elixir nnoremap <buffer> <silent> <C-K> :call alchemist#exdoc()<CR>
    au FileType elixir noremap <silent> K :bprevious<CR>
augroup end

" TODO: eelixir

augroup erlang
    au!
    au FileType erlang setl tabstop=4
    au FileType erlang setl softtabstop=4
    au FileType erlang setl shiftwidth=4
augroup end

augroup elm
    au!
    au FileType elm setl tabstop=4
    au FileType elm setl softtabstop=4
    au FileType elm setl shiftwidth=4
    au FileType elm nnoremap <leader>m <Plug>(elm-make)
    au FileType elm nnoremap <leader>M <Plug>(elm-make-main)
    au FileType elm nnoremap <leader>t <Plug>(elm-test)
    au FileType elm nnoremap <leader>c <Plug>(elm-repl)
    au FileType elm nnoremap <leader>e <Plug>(elm-error-detail)
    au FileType elm nnoremap <leader>d <Plug>(elm-show-docs)
augroup end

augroup rust
    au!
    au FileType rust setl tabstop=4
    au FileType rust setl shiftwidth=4
    au FileType rust setl softtabstop=4
    au FileType rust setl textwidth=80
    au FileType rust setl signcolumn=yes
    " Rust Language server commands
    au FileType rust nnoremap <leader>rr :call LanguageClient_textDocument_rename()<CR>
    au FileType rust nnoremap <leader>h :call LanguageClient_textDocument_hover()<CR>
    au FileType rust nnoremap <leader>d :call LanguageClient_textDocument_definition()<CR>
    au FileType rust nnoremap <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
    au FileType rust nnoremap <leader>f :call LanguageClient_textDocument_formatting()<CR>
    au FileType rust nnoremap <leader>a :call LanguageClient_textDocument_codeAction()<CR>
augroup end

augroup gitcommit
    au!
    au FileType gitcommit setl spell
    au FileType gitcommit setl expandtab
    au FileType gitcommit setl tabstop=4
    au FileType gitcommit setl softtabstop=4
    au FileType gitcommit setl shiftwidth=4
augroup end

augroup html
    au!
    au FileType html setl tabstop=2
    au FileType htlm setl softtabstop=2
    au FileType html setl shiftwidth=2
augroup end

augroup css
    au!
    au FileType css setl tabstop=2
    au FileType css setl softtabstop=2
    au FileType css setl shiftwidth=2
augroup end

augroup json
    au!
    au FileType json setl tabstop=2
    au FileType json setl softtabstop=2
    au FileType json setl shiftwidth=2
augroup end

augroup markdown
    au!
    au FileType markdown setl expandtab
    au FileType markdown setl tabstop=2
    au FileType markdown setl softtabstop=2
    au FileType markdown setl shiftwidth=2
    au FileType markdown setlocal textwidth=80
augroup end

augroup viml
    au!
    au FileType vim setlocal textwidth=80
augroup end

" Delete trailing white space on save
func! DeleteTrailing()
    exe 'normal mz'
    %s/\s\+$//ge
    exe 'normal `z'
endfunc

augroup whitespace
    au BufWrite * silent call DeleteTrailing()
augroup end

" Allow loading local executing rc files (looks for .nvimrc)
set exrc
" Disallow use of :autocmd, shell and write command in local .nvimrc
set secure

