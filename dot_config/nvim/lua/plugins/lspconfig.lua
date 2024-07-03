return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", },
    })
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({
      capabilites = capabilities,
      settings = {
        Lua = {
	  diagnostics = {
	    globals = { "vim" },
	    disable = { "different-requires" },
	  },
        },
      },
    })
    require("cmp").setup()
  end
}
