-- 1 important
vim.opt.compatible = false
-- 2 moving around, searching and patterns
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 5 syntax, highlighting and spelling
vim.opt.cursorline = true
vim.opt.colorcolumn = {80, 120}
-- 9 using the mouse
vim.opt.mouse = "a" -- enable mouse everywhere
-- 12 selecting text
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
-- 13 editing text
vim.opt.completeopt = {'longest', 'menuone'}
vim.opt.undofile = false
vim.opt.undodir = '/tmp/$USER-vim-undo/'
-- 14 tabs and indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- 19 the swap file
vim.opt.swapfile = false
-- 20 command line editing
vim.opt.wildmode = {'longest:full', 'full'}
vim.opt.wildignore:append({
    '__pycache__',
    '*.pyc',
    '.git',
})
-- 25 various
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.signcolumn = 'yes'
