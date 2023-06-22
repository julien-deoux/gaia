local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function format(buf)
    local null_ls_sources = require('null-ls.sources')
    local ft = vim.bo[buf].filetype

    local has_null_ls = #null_ls_sources.get_available(ft, 'NULL_LS_FORMATTING') > 0

    vim.lsp.buf.format({
        bufnr = buf,
        filter = function(client)
            if has_null_ls then
                return client.name == 'null-ls'
            else
                return true
            end
        end,
    })
end

M.format_on_write = function(client, buffer)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = buffer,
            callback = function()
                format(buffer)
            end
        })
    end
end

return M
