setlocal indentexpr=BlueConfigIndent()

function! BlueConfigIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "{" && previous !~ "}" && line !~ "}"
    return indent(previousNum) + &sw
  elseif line !~ "{" && line =~ "}"
    return indent(previousNum) - &sw
  else
    return indent(previousNum)
  endif
endfunction
