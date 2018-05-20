
"-------------------------------------------------------------"
"  I own nothing, but I spent a lot of time setting it up     "
"                       regards,                              " 
"                    Deepak Chethan                           "
"-------------------------------------------------------------"


"-----------------------------"
"   Setting few colors        "
"-----------------------------"
syntax enable           
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE




"----------------------------"
"   Making things look good  "
"----------------------------"

set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]

"-------------------------------"
" Setting up spaces and tabs    "
"-------------------------------"

set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

"---------------------------------"
"       Some ui settings          "
"---------------------------------" 

set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃

"---------------------------------"
"         Search Setup            "
"---------------------------------"

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

"---------------------------------"
"     Folding Settings            "
"---------------------------------"

set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1

"----------------------------------"
"        Line Shortcuts            "
"----------------------------------"

nnoremap j gj
nnoremap k gk
nnoremap C `[v`]
inoremap Q <esc>



"----------------------------------"
"    Leader Shortcuts              "
"----------------------------------"
 
let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>et :exec ":vsp /Users/dblack/notes/vim/" . strftime('%m-%d-%y') . ".md"<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>u :MundoToggle<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>q :<esc>
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make! 
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>g :call RunGoFile()<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

"---------------------------------------"
"       ctrl+p setup                    "
"---------------------------------------"

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'

"-------------------------"
"       Syntastic         "
"-------------------------"
       
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'


"----------------------------"
"   AutoGroups               "
"----------------------------"

augroup configgroup
    augroup configgroup

    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

"---------------------------------------"
"              Testing                  "
"---------------------------------------"

 
let test#strategy = 'neovim'
let test#python#runner = 'nose'





"--------------------------------------"
"        Vim Plugins                   "  >> need vim-plug-git
"--------------------------------------"

call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'janko-m/vim-test'
Plug 'keith/swift.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
call plug#end()




