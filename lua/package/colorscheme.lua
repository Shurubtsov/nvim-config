-- Colorscheme persistence utility
local M = {}

-- Path to store the current colorscheme
local colorscheme_file = vim.fn.stdpath("data") .. "/current_colorscheme.txt"

-- Save the current colorscheme to file
function M.save_colorscheme(colorscheme)
    local file = io.open(colorscheme_file, "w")
    if file then
        file:write(colorscheme)
        file:close()
    end
end

-- Load the saved colorscheme from file
function M.load_colorscheme()
    local file = io.open(colorscheme_file, "r")
    if file then
        local colorscheme = file:read("*all")
        file:close()
        return colorscheme
    end
    return nil
end

-- Apply colorscheme with error handling
function M.apply_colorscheme(colorscheme)
    local status_ok = pcall(vim.cmd.colorscheme, colorscheme)
    if not status_ok then
        vim.notify("Colorscheme '" .. colorscheme .. "' not found, falling back to default", vim.log.levels.WARN)
        vim.cmd.colorscheme("default")
    end
end

return M
