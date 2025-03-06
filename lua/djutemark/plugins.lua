local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('folke/persistence.nvim')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v2.*', ['do'] = 'make install_jsregexp' })

Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')

Plug('Issafalcon/lsp-overloads.nvim')

-- Required for neo-tree:
Plug('MunifTanjim/nui.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lua/plenary.nvim')

Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x' })

Plug('navarasu/onedark.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim',
  { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })

Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')

Plug('mbbill/undotree')

Plug('mg979/vim-visual-multi', {['branch'] = 'master'})
Plug('ggandor/leap.nvim')
Plug('RRethy/vim-illuminate')
Plug('lewis6991/gitsigns.nvim')
Plug('folke/trouble.nvim')
Plug('numToStr/Comment.nvim')

-- -- Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
-- Plug('junegunn/seoul256.vim')
--
-- -- Any valid git URL is allowed
-- Plug('https://github.com/junegunn/vim-easy-align.git')
--
-- -- Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
-- Plug('fatih/vim-go', { ['tag'] = '*' })
--
-- -- Using a non-default branch
-- Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
--
-- -- Use 'dir' option to install plugin in a non-default directory
-- Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
--
-- -- Post-update hook: run a shell command after installing or updating the plugin
-- Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
--
-- -- Post-update hook can be a lambda expression
-- Plug('junegunn/fzf', { ['do'] = function()
--   vim.fn['fzf#install']()
-- end })
--
-- -- If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
-- Plug('nsf/gocode', { ['rtp'] = 'vim' })
--
-- -- On-demand loading: loaded when the specified command is executed
-- Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
--
-- -- On-demand loading: loaded when a file with a specific file type is opened
-- Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })
--
-- -- Unmanaged plugin (manually installed and updated)
-- Plug('~/my-prototype-plugin')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme seoul256')
