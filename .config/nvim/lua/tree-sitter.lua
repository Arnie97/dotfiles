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

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'*'},
  callback = function()
    local lang = require 'nvim-treesitter.parsers'.get_buf_lang()
    local installed = require 'nvim-treesitter.info'.installed_parsers()
    if vim.tbl_contains(installed, lang) then
      -- https://github.com/lewis6991/satellite.nvim/pull/2
      vim.fn.setwinvar(0, '&foldmethod', 'expr')
      vim.fn.setwinvar(0, '&foldexpr', 'nvim_treesitter#foldexpr()')
      vim.cmd('ContextDisableWindow')
    end
  end
})

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
