" Set indentation
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" Latex compiling
" nnoremap <Leader>cc  :!latexmk -pdf % && pkill -HUP mupdf<Enter><Enter>
nnoremap <Leader>cc  :!pdflatex % <Enter>
nnoremap <Leader>cb  :!biber %:r <Enter>
" nnoremap <Leader>cv :!mupdf  %:r.pdf & <Enter><Enter>
nnoremap <Leader>cv :!open  %:r.pdf & <Enter><Enter>
nnoremap <Leader>m :!make <Enter>

" Latex shortcuts
nmap <Leader>/ i\frac{}{<lt>++>}<lt>++><Esc>F};i
imap <Leader>/ \frac{}{<lt>++>}<lt>++><Esc>F};i
imap ^^ ^{}<++><Esc>F}i
imap __ _{}<++><Esc>F}i
inoremap {{ {}<++><Esc>F}i
inoremap (( ()<++><Esc>F)i
inoremap [[ []<++><Esc>F]i
inoremap <Leader>{ \left\{\right\}<++><Esc>T{i
inoremap <Leader>( \left(\right)<++><Esc>T(i
inoremap <Leader>[ \left[\right]<++><Esc>T[i
nnoremap <F5> :call ft#tex#WriteEnvironment()<CR>kO
inoremap <F5> <Esc>:call ft#tex#WriteEnvironment()<CR>kO
inoremap $$ $$<++><Esc>F$i
nnoremap <Leader>sc :!aspell check %<Enter>

" Greek characters
inoremap <Leader>a \alpha
inoremap <Leader>b \beta
inoremap <Leader>d \delta
inoremap <Leader>D \Delta
inoremap <Leader>l \lambda
inoremap <Leader>g \gamma
inoremap <Leader>G \Gamma
inoremap <Leader>s \sigma
inoremap <Leader>x \xi
inoremap <Leader>o \omega
inoremap <Leader>O \Omega
