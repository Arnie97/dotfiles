vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require 'nvim-treesitter.configs'.setup {
  ensure_installed = maintained,
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '+',
      scope_incremental = '|',
      node_incremental = '+',
      node_decremental = '_',
    },
  },
}

local found, context = pcall(require, 'treesitter-context')
if not found then
  return
end

context.setup {
  enable = true,
  max_lines = 11,
  trim_scope = 'outer',
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'elif',
      'elseif',
      'else',
      'switch',
      'case',
      'interface',
      'struct',
      'enum',
    },
  }
}
