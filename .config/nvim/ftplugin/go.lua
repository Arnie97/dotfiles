local found, go = pcall(require, 'dap-go')
if found then
    go.setup()
end
