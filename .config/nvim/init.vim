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
