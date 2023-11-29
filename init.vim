" vimrc
" description: James' attempt at a multiplatform vim configuration
" vim:fdm=marker:ai:et:sw=2:ts=8:tw=80

" Initialization --------------------------------------------------------- {{{1
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
autocmd!
filetype off

" Platform Detection
let g:UNIX = has('unix') && !has('macunix') && !has('win32unix')
let g:WINDOWS = (has('win32') || has('win64'))

" Leader Keys
let mapleader = " "
let maplocalleader = ","

" Plug List -------------------------------------------------------------- {{{1
"
" Detect Plug
if !empty(globpath(&runtimepath, 'autoload/plug.vim'))
  call plug#begin(stdpath('data') . '/plugged')

  " dependencies
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ray-x/guihua.lua'
  Plug 'tjdevries/colorbuddy.vim'

  " github plugins, windows friendly
  Plug 'folke/neodev.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'jvirtanen/vim-hcl'
  Plug 'LnL7/vim-nix'
  Plug 'miyakogi/conoline.vim'
  Plug 'neoclide/jsonc.vim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'posva/vim-vue', { 'for': 'vue' }
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'tjdevries/gruvbuddy.nvim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'

  " debugging
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'leoluz/nvim-dap-go'

  " completion setup
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " github plugs, unix preferred
  if !g:WINDOWS
    Plug 'airblade/vim-gitgutter'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '2.3.*'}
    Plug 'dag/vim-fish', { 'for': 'fish' }
    Plug 'wincent/terminus'
  endif

  " All of your Plugins must be added before the following line (required)
  call plug#end()
endif

lua require('config')

" Post-plugin init (not Vundle dependent)
filetype plugin indent on

" Plugin Configuration --------------------------------------------------- {{{1
"
" Conoline Configuration
let g:conoline_use_colorscheme_default_normal=1

" netrw should never be my alternate file
let g:netrw_altfile=1

" Commands --------------------------------------------------------------- {{{1
"
command! Here :cd %:p:h

" Language: Markdown ----------------------------------------------------- {{{1
"
if has("autocmd")
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh']
endif

" Reformat document: soft wrap paragraphs
" - Add a blank line to end of document
" - Join all non-blank lines
" - Remove trailing whitespace
" - Double-space
command! -range=% SoftWrap
      \ <line2>put _ |
      \ silent <line1>,<line2>g/\S/,/^\s*$/join | silent s/\s\+$// | put _
