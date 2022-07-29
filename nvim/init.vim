set hlsearch
set number
set incsearch
set ignorecase
set smartcase
set noshowmatch
set hidden
set linebreak
set clipboard=unnamedplus

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set noswapfile
set nobackup
set undofile

set fileformat=unix
set encoding=utf-8
set autoindent
set smartindent
set termguicolors

syntax enable

" bindkeys
inoremap jk <esc>

call plug#begin('~/.vim/plugged')
Plug 'yaegassy/coc-volar-tools', {'do': 'yarn install --frozen-lockfile'}

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'andweeb/presence.nvim'
Plug 'Pocco81/AutoSave.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tribela/vim-transparent'
call plug#end()

" colorscheme night-owl
colorscheme gruvbox

" Discord RPC
let g:presence_editing_text        = "Редактирует %s"
let g:presence_file_explorer_text  = "Просматривает %s"
let g:presence_git_commit_text     = "Коммитит изменения"
let g:presence_plugin_manager_text = "Настраивает Плагины"
let g:presence_reading_text        = "Читает %s"
let g:presence_workspace_text      = "Работает на %s"
let g:presence_line_number_text    = "Строка: %s из: %s"

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

" AutoSave
lua << EOF
require("autosave").setup({
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave", "TextChanged"},
    conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
})
EOF

" LSP
lua << EOF
local servers = { 'pyright', 'tsserver', 'gopls', 'volar', 'tailwindcss' }
local nvim_lsp = require('lspconfig')
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
