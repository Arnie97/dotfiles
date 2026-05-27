if vim.fn.executable('jdtls') == 0 then
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

local function pad(s)
  return s:gsub('%d+', function(n) return ('%04d'):format(n) end)
end

local latest = vim.iter(lombok):fold(lombok[1], function(acc, v)
  return pad(v) > pad(acc) and v or acc
end)

auto.setup {
  ['jdtls'] = {
    cmd = {
      'jdtls',
      '--jvm-arg=-javaagent:' .. latest,
    },
  },
}
