let mapleader = " "
set backspace=indent,eol,start
set cc=80
set incsearch
set nocompatible
set noerrorbells
set noswapfile
set novisualbell
set number
set shell=fish
set smartcase
set termguicolors
set textwidth=80
set norelativenumber
set re=0
set cursorline
set mouse=a

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" Auto-detect markdown files
au! BufRead,BufNewFile *.markdown set filetype=markdown
au! BufRead,BufNewFile *.md       set filetype=markdown

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>
" leader d to run the whole spec file with doc formatting
nnoremap <silent> <Leader>d :TestFile --format doc<CR>
" leader c to copy the run nearest spec command to a clipboard so I can get
" better output, can't quite get this right
" nnoremap <silent> <Leader>c :redir @* <bar> TestNearest <bar> redir END<CR>

let g:test#strategy = 'dispatch'


" Make extra whitespace visible
set list listchars=tab:»·,trail:·,nbsp:·

" Highlight search matches
set hlsearch

" Softtabs, 2 spaces
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2

" Keep cursor vertically centered
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

" I never mean W
:command W w

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

" Auto-format on write
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" GitGutter
set updatetime=100

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '<'

" Open the current line in github's UI
nnoremap <Leader>gc :Gblame<CR><C-W>h:Gbrowse <C-R><C-W><CR>:q<CR>

" Try plenary
nnoremap <leader>f <cmd>Telescope find_files<cr>

" Live grep
nnoremap <leader>fw <cmd>Telescope live_grep<cr>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap K vim.diagnostic.open_float


" Pretty print JSON
nnoremap <Leader>x :%!xmllint --format %<CR>
nnoremap <Leader>j :%!python -m json.tool<CR>

" Automatically multi-line a function call by breaking at commas
map <C-c> f,a<CR><ESC><C-c>

" Get the name of the highlight groups of the word under cursor
" For some reason this doesn't return stuff I would expect it to like `spellbad`
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" dashes are part of words too
:set iskeyword+=\-
