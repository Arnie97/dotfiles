if not vim.fn.executable('lua-language-server') then
  return
end

local found, auto = pcall(require, 'auto-lsp')
if not found then
  return
end

auto.setup {
  ['lua_ls'] = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = true,
          library = vim.tbl_filter(function(path)
            return not path:match(vim.fn.stdpath('config'))
          end, vim.api.nvim_get_runtime_file('lua', true))
        },
      },
    },
  },
}
