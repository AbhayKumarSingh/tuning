set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

"The following line may also be commented, if not working correctly.
"behave mswin

"set diffexpr=MyDiff()
"Added the exclaimation mark after suggestion on some site
"to remove function already exists problem when the file is sourced again
"I currently don't if this has any side effects
"function! MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"Personal Settings
"More to be added soon.
"execute pathogen#infect()
"filetype plugin indent on
syntax on
"Set the status line options. Make it show more information.
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set line no, buffer, search, highlight, autoindent and more.
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set diffopt=filler,vertical,foldcolumn:1
"set vb t_vb=
"set viminfo+=n$VIM/_viminfo
"set noerrorbells
set showcmd

if has('mouse')
    set mouse=nv
    nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
endif

set history=1000
set undolevels=1000
set noerrorbells visualbell t_vb=
if has('autocmd')
	"The following command stops flashing of screen when unnecessary
	"escape, etc are pressed
	autocmd GUIEnter * set visualbell t_vb=
	"The following command helps to source the vimrc file automatically when saved
	autocmd! bufwritepost _vimrc source %
	" Wipeout fugitive buffers
	autocmd BufReadPost fugitive://* set bufhidden=delete
endif
set nobackup
set timeoutlen=10000
"The following line stops cursor blinking
let &guicursor = substitute(&guicursor, 'n-v-c:', '&blinkon0-', '')
set cursorline
set nohlsearch
set nu
set relativenumber
set sidescroll=1
set sidescrolloff=10
set scrolloff=3
set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
