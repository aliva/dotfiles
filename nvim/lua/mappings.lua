-- toggle line numbers
vim.keymap.set(
    {'n', 'i'}, '<F1>',
    function()
        vim.o.number = not vim.o.number
    end
)

-- no arrow keys
vim.keymap.set({'n', 'i'}, '<up>', '<nop>')
vim.keymap.set({'n', 'i'}, '<down>', '<nop>')
vim.keymap.set({'n', 'i'}, '<left>', '<nop>')
vim.keymap.set({'n', 'i'}, '<right>', '<nop>')

-- use ; as :
vim.keymap.set({'n', 'v'}, ';', ':')

-- move in wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- keep visual selection
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
