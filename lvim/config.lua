--- vim options
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.guicursor = ""
vim.opt.mousescroll = "ver:3,hor:0"

-- toggle git project mode
lvim.builtin.project.active = false

-- get rid of autocomment
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
 
lvim.keys.visual_block_mode["K"] = false
 
-- get rid of swap bug
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false
 
-- bindings
lvim.keys.normal_mode["<leader>n"] = ":vnew<CR>"
 
lvim.keys.normal_mode["<leader>h"] = "<C-W>h"
lvim.keys.normal_mode["<leader>j"] = "<C-W>j"
lvim.keys.normal_mode["<leader>k"] = "<C-W>k"
lvim.keys.normal_mode["<leader>l"] = "<C-W>l"
 
lvim.keys.normal_mode["<leader>H"] = "<C-W>H"
lvim.keys.normal_mode["<leader>J"] = "<C-W>J"
lvim.keys.normal_mode["<leader>K"] = "<C-W>K"
lvim.keys.normal_mode["<leader>L"] = "<C-W>L"
 
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
 
-- default, elflord, industry, torte, koehler, murphy
-- challenger_deep, atom
lvim.colorscheme = "vim"
lvim.autocommands = {
    { "ColorScheme", { pattern = { "*" }, command = "highlight Pmenu ctermbg=NONE guibg=NONE" } },
    { "ColorScheme", { pattern = { "*" }, command = "highlight FloatBorder ctermbg=NONE guibg=NONE" } },
}
 
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
 
lvim.plugins = {
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { "rafi/awesome-vim-colorschemes" },
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                default_mappings = true
            }
        end
    }
}

-- c3
vim.filetype.add({
  extension = {
    c3 = "c3",
    c3i = "c3",
    c3t = "c3",
  },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
  install_info = {
    url = "https://github.com/c3lang/tree-sitter-c3",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "main",
  },
}
