require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
      mocha = {
        base = "#1c1c1c",
        mantle = "#1c1c1c",
        crust = "#1c1c1c",
      },
    },
    integrations = {
        cmp = true,
    },
})

-- setup must be called before loading
vim.cmd('colorscheme catppuccin-mocha')
