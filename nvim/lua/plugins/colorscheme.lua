return {
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    base = "#11111b",
                    mantle = "#11111b"
                },
            },
            integrations = {
                alpha = true,
                cmp = true,
                dap = true,
                markdown = true,
                neotree = false,
                noice = true,
                rainbow_delimiters = true,
                telescope = { enabled = true },
                treesitter = true,
            },
        },
    },
}
