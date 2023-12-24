-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- vim options
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.guicursor = ""

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
    "lervag/vimtex",
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

-- appearance config
-- lvim.colorscheme = "onedark"
lvim.transparent_window = true

-- plugin configurations
-- trouble.nvim
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- formatter configurations
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "asmfmt" },
  { name = "latexindent" }
}

-- lsp configurations
-- add `solidity-ls` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solidity" })
-- remove `solidity` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "solc"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.builtin.treesitter.rainbow.enable = true;

-- c++ dap configuration
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- lsp configuration for matlab
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "matlab_ls" })
-- require("lvim.lsp.manager").setup("matlab_ls")

-- lsp configuration for assembly
-- require("lvim.lsp.manager").setup("asm_lsp", {
--   cmd = { "asm-lsp" },
--   filetypes = { "asm", "vmasm" },
--   single_file_supprt = true,
-- })
-- require('lspconfig').asm_lsp.setup {
--   cmd = { "asm-lsp" },
--   filetypes = { "asm", "vmasm" },
--   root_dir = function()
--     return "/Users/lefan/Documents/l2hu/222 lab/lab_2/" -- or specify your project's root directory here
--   end,
-- }
