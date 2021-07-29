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
