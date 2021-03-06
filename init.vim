" cd F:\TempDesktop\1


"enable system clipboard, might disable some function
set clipboard=unnamed
set clipboard+=unnamedplus


set mouse=a

syntax on
syntax enable
set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set cursorline
set wrap
"set showcmd
set wildmenu

"set tabstop to 4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set tenc=utf-8



"set background=light
set guifont=Consolas:h13 "设置字体为Monaco，大小10
set showtabline=2 "设置显是显示标签栏

"let g:python2_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

let g:ycm_global_ycm_extra_conf='~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"Plugin related
call plug#begin('~/.config/nvim/plugged') 

	"external termnial
	Plug 'skywind3000/asyncrun.vim'
	Plug 'skywind3000/asyncrun.extra'

	Plug 'mhinz/vim-startify'
	
	"auto pairs
	Plug 'jiangmiao/auto-pairs'

	"beautify
	Plug 'flazz/vim-colorschemes'
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vimcolorschemes/vimcolorschemes'

	"theme color
	"Plug 'tomasr/molokai' 
	"Plug 'altercation/solarized'
	"Plug 'sainnhe/sonokai'
	"Plug 'NLKNguyen/papercolor-theme'
    "Plug 'crusoexia/vim-monokai'
	Plug 'morhetz/gruvbox'

	
	"rainbow brackets
	"Plug 'luochen1990/rainbow'

	"Syntastic
	"Plug 'scrooloose/syntastic'
	Plug 'vim-syntastic/syntastic'

	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

	"comments-auto
	Plug 'scrooloose/nerdcommenter'

	"cpp highlight
	Plug 'octol/vim-cpp-enhanced-highlight'

    "coc.nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    

    Plug 'honza/vim-snippets'

call plug#end()

" set background transparent, must before colorscheme
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

set background=dark
colorscheme gruvbox

"colorscheme sonokai


"cpp hightlight ####
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


" ===================
" ==== coc begin ====
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-marketplace']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ==== coc end   ====
" ===================

""rainbow brackets
"let g:rainbow_active = 1
"let g:rainbow_conf = {
"\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
"\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
"\   'operators': '_,_',
"\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"\   'separately': {
"\       '*': {},
"\       'tex': {
"\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
"\       },
"\       'lisp': {
"\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
"\       },
"\       'vim': {
"\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
"\       },
"\       'html': {
"\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
"\       },
"\       'css': 0,
"\   }
"\}




"syntastic ####
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0



let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

"NerdTree ####
let NERDTreeQuitOnOpen = 0
let NERDChristmasTree=1
map <leader>f :NERDTreeToggle<CR>
" NERDTree 子窗口中不显示冗余帮助信息
"let NERDTreeMinimalUI=1
" 设置 NERDTree 子窗口宽度
"let NERDTreeWinSize=25
let g:NERDTreeWinSize = 32



"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
"autocmd filetype cpp nnoremap <F10> :!%:r<CR>

"让ctrl-c可以复制
"vmap <c-c> "+y
"vmap <c=v> "+p

"" CTRL-X and SHIFT-Del are Cut
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x
"
"" CTRL-C and CTRL-Insert are Copy
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"
"" CTRL-V and SHIFT-Insert are Paste
"map <C-V>       "+gP
"map <S-Insert>      "+gP
"
"cmap <C-V>      <C-R>+
"cmap <S-Insert>     <C-R>+

"map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"    silent exec "w"
"    if &filetype == 'c'
"        silent exec "!gcc -O2 -ggdb3 -Wall -fomit-frame-pointer -m64 -std=c2x % -o %<; .\%<"
"        silent exec "!time ./%<"
"    elseif &filetype == 'vim'
"        silent exec "source %"
"    elseif &filetype == 'cpp'
"        set splitbelow
"        silent exec "!g++ -O2 -ggdb3 -Wall -fomit-frame-pointer -m64 -std=c++14 % -o %<"
"        :sp
"        ":res -5
"        :AsyncRun -mode=term -pos=external %<
"		:q
"    endif
"endfunc


	
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

" set esc to clean highlight after search
nnoremap <esc> :noh<return><esc>

" set key Ctrl +(-) and Ctrl + mouse to adjust font size
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a


noremap <C-=> :call AdjustFontSize(1)<CR>
noremap <C--> :call AdjustFontSize(-1)<CR>
