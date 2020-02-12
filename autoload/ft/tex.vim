function! ft#tex#WriteEnvironment()
    call inputsave()
    let env = input('Enter environment: ')
    call inputrestore()
    exec 'normal! i\begin{'.env.'}'
    exec 'normal! o\end{'.env.'}'
    exec 'normal! o<++>'
endfunction
