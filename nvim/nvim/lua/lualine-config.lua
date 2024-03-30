require('lualine').setup {
    options = {
        theme = "catppuccin",
        component_separators = {left = "", right = "" },
        section_separators = { left = "", right = ""},
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                "mode",
                fmt=function() return "" end,
                padding = {right = 2, left = 1},
            },
        },
        lualine_b = {
            { "branch", icon = "", color = { bg = "#181825" } },
            "diff",
            {"diagnostics", color = { bg = "#181825" }}
        },
        lualine_c = {
            { "filetype", icon_only =  true, padding = {left = 1, right = 0} },
            "filename"
        },
        lualine_x = {
            "encoding",
            { "fileformat", symbols={ unix = "󰻀" } },
        },
        lualine_y = {
            { "progress", color = { bg = "#181825" } },
        }
    }
}
