call plug#begin()
"This is where we will add plugins to install

Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'wincent/terminus'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'jistr/vim-nerdtree-tabs'


call plug#end()
vnoremap <C-c> "*y

set splitbelow
term
vert term
set nosplitbelow

"Configuration
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set number
let autosave = 1

let g:airline_powerline_fonts = 1

let g:NERDTreeGitStatusUserNerdFonts = 1


let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme gruvbox
set bg=dark

autocmd CursorHold,CursorHoldI * update

"Error linting configuration


nmap <silent> <C-e> <Plug>(ale_next_wrap)

function! LinterStatus() abort
            let l:counts = ale#statusline#Count(bufnr(''))
                let l:all_errors = l:counts.error + l:counts.style_error
                    let l:all_non_errors = l:counts.total - l:all_errors
                        return l:counts.total == 0 ? 'OK' : printf(
                                \   '%d⨉ %d⚠ ',
                                \   all_non_errors,
                                \   all_errors
                                \)
                endfunction
                set statusline+=%=
                set statusline+=\ %{LinterStatus()}

let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'


let g:ale_completion_enabled = 1

let g:ale_completion_autoimport = 1
let g:airline#extensions#ale#enabled = 1
