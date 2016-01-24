set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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
Plugin 'inside/vim-grep-operator'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'cscope.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ===== Plugins configuration =====

" solarized config
syntax enable
set background=dark
colorscheme solarized

"easytags config
set tags=./.tags_ctags;
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
augroup NERDTree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"CtrlP config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|assessments|result|variant-dir|external)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

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
nmap <silent> <leader>j :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <silent> <leader>k :BuffergatorMruCycleNext<cr>
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

" Grep Operator mappings
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
                
" ===== General stuff =====
"
" Use Enter to add a new line without entering instert mode
nnoremap <CR> o<Esc>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
augroup quickfix_fix
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" Autoclose omnicomplete split window
augroup complete_fix
    autocmd!
    autocmd CompleteDone * pclose
augroup END

" Create hidden buffers on buffer change if modified
set hidden

" Ignore dirs when using grep
let Grep_Skip_Dirs = '.git .hg. svn _site assessments result variant-dir external' 

" Show diff changes in red
highlight DiffChange cterm=none ctermfg=fg ctermbg=DarkGray gui=none guifg=fg guibg=Red

" Show the curser line (doesn't work in term?)
set cursorline

" Set status bar
set statusline=%F                           " Path to the file
set statusline+=%{fugitive#statusline()}    " Git branch
set statusline+=%=                          " Switch to the right side
set statusline+=%l                          " Current line
set statusline+=/                           " Separator
set statusline+=%L                          " Total lines

set laststatus=2
hi StatusLine ctermbg=green ctermfg=darkgrey 

" Open vertical splits on the right
set splitright

" Use spacebar to hide search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" No timeout after leader key pressed
set notimeout

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number

" Auto complete very magic searches
nnoremap / /\v
cnoremap %s/ %s/\v

" Limit text width
set textwidth=170

" .vimrc quick edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Use jk t exit insert mode instead of esc
inoremap jk <esc>
"inoremap <esc> <nop>

" Replace standard outer text-objects to not include whitespaces
onoremap <silent> a" :<C-U>normal! vi"loh<cr>
onoremap <silent> a' :<C-U>normal! vi'loh<cr>
onoremap <silent> a) :<C-U>normal! vi)loh<cr>
onoremap <silent> a( :<C-U>normal! vi(loh<cr>
onoremap <silent> a{ :<C-U>normal! vi{loh<cr>
onoremap <silent> a} :<C-U>normal! vi}loh<cr>
onoremap <silent> a] :<C-U>normal! vi]loh<cr>
onoremap <silent> a[ :<C-U>normal! vi[loh<cr>

" Define text-objects for next groups
onoremap <silent> an" :<C-U>normal! f"vi"loh<cr>
onoremap <silent> an' :<C-U>normal! f'vi'loh<cr>
onoremap <silent> an( :<C-U>normal! f(vi(loh<cr>
onoremap <silent> an) :<C-U>normal! f(vi)loh<cr>
onoremap <silent> an{ :<C-U>normal! f{vi{loh<cr>
onoremap <silent> an} :<C-U>normal! f{vi}loh<cr>
onoremap <silent> an[ :<C-U>normal! f[vi[loh<cr>
onoremap <silent> an] :<C-U>normal! f[vi]loh<cr>

onoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in( :<C-U>normal! f(vi(<cr>
onoremap <silent> in) :<C-U>normal! f(vi)<cr>
onoremap <silent> in{ :<C-U>normal! f{vi{<cr>
onoremap <silent> in} :<C-U>normal! f{vi}<cr>
onoremap <silent> in[ :<C-U>normal! f[vi[<cr>
onoremap <silent> in] :<C-U>normal! f[vi]<cr>
