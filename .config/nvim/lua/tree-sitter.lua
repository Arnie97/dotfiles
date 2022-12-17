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
