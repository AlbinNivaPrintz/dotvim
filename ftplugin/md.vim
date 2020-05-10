" Latex compiling
" nnoremap <Leader>cc  :!pandoc % -f markdown -t latex -s -o $:r.pdf && pkill -HUP mupdf<Enter><Enter>
nnoremap <Leader>cc  :!pandoc % -f markdown -t latex -s -o $:r.pdf<Enter><Enter>
" nnoremap <Leader>cv :!mupdf  %:r.pdf & <Enter><Enter>
nnoremap <Leader>cv :!open  %:r.pdf & <Enter><Enter>

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
nmap <F5> i\begin{<++>}<Enter>\end{<++>}<Esc>k0<C-j>
imap <F5> \begin{<++>}<Enter>\end{<++>}<Esc>k0<C-j>
imap $$ $$<++><Esc>F$i
nmap <Leader>sc :!aspell check %<Enter>

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
