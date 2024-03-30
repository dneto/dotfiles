return {
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            color_overrides = {
                mocha ={
                    base = "#11111b",
                    mantle = "#11111b"
                },
            },
            integrations = {
                neotree = false,
                rainbow_delimiters = true,
                treesitter = true,
                cmp = true,
            },
        },
    },
}
