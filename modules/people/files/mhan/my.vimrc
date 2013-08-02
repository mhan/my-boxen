" vim compatibility
set nocompatible

" Pathogen
execute pathogen#infect()

" Syntax and colors
syntax on
filetype plugin indent on
set background=light
colorscheme solarized

" Soft tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set number

" NERDTree
map <C-n> :NERDTreeToggle<CR>
