""" http://vim.wikia.com/wiki/Search_keywords_in_c_function

" Search within top-level block for word at cursor.
nnoremap <Leader>[ "ayiw/<C-R>=ScopeSearch("[[")<CR><C-R>a<CR>
" Search within current block for word at cursor.
nnoremap <Leader>{ "ayiw/<C-R>=ScopeSearch("[{")<CR><C-R>a<CR>
" Search within current top-level block for user-entered text.
nnoremap <Leader>/ /<C-R>=ScopeSearch("[[")<CR>

" Return a string to place at the beginning of a search to limit
" the search to a certain scope.
" navigator is a command to jump to the beginning of the desired
" scope.
function! ScopeSearch(navigator)
  exec 'normal ' . a:navigator
  let l:s = line(".")
  normal %
  let l:e = line(".")
  normal %
  if l:s < l:e
    return '\%>' . (l:s-1) . 'l\%<' . (l:e+1) . 'l'
  endif
  echo "Cannot find search scope with command " . a:navigator . " %"
  return ""
endfunction

""" end search_keywords_in_c_function
