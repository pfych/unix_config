local status, telescope = pcall(require, "telescope")
if (not status) then
  print("telescope is not installed")
  return
end

telescope.setup({})

telescope.load_extension "file_browser"
