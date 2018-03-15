" Get rid of Vi compatibility. Set first!
set nocompatible

" Required for Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Packages
Plugin 'gmarik/Vundle.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/deoplete.nvim'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'gregsexton/MatchTag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'qualiabyte/vim-colorstepper'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'prettier/vim-prettier'

" Themes
Plugin 'flazz/vim-colorschemes'

" Language Support
Plugin 'marijnh/tern_for_vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'suan/vim-instant-markdown'

" End of Vundle
call vundle#end()
filetype plugin indent on


" --------------------------------------------------
" General Settings
" --------------------------------------------------

" Search
set incsearch
set hlsearch
set ignorecase smartcase
nnoremap <CR> <NOP>
nnoremap <CR> :nohlsearch<CR><CR>

" Leave some space when scrolling
set scrolloff=10

" disable swap files
set noswapfile

" Indenting
"set copyindent
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show line numbers
set number

" Show cursor line
set cursorline

" Colors
"colorscheme atom-dark
colorscheme OceanicNext
" colorscheme lucius
syntax enable

" reload files when changed externally
set autoread

" Fix slow 0 inserts
set timeout timeoutlen=1000 ttimeoutlen=50

" Word wrapping for sentences
set linebreak

" tab style
set guioptions-=e

" --------------------------------------------------
" Bindings
" --------------------------------------------------

" Disable the arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remap the ; key
map ; :

" Remap the leader key
let mapleader = "\<Space>"

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Rotate windows
nnoremap <leader>w <c-w>r

" remap tab keys
nnoremap H gT
nnoremap L gt

" remap escape key to shift + enter
inoremap <S-CR> <Esc>

" Move up and down word wrapped sentences
nnoremap j gj
nnoremap k gk

" Toggle spelling
nnoremap <leader>s :set spell!<cr>

" Easy access to the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Reload vimrc
nnoremap <leader>rv :so $MYVIMRC<cr>

" Reformat file
nnoremap <leader>ff mzgg=G`z<CR>

" Reformat XML
nnoremap <leader>fx !%xmllint --format --recover -<CR>

" Reformat JS
nnoremap <leader>fx !%xmllint --format --recover -<CR>

" Reformat HTML
nnoremap <leader>jj :normal! gggqG<CR>

" Reformat JSON
nnoremap <leader>fj !%python -m json.tool<CR>

" Change quotes
map <leader>q :'<,'>s/"/'/g<CR>
" map <leader>" :'<,'>s/'/"/g<CR>

" Toggle background
map <leader>bb :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Toggle case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


" --------------------------------------------------
" Auto Commands
" --------------------------------------------------

" Change file types to html
autocmd BufNewFile,BufRead *.aspx set filetype=html
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.hbs set filetype=html

" Use prettier for formatting
" autocmd FileType javascript set formatprg=prettier\ --stdin\ --tab-width\ 4\ --single-quote\ --trailing-comma\ all

" Format file on every save
"autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"


" 2 spaces for certain filetypes
autocmd FileType pug setlocal sw=2 ts=2 sts=2
autocmd FileType stylus setlocal sw=2 ts=2 sts=2
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType json setlocal sw=2 ts=2 sts=2
autocmd FileType jsx setlocal sw=2 ts=2 sts=2
autocmd FileType html setlocal sw=2 ts=2 sts=2
autocmd FileType markdown setlocal sw=2 ts=2 sts=2

" Add jasmine snippets
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine

" --------------------------------------------------
" plugins
" --------------------------------------------------
" Deoplete
let g:deoplete#enable_at_startup = 1


" Prettier
let g:prettier#config#tab_width = 2
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue Prettier

" Auto format
" let g:formatdef_my_custom_js = '"prettier --stdin --tab-width 4 --single-quote --trailing-comma es5"'
" let g:formatters_javascript = ['my_custom_js']
let g:formatdef_my_custom_html = '"tidy -i"'
let g:formatters_html = ['my_custom_html']

" delimiteMate
let delimitMate_expand_cr = 1
"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<c-b>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

"let g:ycm_key_list_previous_completion = ['<Up>']

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<tab>'
"set completeopt=menu,menuone
set completeopt-=preview


" Syntastic
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['']
" uses local eslint if exists
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif

" autofix with eslint
let g:syntastic_javascript_eslint_args = ['--fix']
function! SyntasticCheckHook(errors)
  checktime
endfunction


" Ctrl P
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_open_multiple_files = '5vjr'
let g:ctrlp_working_path_mode = 0
set wildignore+=*/dist/*,*/node_modules/*,*/bower_components/*,*/tmp/*

" Taboo
set sessionoptions+=tabpages,globals

" Nerd Tree
nmap <S-Tab> :NERDTreeToggle<CR>
autocmd FileType nerdtree nmap <buffer> <S-CR> go

" Nerd Commenter
let NERDSpaceDelims=1

" vim airline
set laststatus=2

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" vim notes
let g:notes_list_bullets = ['•']  

" --------------------------------------------------
" refactoring
" --------------------------------------------------
map <leader>ro 0wdt.xwwi<BS><BS><BS>: <ESC>$A<BS>,<ESC>j


" javascript: replace require statement with import
map <leader>ri 0ciwimportwwciwfromwdt't)lxj
