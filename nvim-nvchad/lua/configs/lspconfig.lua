-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local util = require "lspconfig/util"
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}


-- LSP attach and capabilities
-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local function on_attach_py()
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show documentation in hover window." })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Jump to definition." })
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Jump to declaration." })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Jump to implementation." })
--     vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = 0, desc = "Jump to type definition." })
--     vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = 0, desc = "Jump to signature help." })
--     vim.keymap.set(
--         "n",
--         "gq",
--         function() vim.lsp.buf.format({ async = true }) end,
--         { buffer = 0, desc = "Jump to signature help." }
--     )
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Rename symbol under cursor." })
--     vim.keymap.set(
--         "n",
--         "gr",
--         require("telescope.builtin").lsp_references,
--         { buffer = 0, desc = "Show references in a Telescope window." }
--     )
--
--     -- Diagnostics
--     vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0, desc = "Jump to next diagnostic." })
--     vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0, desc = "Jump to previous diagnostic." })
--     vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = 0, desc = "Show diagnostic information in hover." })
--
--     -- Code actions
--     if vim.lsp.buf.range_code_action then
--         vim.keymap.set("x", "<leader>la", vim.lsp.buf.range_code_action, { buffer = 0, desc = "Range code action." })
--     else
--         vim.keymap.set("x", "<leader>la", vim.lsp.buf.code_action, { buffer = 0, desc = "Code action." })
--     end
-- end

 lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- lspconfig.pyright.setup({
--     on_attach = on_attach_py,
--     capabilities = lsp_capabilities,
-- })
-- lspconfig.pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   }
-- }


-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- clangd
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

-- lspconfig.ansiblels.setup {}

-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
