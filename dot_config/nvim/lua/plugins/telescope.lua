return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            --require("telescope").setup {}
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
}
