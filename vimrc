let mapleader = " "
set backspace=indent,eol,start
set cc=80
set incsearch
set nocompatible
set noerrorbells
set noswapfile
set novisualbell
set shell=bash
set textwidth=80

" Auto-detect markdown files
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

set number

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" easytags
" ----------
set tags=tags
set path=.
let g:easytags_async = 1
let g:easytags_cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" easy tags is so sloooooowwwwwww
let g:easytags_python_enabled = 0

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Highlight search matches
set hlsearch

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set t_Co=256
colorscheme dim
set cursorline

let g:test#strategy = 'dispatch'

" Keep cursor vertically centered, plucked from @gabebw!
set scrolloff=999

" NERDTree for surfing ze files
map <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']

" Indent list items correctly
set autoindent

" Don't ask me if I want to load changed files. The answer is "Yes, always"
:set autoread

" This has been segfaulting vim recently :(
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" leader d to run the whole spec file
nnoremap <silent> <Leader>d :TestFile --format doc<CR>
" leader c to copy the run nearest spec command to a clipboard so I can get
" better output
" nnoremap <silent> <Leader>c :redir @* <bar> TestNearest <bar> redir END<CR>

" leader c to compile the current file and run it
nnoremap <silent> <Leader>c :Dispatch make %:r<CR>:Dispatch ./%:r<CR>

" leader rr to compile the current rust file and run it
nnoremap <silent> <Leader>rr :Dispatch rustc %<CR>:Dispatch ./%:r<CR>
nnoremap <silent> <Leader>rt :Dispatch rustc --test %<CR>:Dispatch ./%:r<CR>

" Leader ra to build a thing and then immediately flash it to the arduino
" attached to the current project
nnoremap <silent> <Leader>ra :!platformio run -t upload<CR>

" airline - set theme and remove awful separators
let g:airline_theme='nord'
set laststatus=2

" Disable annoying whitespace indicator
let g:airline#extensions#whitespace#enabled=0

" Better tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_min_count = 2

" Better line/column information
let g:airline_section_b = ""
let g:airline_section_z = "%#__accent_bold#%l%#__restore__#:%c"

" " ALE for syntax warning
let g:ale_rust_cargo_use_clippy = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['python'] = ['black']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_linters = {}
let g:ale_linters['rust'] = ['cargo', 'rustc']
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Color stuff for ALE
hi link ALEErrorSign    ErrorMsg
hi link ALEWarningSign  WarningMsg

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

let g:airline_section_error = airline#section#create_right(['ALE'])

" GitGutter
set updatetime=100

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '<'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" copypasta fix for sierra
set clipboard=unnamed

" Open the current line in github's UI
nnoremap <Leader>gc :Gblame<CR><C-W>h:Gbrowse <C-R><C-W><CR>:q<CR>

" Fuzzyfind
nnoremap <Leader>f :FZF<CR>
" This makes FZF respect gitignore
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
au BufNewFile,BufRead *.ng.erb let b:eruby_subtype = 'html'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Pretty print JSON
nnoremap <Leader>x :%!xmllint --format %<CR>
nnoremap <Leader>j :%!python -m json.tool<CR>

" Mad science here. Multi-line a single line comma delimited list
map <C-c> f,a<CR><ESC><C-c>

" Get the name of the highlight groups of the word under cursor
" For some reason this doesn't return stuff I would expect it to like `spellbad`
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

hi SpellBad cterm=underline ctermfg=red
hi Cursor ctermbg=31 guibg=#0184bc ctermfg=0 guifg=#FFFFFF

" I never mean W
:command W w

" dashes are part of words too
:set iskeyword+=\-
