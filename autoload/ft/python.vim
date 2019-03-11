function! ft#python#SetPyEnv()
    let path = split(system('echo $PATH'))
    let index = match(path, '.*anaconda3\/envs\/.*\/bin.*')
    if index == -1
        return "python"
    else
        return  path[index].'/python'
    endif
endfunction
