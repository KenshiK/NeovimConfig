return {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            -- your custom config here (optional)
            calendar = {
                language = "fr",
            }
        })
    end,
}
