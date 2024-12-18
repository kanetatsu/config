return {
  {
    "neovim/nvim-lspconfig" ,

    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "bashls",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "html",
          "jsonls",
          "tsserver",
          "marksman",
          "eslint",
        }
      }

      -- auto lspconfig setting
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,
      }


      --local on_attach = function(_, bufnr)
      --  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      --    vim.lsp.buf.format()
      --  end, { desc = 'Format current buffer with LSP' })
      --end

      --local servers = {
      --  solargraph = {
      --    filetypes = { 'ruby' },
      --  },
      --  volar = {
      --    filetypes = { 'vue' },
      --  },
      --}

      --local capabilities = vim.lsp.protocol.make_client_capabilities()
      --capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      --local mason_lspconfig = require 'mason-lspconfig'

      --mason_lspconfig.setup {
      --  ensure_installed = vim.tbl_keys(servers),
      --}

      --mason_lspconfig.setup_handlers {
      --  function(server_name)
      --    require('lspconfig')[server_name].setup {
      --      capabilities = capabilities,
      --      on_attach = on_attach,
      --      settings = servers[server_name],
      --      filetypes = (servers[server_name] or {}).filetypes,
      --    }
      --  end
      --}

      --require('lspconfig').metals.setup{}
    end
  },
}
