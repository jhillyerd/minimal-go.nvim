if !empty(globpath(&runtimepath, 'autoload/plug.vim'))
  call plug#begin(stdpath('data') . '/plugged')

  " dependencies
  Plug 'neovim/nvim-lspconfig'

  " github plugins, windows friendly
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ray-x/go.nvim'

  " All of your Plugins must be added before the following line (required)
  call plug#end()
  
  lua require('lspconfig')['gopls'].setup({})
endif

" prevents error
"let g:loaded_matchparen = 1
