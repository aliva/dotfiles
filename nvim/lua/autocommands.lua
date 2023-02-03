-- autosave on focus lost
-- autocmd FocusLost * try | :wa | catch | endtry

vim.api.nvim_create_autocmd(
    'FocusLost',
    {
        pattern = '*',
        callback = function() pcall(vim.cmd, 'write') end
    }
)
