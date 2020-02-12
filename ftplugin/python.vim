let home="/Users/anp/"
let g:env=ft#python#SetPyEnv()

nnoremap <Leader>cc :execute('!'.g:env.' '.expand('%'))<CR>

" Commentline
nnoremap <Leader>/ ma0i# <Esc>`all
inoremap <Leader>/ <Esc>ma0i# <Esc>`allli

