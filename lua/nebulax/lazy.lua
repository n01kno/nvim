local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { import = "nebulax.plugins" },
        { import = "nebulax.plugins.lsp" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        missing = true,
        colorscheme = { "rose-pine", "default" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "zipPlugin",
                "tutor",
                "gzip",
                "tohtml",
                "tarPlugin",
            },
        },
    },
})
