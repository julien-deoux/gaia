local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

return {
    {
        "sainnhe/sonokai",
        init = function()
            g.sonokai_style = "andromeda"
            g.sonokai_better_performance = 1
        end
    }, {
        "sainnhe/everforest",
        init = function()
            g.everforest_background = 'medium'
            cmd "colorscheme everforest"
        end
    }, {
        "sainnhe/edge",
    }
}
