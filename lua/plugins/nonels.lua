return {
    'nvimtools/none-ls.nvim',
    config = function()
        local none_ls = require'null-ls'

        none_ls.setup {
            debounce = 250,
            log_level = 'warn',
            notify_format = '[null-ls] %s',
            sources = {
                none_ls.builtins.formatting.clang_format,
                none_ls.builtins.formatting.prettierd,
                none_ls.builtins.formatting.goimports,
                none_ls.builtins.formatting.golines,
                none_ls.builtins.formatting.stylua,
                none_ls.builtins.formatting.alejandra,
                none_ls.builtins.formatting.pint,
                none_ls.builtins.formatting.shellharden,

                none_ls.builtins.diagnostics.revive,
                none_ls.builtins.diagnostics.phpstan,
                none_ls.builtins.diagnostics.vale,
            },
        }
    end
}
