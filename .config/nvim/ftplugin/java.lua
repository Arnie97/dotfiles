if not vim.fn.executable('jdtls') then
  return
end

local found, auto = pcall(require, 'auto-lsp')
if not found then
  return
end

local lombok = vim.fn.glob('$HOME/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar', true, true)
if #lombok == 0 then
  return
end

auto.setup {
  ['jdtls'] = {
    cmd = {
      'jdtls',
      '--jvm-arg=-javaagent:' .. lombok[#lombok],
    },
  },
}
