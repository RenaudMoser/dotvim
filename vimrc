set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'tpope/vim-surround' 
Plugin 'tpope/vim-repeat' 
Plugin 'tpope/vim-unimpaired' 
Plugin 'tpope/vim-fugitive' 
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'bkad/CamelCaseMotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'yegappan/grep'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'cscope.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 

" ===== Plugins configuration =====

" solarized config
syntax enable
set background=dark
colorscheme solarized

"easytags config
set tags=tags;/
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
nnoremap <silent> <leader>] :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr> 

"taglist config
map <C-l> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1

"NERDTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"CtrlP config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|assessments|result|variant-dir|external)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
let Grep_Skip_Dirs = '.git .hg. svn _site assessments result variant-dir external' 

" No root directory lookup, always use the working dir
let g:ctrlp_working_path_mode = 0
" Allow to provide an argument to <c-o> to choose how to open multiple files
let g:ctrlp_arg_map = 1

"BufferGattor config
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
" Go to the previous buffer open
nmap <silent> <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <silent> <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <silent> <leader>bl :BuffergatorOpen<cr>

"cscope mapping
"set cscopetag
"set csto=0
"if 	ilereadable("cscope.out")
"	cs add cscope.out  
"elseif $CSCOPE_DB != ""
"	cs add $CSCOPE_DB
"endif
"set cscopeverbose  
"
"nmap <leader>fs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>fg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>fc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ft :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>fe :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ff :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"nmap <leader>fi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"nmap <leader>fd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" ===== General stuff =====
"
" Use Enter to add a new line without entering instert mode
nmap <CR> o<Esc>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Autoclose omnicomplete split window
autocmd CompleteDone * pclose

" Create hidden buffers on buffer change if modified
set hidden
highlight DiffChange cterm=none ctermfg=fg ctermbg=DarkGray gui=none guifg=fg guibg=Red
set cursorline
set statusline+=%F
set statusline+=%{fugitive#statusline()}
set laststatus=2
hi StatusLine ctermbg=green ctermfg=darkgrey 
set splitright
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set notimeout
