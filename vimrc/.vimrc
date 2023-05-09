" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype off
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'
let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'c': ['clangtidy'],
\   'hpp': ['clangtidy'],
\   'h': ['clangtidy'],
\}
let g:ale_fixers={
\   'cpp': ['clang-format'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_cpp_clangtidy_checks = ['*']
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_cpp_clangtidy_options = ''
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
set number
syntax on
colorschem industry
set tabstop=4
set autoindent
set expandtab
set cursorline
call vundle#end()
filetype plugin indent on
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
