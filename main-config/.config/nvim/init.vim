"=========================== PLUGINS =========================== 

call plug#begin()
Plug 'ayu-theme/ayu-vim'						"colorscheme
Plug 'axvr/photon.vim'							"colorscheme
Plug 'terryma/vim-multiple-cursors'	"press <C-n>
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'							"finder
Plug 'dense-analysis/ale'						"linting
Plug 'jiangmiao/auto-pairs'					"autopairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'						"sidebar
Plug 'ryanoasis/vim-devicons'				"sidebar icons
Plug 'vim-airline/vim-airline'			"status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'skywind3000/asyncrun.vim'			"run async commands
Plug 'lervag/vimtex' 								"LaTex syntax
Plug 'chrisbra/Colorizer'
call plug#end()


"=========================== COLORS =========================== 

colorscheme ayu
let ayucolor="dark"
let g:airline_theme='transparent'

hi Normal ctermbg=NONE guibg=NONE


"======================== GENERAL CONF ========================

set termguicolors										"true colors support
set relativenumber 									"line numbers
set nu!
set autoindent
set confirm													"confirm quit w/ save
set mouse=a													"mouse support
set ts=2 														"tab size
set softtabstop=0 noexpandtab
set shiftwidth=2
set updatetime=300
set shortmess+=c
set scs 														"search automatic case sensitive
set cul 														"highlight current line
set mousemodel=popup								"folder content & suggestions
set hidden													"Allow edit buffers files w/ save
set inccommand=split								"live feedback
set noshowmode											"hide status mode bar
set cmdheight=1											"command line height

"change cursor in different modes
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"


"======================== MY SHORTCUTS ========================

let mapleader="\<space>"

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap q :quit<CR>
nnoremap <c-s> :w<CR>
nnoremap <c-p> :Files<CR>
nnoremap <c-f> :Ag<CR>
nnoremap <c-b> :NERDTreeToggle<CR>
"nnoremap <c-w> :bd<CR>

inoremap <c-b> <ESC>:NERDTreeToggle<CR>
inoremap <c-s> <ESC>:w<CR>a


"========================== AIR LINE ===========================

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail'

"======================== COC SETTINGS ========================
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"coc trigger config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')














