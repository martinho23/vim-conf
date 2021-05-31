" File              : .vimrc
" Author            : jfarinha <ajoni844@gmail.com>
" Date              : 13.05.2021
" Last Modified Date: 13.05.2021
" Last Modified By  : jfarinha <ajoni844@gmail.com>
" Display Place Holder [1=yes 0=No]
let sbv_display_placeholder=1
" Enable Numbers
let sbv_enable_numbers=1
" Charactere placeholder for tabulation [2 char]
let sbv_tab_placeholder='»·'
" Charactere placeholder for space [1 char]
let sbv_space_placeholder='·'
" Indentation type [tab || space]
let sbv_indentation_type="tab"
" Indetation lenght
let sbv_indentation_length=4

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'molokai'
Plugin 'rdnetto/YCM-Generator'
Plugin 'puremourning/vimspector'
Plugin 'alpertuna/vim-header'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set number
set secure
set exrc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set colorcolumn=110
highlight ColorColumn ctermbg=darkgrey

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

autocmd VimEnter * NERDTree

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
			\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif


	noremap <C-k>				:!(make)<CR>
	inoremap <C-k>				:<Esc>!(make)<CR>
	noremap <S-Right>			<C-w><Right>
	noremap <S-Left>			<C-w><Left>
	noremap <S-Up>				<C-w><Up>
	noremap <S-Down>			<C-w><Down>
	noremap <silent>	<C-s>	:w!<CR>
	noremap <silent>	<C-q>	:qa<CR>

	noremap +		:vertical resize +1<CR>
	noremap -		:vertical resize -1<CR>
	noremap ~		<C-w>=

	inoremap <silent>	<C-s>	<Esc>:w!<CR>
	inoremap <silent>	<C-q>	<Esc>:qa<CR>

	vnoremap <Tab>				>
	vnoremap <S-Tab>			<

execute "set tabstop=". sbv_indentation_length
execute "set shiftwidth=". sbv_indentation_length
execute "set softtabstop=". sbv_indentation_length

if sbv_indentation_type == "space"
	set expandtab
endif

if !empty(sbv_display_placeholder)
	execute "set list listchars=tab:". sbv_tab_placeholder .",trail:". sbv_space_placeholder
endif

let g:enable_numbers = 1

	execute "colorscheme ".  'molokai'

:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set ruler

inoremap <C-space>		<Esc>:Ycm<CR>

"Setting Ycm
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{3}', '_' ],
  \ }

"Ycm config file loading confirmation
let g:ycm_confirm_extra_conf = 0

"Ycm mappings
inoremap <C-c>		<Esc>:YcmCompleter GoToInclude<CR>
noremap <C-c>		:YcmCompleter GoToInclude<CR>

inoremap <C-d>		<Esc>:YcmCompleter GoToDefinition<CR>
noremap <C-d>		:YcmCompleter GoToDefinition<CR>

inoremap <F6>		<Esc>:YcmForceCompileAndDiagnostics<CR>
noremap <F6>		:YcmForceCompileAndDiagnostics<CR>

inoremap <F7>		<Esc>:YcmDiags<CR>
noremap <F7>		:YcmDiags<CR>

inoremap <C-r>		<Esc>:YcmCompleter GoToSymbol
noremap <C-r>		:YcmCompleter GoToSymbol

"Setting headers
let g:header_field_author = 'jfarinha'
let g:header_field_author_email = 'ajoni844@gmail.com'
map <F4> :AddHeader<CR>
let g:header_cfg_comment_char = '//'
