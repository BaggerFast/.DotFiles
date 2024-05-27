local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
  },
  automatic_installation = true,
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "stylua", -- lua formatter
    "autopep8", -- python formatter
  },
  automatic_installation = true,
})