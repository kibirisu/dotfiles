return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                { "L3MON4D3/LuaSnip", build = "make install_jsregexp", },
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                {
                    "windwp/nvim-autopairs",
                    config = function()
                        require('nvim-autopairs').setup({
                            disable_filetype = { "TelescopePrompt" , "vim" },
                        })
                    end
                }
            },
        },
        "j-hui/fidget.nvim",
    },
    config = function()
        local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())
        require("fidget").setup({})
        require("luasnip.loaders.from_vscode").lazy_load()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer", },
        })
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup({
            capabilites = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }, {
                    { name = 'buffer' },
                }),
        })
    end
}
