function! Shuffle(list)
  let n = len(a:list)
  for i in range(0, n-2)
    let j = Random(0, n-i-1)
    let e = a:list[i]
    let a:list[i] = a:list[i+j]
    let a:list[i+j] = e
  endfor
  return a:list
endfunction

function! Random(min, max)
  let i = system('echo $RANDOM')
  return i * (a:max - a:min + 1) / 32768 + a:min
endfunction
