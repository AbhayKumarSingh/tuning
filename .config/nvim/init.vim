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
