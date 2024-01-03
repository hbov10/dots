-- options
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.breakindent = true
vim.opt.smartcase = true
vim.opt.history = 1000
vim.opt.wildmenu = true
vim.opt.wildmode = "list:full"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
vim.opt.mouse = "a"
vim.opt.spell = true
vim.opt.spelllang = { "en_ca", "en_us" }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	"folke/neodev.nvim",
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	"nvim-lualine/lualine.nvim",
	"mbbill/undotree",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate"
})


require("everforest").setup({
	italics = true,
})

require("everforest").load()

require("lualine").setup({
	options = {
		theme = "everforest",
		component_separators = " ",
		section_separators = {left = "", right = ""},
	},
})



