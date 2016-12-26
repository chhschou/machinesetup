" vim: set tw=79 shiftwidth=2 tabstop=2 :
" vimrc file, Chris Chou, chhschou@gmail.com

set nocompatible		" use vim defaults
set number					" enable line numbers
set ls=2						" always show status line
set tabstop=2
set shiftwidth=2		" set tabstop and shiftwidth for hard tab
set autoindent			" use autoindent
set showcmd					" show incomplete commands
set hlsearch				" highlight searches
set incsearch				" do incremental searching
set ruler						" show cursor position
set ignorecase			" set ignore case when searching
set modeline				" last lines in document sets vim mode
set modelines=3			" number lines checked for modelines
set nostartofline		" done jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]	" move freely between files
set clipboard+=unnamedplus	" to default to system clipboard
"" autocompletion related configs
set omnifunc=syntaxcomplete#Complete " turn on autocompletion
" map ^space to open completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
			\ "\<lt>C-n>" :
			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
inoremap <C-@> <C-Space>			" above for running in gui?
" Enter selects the hightlighted item in completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
"Set the type lookup function to use the preview window instead of the status
"line
let g:OmniSharp_typeLookupInPreview = 1
"
"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

""Super tab settings
"let g:SuperTabDefaultCompletionType = 'context'
""let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery =
"["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
""let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for
"preview)
set completeopt=longest,menuone,preview
"
nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
"" Builds can run asynchronously with vim-dispatch installed
nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>
"
nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap fi :OmniSharpFindImplementations<cr>
nnoremap fu :OmniSharpFindUsages<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
"nnoremap <space> :OmniSharpGetCodeActions<cr>

" rename with dialog
nnoremap nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename
" newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" " Force OmniSharp to reload the solution. Useful when switching branches
" etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>


" Delete trailing white space on save, useful for P没有通过检验ython and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" set graphic terminal font to Consolas for windows and Insolata everywhere
" else
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 14
  elseif has("gui_win32")
    set guifont=Consolas:h14:cANSI
	else
		set guifont=Consolas:h18
	endif
endif


" setup pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" setup solarized color scheme (needs to be first installed)
syntax enable
set background=dark
let g:solarized_termcolors=256 " need this if not solarized on terminal
colorscheme solarized

