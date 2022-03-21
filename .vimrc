syntax enable
set number relativenumber
execute pathogen#infect()

filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2

map <F1> :Vex

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['eslint']

let g:markdown_fenced_languages = ['typescript', 'ts=typescript', 'javascript', 'js=javascript', 'json=javascript', 'scss', 'bash', 'sh=bash']

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'urbit/hoon.vim'
Plug 'urbit/hoon.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert

if executable('hoon-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hoon-language-server',
        \ 'cmd': ['hoon-language-server'],
        \ 'whitelist': ['hoon'],
        \ })
endif

au BufRead,BufNewFile *-write.md setlocal textwidth=36 
au BufRead,BufNewFile *-write.md setlocal spell 
au BufRead,BufNewFile *-write.md Goyo 36

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
