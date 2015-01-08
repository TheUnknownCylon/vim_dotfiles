""""""""""""""""""
" Remco vim files
"
set encoding=utf-8
set exrc
set secure

""""""""""""""""""""""""""""""""""""
" Vundle
"  Plugin manager. Important remark: all vundle (Bundle) directives should be
"  placed before plugin indent on for some plugins to function correctly
""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Color theme
Bundle 'Mustang2'

" Show open buffers in command line
Bundle 'bling/vim-bufferline'

" NERDTree File browser
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" Show tags in a separate buffer/window
Bundle 'majutsushi/tagbar.git'

" Code completion (w/ completions for the C family)
Bundle "oblitum/YouCompleteMe"

" Code checker (w/ excelent support for the C family)
Bundle 'scrooloose/syntastic'

" Code snippets
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" Nice status bar
Bundle 'itchyny/lightline.vim'

" Easily comment/uncode code
Bundle 'scrooloose/nerdcommenter'

" Git support
Bundle 'tpope/vim-fugitive'

" Colors/formats indents nicely (<leader>ig)
Bundle 'nathanaelkane/vim-indent-guides'

" Highlight trailing whitespaces (clear all by :StripWhitespace)
Bundle 'ntpeters/vim-better-whitespace'

" Autoatically adds closing brackets a la *IDE
Bundle "delimitMate.vim"

" Automatically close HTML/XML tags after typing >
" Disabled since it conflicts with codesnippets.
" Bundle "sukima/xmledit"

" Press % to go to closed (HTML) tag
Bundle "edsono/vim-matchit"

" Format the source code by calling :Autoformat
Bundle "Chiel92/vim-autoformat"

" Control-P, finding files
"Bundle "kien/ctrlp.vim.git"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimproc.vim"

filetype plugin indent on

""""""""""""""""""""""""""""""""""""
" Basic config
""""""""""""""""""""""""""""""""""""
set scrolloff=5
set nowrap
set nocompatible
set modelines=0
set number
set visualbell
set t_vb=
set showcmd
set hidden "Hide buffers, instead of closing them
set showmode
set title
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set wrapscan
set mouse=a
set nospell
set splitbelow

set wildmode=longest,list,full
set wildmenu

""""""""""""""""""""""""""""""""""""
" colors and scheme
""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme Mustang
set t_Co=256
set background=dark
highlight ColorColumn ctermbg=235 guibg=#262626

""""""""""""""""""""""""""""""""""""
" Code style options (TODO: Should be project specific)
"""""""""""""""""""""""""""""""""""""
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set colorcolumn=80,120

""""""""""""""""""""""""""""""""""""
" Code folding
""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""
let mapleader=","

" disable the arrow keys for normal cursor navigation
"  (enforces me to NOT use them :)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""
" CTags
" Look for the first tags file from the current directory
" recursively upwards
""""""""""""""""""""""""""""""""""""
set tags=./tags,tags;$HOME

""""""""""""""""""""""""""""""""""""
" CScope
""""""""""""""""""""""""""""""""""""
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    	" else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <leader>fs :cs find s <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fg :cs find g <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fc :cs find c <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>ft :cs find t <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fe :cs find e <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
    nmap <leader>fd :cs find d <C-R>=expand("<cword>")<cr><cr>

    " Horizontal split, with search result displayed in the new window.
    nmap <leader>fhs :scs find s <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fhg :scs find g <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fhc :scs find c <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fht :scs find t <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fhe :scs find e <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fhf :scs find f <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>fhi :scs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
    nmap <leader>fhd :scs find d <C-R>=expand("<cword>")<cr><cr>

    " Vertical split instead of a horizontal one
    nmap <leader>fvs :vert scs find s <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fvg :vert scs find g <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fvc :vert scs find c <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fvt :vert scs find t <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fve :vert scs find e <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>fvf :vert scs find f <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>fvi :vert scs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
    nmap <leader>fvd :vert scs find d <C-R>=expand("<cword>")<cr><cr>

endif

""""""""""""""""""""""""""""""""""""
" => Search
""""""""""""""""""""""""""""""""""""
set showmatch
set incsearch
set ignorecase
set smartcase
set hlsearch

""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""
set nobackup
set nowb

""""""""""""""""""""""""""""""""""""
" Bufferline
""""""""""""""""""""""""""""""""""""
let g:bufferline_echo = 1

""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeTabsToggle<cr>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_open_on_gui_startup = 0

""""""""""""""""""""""""""""""""""""
" Tagbar for the current file
""""""""""""""""""""""""""""""""""""
nnoremap <leader>l :TagbarToggle<cr>

""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"   Somewhat intelligent aucompletion plugin, compiled with clang support.
""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Tab>']
let g:ycm_key_list_previous_completion = ['<C-k>']

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open = 1

" Always show gutter (currently only for c files)
autocmd BufEnter *.c,*.h sign define dummy
autocmd BufEnter *.c,*.h execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger       ="<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-j>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
			   	return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<s-tab>"

" Expand snippet or return
let g:ulti_expand_res = 0
function Ulti_ExpandOrEnter()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res
		return ''
	else
		return "\<return>"
	endif
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<cr>



"""""""""""""""""""""""""""""""""""
" Unite
"""""""""""""""""""""""""""""""""""
if executable('ag')
	"ag is faster than find
	"ag has support for .agignore, also uses .gitignore
	let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
endif
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>b :Unite -quick-match buffer<cr>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <TAB>            <Plug>(unit_select_next_line)
endfunction

"""""""""""""""""""""""""""""""""""
" My 'handy' shortcuts.
" List will have to grow

" Shortcut for <press shift> ; <release shift>
nnoremap ; :

" Navigation over editor lines (when in wrap)
nnoremap j gj
nnoremap k gk

" Reformat and save
nnoremap <leader>w :Autoformat <cr> :w <cr>
nnoremap <leader>s :Autoformat <cr>

"""""""""""""""""""""""""""""""""""
" EOF

