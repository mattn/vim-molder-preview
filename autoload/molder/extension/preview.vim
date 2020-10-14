function! molder#extension#preview#init() abort
  nnoremap <plug>(molder-preview-split) :<c-u>call molder#extension#preview#split()<cr>

  if !hasmapto('<plug>(molder-preview-split)')
    nmap <buffer> <leader>v <plug>(molder-preview-split)
  endif
endfunction

function! molder#extension#preview#split() abort
  let l:name = molder#current()
  let l:path = molder#curdir() .. l:name
  if isdirectory(l:path)
    return
  endif
  exe 'rightbelow' 'keepalt' 'keepjump' 'vsplit' '+view' fnameescape(l:path)
endfunction
