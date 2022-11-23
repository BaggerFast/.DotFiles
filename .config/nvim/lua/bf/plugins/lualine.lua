local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local line_night = require("lualine.themes.nightfly")

local new_colors = {
    blue =  "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B", 
    black = "#000000",
}

line_night.normal.a.bg = new_colors.blue
line_night.insert.a.bg = new_colors.green
line_night.visual.a.bg = new_colors.violet

line_night.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black,
    },
}


lualine.setup({
    options = {
        theme = line_night
    }
})
