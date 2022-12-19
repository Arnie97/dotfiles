local M = {}
local dap = require 'dap'

require 'dap.repl'.commands = vim.tbl_extend('force', dap.repl.commands, {
    continue = {'.c', '.continue'},
    next_ = {'.n', '.next'},
    step_back = {'.k', '.back'},
    reverse_continue = {'.w', '.rewind'},
    into_targets = {'.s', '.step'},
    out = {'.o', '.out'},
    scopes = {'.p', '.scopes'},
    threads = {'.t', '.threads'},
    frames = {'.f', '.frames'},
    exit = {'.q', '.quit'},
    up = {'.u', '.up'},
    down = {'.d', '.down'},
    goto_ = {'.g', '.goto'},
    pause = {'.e', '.pause'},
    capabilities = {'.x', '.capabilities'},
    help = {'.h', '.help'},
    custom_commands = {
        ['.r'] = dap.restart,
        ['.restart'] = dap.restart,
        ['.b'] = dap.toggle_breakpoint,
        ['.k'] = dap.toggle_breakpoint,
        ['.breakpoint'] = dap.toggle_breakpoint,
    },
})

function M.conditional_breakpoint()
    return dap.set_breakpoint(
        vim.fn.input('Breakpoint condition: '), nil,
        vim.fn.input('Breakpoint log message: ')
    )
end

return M
