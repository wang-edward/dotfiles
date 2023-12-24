-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lunarvim options
lvim.builtin.dap.active = true

-- vim options
vim.opt.relativenumber = true

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


