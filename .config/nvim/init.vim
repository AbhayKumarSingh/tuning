set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

"Set Color Scheme and Font Options
"Remember to comment the next two lines when installing
"dracula plugin for the first time. And once installed
"uncomment those lines. Todo: manage this automatically
packadd! my-dracula-theme
colorscheme dracula
set guifont=Consolas:h12

packadd minpac
call minpac#init()

call minpac#add( 'tpope/vim-unimpaired' )
call minpac#add( 'tpope/vim-commentary' )
call minpac#add( 'tpope/vim-surround' )
call minpac#add( 'tpope/vim-fugitive' )
call minpac#add( 'airblade/vim-gitgutter' )
call minpac#add( 'tpope/vim-scriptease', { 'type' : 'opt' })
call minpac#add( 'k-takata/minpac' , { 'type' : 'opt' })
call minpac#add( 'dracula/vim', { 'name' : 'my-dracula-theme'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>

let g:dispatch_compilers={}
let g:dispatch_compilers['npm run lint']='tslint'

" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
\   'javascript': ['eslint'],
\ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Settings related to ale plugin
let g:ale_lint_on_text_changed = 'always' " default
let g:ale_lint_on_save = 1                " default
let g:ale_lint_on_enter = 1               " default
let g:ale_lint_on_filetype_changed = 1    " default
let g:ale_sign_column_always = 1

" grepper-config
let g:grepper       = {}
let g:grepper.tools = ['rg', 'grep', 'git']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

" Open Grepper-prompt for a particular grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

" Set execution strategy of vim-test to dispatch
let test#strategy = "dispatch"

" Set escape as shortcut for escaping terminal mode.
" Also map verbatim escape to force actual escape.
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Set maps for switching windows in normal and terminal mode
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif
