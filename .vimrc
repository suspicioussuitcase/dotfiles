syntax enable
set number
set ruler
set showcmd

" tab size = 4, spaces instead of tabs, and auto indent
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" enable folding
set foldmethod=syntax

" save foldings
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" global clipboard
set clipboard+=unnamed

" disable swap files
set noswapfile

" Don't fold anything when opening a new buffer
set foldlevelstart=99

" open splits on the right
set splitright

let mapleader = ","

" Don't wrap lines
set nowrap

" Change buffers without writing changes to a file
set hidden

" Case insensitive file completion
set wildignorecase

" -------------------------------------- Key mappings
" Horizontal scrolling
nnoremap <C-l> 2zl
nnoremap <C-h> 2zh

" insert a new line without switching to insert mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Shortcuts for :w 
inoremap <c-s> <c-o>:w<CR>
noremap <c-s> :w<CR>
vnoremap <c-s> <ESC>:w<CR>gv

" Shortcut for <Esc>
inoremap jk <Esc>

" Keep selections
vnoremap > >gv
vnoremap < <gv

" Comment shortcut for insert mode
imap <F2> <c-_><c-_>

" better j and k
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Easy split navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Make Y behave like other capitals
nnoremap Y y$

" map <leader>p to substitute the selection with yanked text in visual mode
xnoremap <leader>p "_dP

" faster substitution with yanked text
nmap S viw<leader>p

" -------------------------------------- Key mappings end


" Don't screw up folds when inserting text that might affect them,
" until leaving insert mode.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


" -------------------------------------- vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
Plugin 'twerth/ir_black'
Plugin 'qualiabyte/vim-colorstepper'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kevinw/pyflakes-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'xuqix/h2cppx'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-lua-ftplugin.git'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/cscope.vim'

" Turn filetype functionality back on
filetype on
filetype plugin on
filetype plugin indent on

" -------------------------------------- vundle end


" -------------------------------------- Style config
" ------------------ General
set t_Co=256
set background=dark
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set laststatus=2

" ------------------ Solarized
let g:solarized_termtrans=1
let g:solarized_hitrail=1
let g:solarized_termcolors=256
colorscheme solarized

highlight SignColumn ctermbg=black
highlight CursorLineNr ctermbg=black cterm=bold

" Solid background color for YCM indicators
highlight YcmWarningSign ctermbg=black ctermfg=red
highlight YcmErrorSign ctermbg=black ctermfg=red
highlight YcmErrorSection cterm=underline ctermfg=darkred

" ------------------ Custom
" colorscheme peachpuff
" highlight LineNr ctermfg=darkgray
" highlight SignColumn ctermbg=NONE
"
" let g:airline_theme = 'hybridline'

" autocmd BufWinEnter * highlight airline_tabsel ctermfg=black
" autocmd BufWinEnter * highlight airline_tabmod ctermfg=black
" autocmd BufWinEnter * highlight airline_tabhid ctermfg=gray

" highlight airline_c ctermfg=gray
" highlight airline_x ctermfg=gray

" Transparent background color for YCM indicators
" highlight YcmWarningSign ctermbg=none ctermfg=red
" highlight YcmErrorSign ctermbg=none ctermfg=red
" highlight YcmErrorSection ctermbg=none cterm=underline ctermfg=red

" ------------------ Cursorline
set cursorline
highlight CursorLine ctermbg=Black cterm=NONE

" -------------------------------------- Style config end


" -------------------------------------- Plugin configuration
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols = {}
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = '⎇ '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'


" easymotion
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" NERDTree shortcut
command NT NERDTreeToggle
let NERDTreeWinPos = "right"

" YCM
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR><CR>
inoremap <F5> <c-o>:YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_always_populate_location_list = 1

" SimpylFold
let g:SimpylFold_fold_docstring = 0
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" pyflakes
highlight SpellBad term=underline ctermfg=160 gui=undercurl guisp=Orange 

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" h2cppx
command TOCPP H2cppx

" easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_resolve_links = 1

" tagbar
command TB TagbarToggle

" ColorStepper Keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload

" FSwitch
nnoremap <leader>gf :FSHere<CR>

" UltiSnip
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" vim-cscope
let g:cscope_auto_update = 0
autocmd BufWritePost *.c,*.h,*.cpp,*.hpp call cscope#updateDB()

nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>


" -------------------------------------- Plugin configuration end

" buffer shortcuts
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bl :b#<CR>
nnoremap <leader>bb :BuffergatorOpen<CR>

" Delete current buffer and open the next or an empty buffer
" instead of closing the window
nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
