source lib/shuffle.vim

let s:current_kata = 0
let s:kata_pairs = []

nnoremap <silent> <C-J> :<C-U>call KataNext()<CR>
nnoremap <silent> <C-K> :<C-U>call KataPrevious()<CR>
            
function! LoadKatas()
    let result = []
    let katas_dir = 'katas'
    if exists('g:vim_kata_katas_dir')
        let katas_dir = g:vim_kata_katas_dir
    endif
    let dirs = systemlist('ls '. katas_dir)
    for dir in dirs
        let ext = readfile(katas_dir.'/'.dir.'/ext')[0]
        let in = katas_dir.'/'.dir.'/in'
        let out = katas_dir.'/'.dir.'/out'
        call add(result, {'in': in, 'out': out, 'ext': ext})
    endfor
    if exists('g:vim_kata_shuffle') && g:vim_kata_shuffle
        call Shuffle(result)
    endif
    let s:kata_pairs = result
endfunction

function! KataNext()
    if s:current_kata >= len(s:kata_pairs) - 1
        return
    endif
    let s:current_kata += 1
    call LoadCurrentKata()
endfunction

function! KataPrevious()
    if s:current_kata <= 0
        return
    endif
    let s:current_kata -= 1
    call LoadCurrentKata()
endfunction

function! LoadCurrentKata()
    let pair = CreateWorkKata(s:kata_pairs[s:current_kata])
    let top_item = pair[0]
    let bottom_item = pair[1]
    windo diffoff
    silent only
    execute 'edit '.top_item
    execute 'belowright split '.bottom_item
    setlocal nomodifiable
    windo diffthis
    wincmd t
endfunction

function! CreateWorkKata(conf)
    let file_in_content = readfile(a:conf.in)
    let file_out_content = readfile(a:conf.out)
    let file_in = tempname() . '.in.' . a:conf.ext
    let file_out = tempname() . '.out.' . a:conf.ext
    call writefile(file_in_content, file_in)
    call writefile(file_out_content, file_out)
    return [file_in, file_out]
endfunction

call LoadKatas()
