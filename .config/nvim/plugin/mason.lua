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
    "tsserver",
  },
  automatic_installation = true
})

