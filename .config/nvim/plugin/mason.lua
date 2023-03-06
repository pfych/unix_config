local status, mason = pcall(require, "mason")
if (not status) then
  print("mason is not installed")
  return
end

mason.setup({
  ensure_installed = {
    "prettier",
    "lua-language-server",
    "luaformatter",
    "eslint_d",
    "typescript-language-server",
    "stylelint-lsp"
  },
  automatic_installation = true
})
