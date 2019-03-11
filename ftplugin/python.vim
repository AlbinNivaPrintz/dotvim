let home="/Users/albinprintz/"
let g:env=ft#python#SetPyEnv()

nnoremap <Leader>cc :execute('!'.g:env.' '.expand('%'))<CR>
