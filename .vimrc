" VIM CONFIG

syntax enable
set number relativenumber
set undofile
set undodir=$HOME/.vim/undo

filetype plugin indent on
set showcmd
set expandtab
set shiftwidth=2
set tabstop=2

map <F1> :Vex

let g:markdown_fenced_languages = ['typescript', 'ts=typescript', 'javascript', 'js=javascript', 'json=javascript', 'scss', 'bash', 'sh=bash']

" PLUGIN CONFIG

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'karolbelina/uxntal.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'urbit/hoon.vim'
call plug#end()

" Theme
set t_Co=256
set background=dark
colorscheme PaperColor
hi CocMenuSel ctermbg=30
" GOYO CONFIG

au BufRead,BufNewFile *-write.md setlocal textwidth=70 
au BufRead,BufNewFile *-write.md setlocal spell 
au BufRead,BufNewFile *-write.md Goyo 70

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

" FZF CONFIG

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Syntax

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
"" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
"" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
"" light-grey
hi tsxTypeBraces guifg=#999999
"" dark-grey
hi tsxTypes guifg=#666666
"" Other
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

"" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Ripgrep internal search

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" IDE-Like shortcuts
nnoremap <leader>f :RG
nnoremap <leader>ff :Files

" Autocomplete

"" Tab completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
"" Rename symbol
nmap <leader>rn <Plug>(coc-rename)



"" Give more height
set cmdheight=2

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Hoon LSF
if executable('hoon-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hoon-language-server',
        \ 'cmd': ['hoon-language-server'],
        \ 'whitelist': ['hoon'],
        \ })
endif

" EOF
