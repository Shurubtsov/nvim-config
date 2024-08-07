return {
    'nvimdev/dashboard-nvim', -- dashboard start menu
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
    config = function()
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = {
                    '',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠉⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢀⡸⠐⠒⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⡠⡗⠒⠂⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠛⠋⠉⠙⠛⠻⠿⠿⢿⣿⣷⢀⡗⠒⠂⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠉⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⢠⣇⣀⣀⣀⠸⠄⢀⠀⠈⠛⢿⣤⠓⠢⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢂⠔⠊⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠠⣢⡴⠞⢉⠴⠺⠌⠠⠈⠉⠙⢍⡉⣩⣼⣕⠢⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⠙⡠⠂⠘⣿⣿⣿⣿⠿⠁⡠⣀⣠⠚⣋⠈⡰⠁⠀⠀⠐⡀⠑⠄⠀⠠⡀⠈⠙⡟⣒⡐⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡊⠡⡰⠊⢘⢿⣿⡏⠀⠀⢨⡾⠁⠨⠀⠀⠀⢀⠀⠆⠘⠁⠰⠈⠄⠀⠈⢄⠀⠀⠙⠻⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⡑⠴⠁⢀⠅⡰⠀⣀⣿⠠⡀⠌⠀⠀⠀⡘⠀⠑⡀⣾⠀⢃⠈⣢⠠⠤⢆⠀⠀⠀⢢⣬⣙⣛⡻⠿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡂⠀⠌⠐⢺⡇⠑⢄⢀⢀⠤⠒⠓⠖⠂⠠⢿⠀⢰⢡⢡⠑⠄⠘⣆⠰⡐⠄⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠈⢂⠀⡿⣠⠄⠊⢸⠀⠀⡘⠀⠠⡂⠀⠋⠀⠸⠀⢿⠀⢊⠂⠻⣄⢡⣨⠠⢈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡀⠐⡥⢿⢺⢀⠀⢸⠀⣔⡀⢤⣼⢍⡁⠙⢀⠆⠀⡨⣐⣤⡬⢆⣄⠑⡂⠍⣢⡇⠪⢝⣻⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠃⠀⡧⡼⣾⠀⠀⢸⢰⣏⢰⠔⢛⣷⠀⠀⠊⠀⠀⠘⡏⠒⠀⠒⠃⠃⢰⠈⠍⠛⢄⠈⠻⣿⣿⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⣧⠀⡃⡰⡇⠈⠰⢂⠈⠺⠶⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢩⢩⠐⠓⠤⠀⠘⠀⠀⠀⠙⢿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⣸⣿⡷⠑⠢⣠⠀⡆⠈⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⢸⢰⠤⡀⠈⠗⣄⠀⠀⠀⠀⠙⢿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⢠⣿⡿⣱⣿⡄⠋⠉⢠⡠⠡⡀⠀⠀⠀⠠⡀⠀⢀⠀⠀⠀⢀⡔⠀⢸⡘⠀⠈⡆⢬⠛⠢⠀⠀⠀⠀⢐⠹⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⡀⣰⠟⠉⠚⠋⡀⠌⠒⠀⠀⠂⢄⢸⣄⡀⠀⠀⠀⠀⠀⠀⡀⠔⢁⡃⡇⡘⠡⡆⠀⠸⠚⢢⠀⠑⢄⠄⠂⠂⢀⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⣀⣠⠂⠃⠈⠀⠀⡤⠈⠀⠀⠀⠀⠀⠀⠀⢊⠙⣦⠈⠭⡀⠐⣶⠁⠐⡄⠀⢅⡡⠃⢀⠣⠀⠀⠠⣆⠀⠀⠀⣀⣤⣶⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠈⠁⠀⠀⡡⠀⠈⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⢘⠄⢽⡀⠰⣿⣷⠋⡀⠀⠘⡀⢴⣁⣤⠊⠀⠀⠀⠀⠹⠉⠁⠹⣿⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⣿⣿⡿⠋⢀⠀⠇⠀⠀⡀⠀⡔⠀⠸⠀⠻⠄⠀⠀⠀⠀⠀⠀⠀⡠⢂⠘⠀⠡⠀⠉⣷⣦⡠⠀⠀⠐⢾⠛⢁⣀⣀⣠⣾⣿⣆⠀⠀⢆⠘⣿⣿⣿⡇',
                    '⢸⣿⣿⣿⡿⢋⣤⠞⠁⠀⢘⢄⠄⡠⢠⠊⠆⠀⢁⠀⠀⠀⠀⠀⣀⣠⠄⠊⢈⠁⠀⠀⠀⠧⠤⢈⢿⣿⡄⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⡄⠀⠈⣆⢹⣿⣿⡇',
                    '⢸⣿⣿⢋⣴⠟⠁⠀⢀⣴⣿⣧⠀⠀⠀⠀⠘⠷⠄⠒⢦⣈⠩⠄⠐⠁⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⡞⣿⣿⡀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡀⠀⢹⡄⢿⣿⡇',
                    '⢸⡿⢡⣾⠋⠀⠀⣠⣿⣿⣿⣿⡧⠀⠀⠀⠀⠆⠀⣾⠸⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣿⣿⡇⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣧⠀⠈⣧⢸⣿⡇',
                    '⢸⠃⡿⠁⠀⢀⣼⣿⣿⣿⡿⠋⠀⠈⠢⠀⠀⠘⡀⢿⣦⣷⣄⡀⠀⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣷⠞⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⣿⣸⣿⡇',
                    '⢸⠸⠁⠀⢠⣾⣿⣿⣿⡟⠀⠀⠀⡄⢫⣓⡄⠀⠐⠘⡎⠿⣿⣿⣶⣤⣿⣶⣤⣀⣀⣀⣀⣀⣬⢗⣛⣭⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠸⢸⣿⡇',
                    '⢸⠀⠀⢠⣿⣿⣿⣿⡟⠀⠀⠀⢸⡷⠪⡎⠁⠀⣸⠀⠘⢄⠈⠙⠻⠿⠿⠿⠟⢛⡿⠋⠉⠁⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣸⣿⡇',
                    '⢸⠀⠀⣾⣿⣿⣿⣿⠃⠀⠀⠀⠀⠑⠌⠠⠤⠐⠸⣇⠀⠀⠑⠢⣀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⢉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣴⣿⣿⡇',
                    '⢸⠀⢰⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⡀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⡀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣰⣿⣿⣿⡇',
                    '⢸⣆⠘⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⣶⣶⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⠟⢀⣴⣿⣿⣿⣿⡇',
                    '⢸⣿⣦⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⡇',
                    '',
                },
                center = {
                    {
                        icon_hl = "Title",
                        icon = " ",
                        desc = "Find File",
                        desc_h1 =
                        "String",
                        action =
                        "Telescope find_files"
                    },
                    { icon = " ", desc = "Search Text",  action = "FzfLua live_grep" },
                    { icon = " ", desc = "Recent Files", action = "FzfLua oldfiles" },
                    { icon = " ", desc = "Config",       action = "edit ~/.config/nvim/init.lua" }
                },
                footer = {
                    '“Any fool can write code that a computer can understand. Good programmers write code that humans can understand.” – Martin Fowler' }
            }
        })
    end
}
