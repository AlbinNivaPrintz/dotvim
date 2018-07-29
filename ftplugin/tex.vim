" Latex compiling
nnoremap <Leader>ll :!latexmk -pdf % && pkill -HUP mupdf<Enter><Enter>
nnoremap <Leader>lv :!mupdf  %:r.pdf & <Enter><Enter>

" Latex vim shortcuts
" Shortcuts
nmap <Leader>/ i\frac{}{<lt>++>}<lt>++><Esc>F};i
imap <Leader>/ \frac{}{<lt>++>}<lt>++><Esc>F};i
imap ^^ ^{}<++><Esc>F}i
imap __ _{}<++><Esc>F}i
nmap <F5> i\begin{<++>}<Enter>\end{<++>}<Esc>k0<C-j>
imap <F5> \begin{<++>}<Enter>\end{<++>}<Esc>k0<C-j>
imap $$ $$<++><Esc>F$i

" Greek characters
inoremap <Leader>a \alpha
inoremap <Leader>b \beta
inoremap <Leader>d \delta
inoremap <Leader>D \Delta
inoremap <Leader>l \lambda
inoremap <Leader>g \gamma
inoremap <Leader>G \Gamma
inoremap <Leader>x \xi

