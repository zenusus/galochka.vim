if exists('g:loaded_galochka')
    finish
endif
let g:loaded_galochka = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:InsertGalochka(count_str) abort
    let l:count = empty(a:count_str) ? 1 : str2nr(a:count_str)
    let l:galochki = repeat('✅', l:count)
    let l:current_line = getline('.')
    let l:cursor_col = col('.') - 1
    let l:new_line = strpart(l:current_line, 0, l:cursor_col) . l:galochki . strpart(l:current_line, l:cursor_col) " ура вставка галоче
    call setline('.', l:new_line)
    call cursor(line('.'), l:cursor_col + len(l:galochki) + 1)
endfunction

command! -nargs=? galochka call s:InsertGalochka(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
