local found, blink = pcall(require, 'blink.cmp')
if not found then
  return
end

blink.setup {
  fuzzy = {
    implementation = 'prefer_rust',
  },
  snippets = {
    preset = 'default',
  },
  cmdline = {
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
    keymap = {
      preset = 'cmdline',
      ['<tab>'] = { 'show', 'select_next' },
      ['<s-tab>'] = { 'show', 'select_prev' },
      ['<left>'] = false,
      ['<right>'] = false,
    },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1000,
    },
  },
  keymap = {
    ['<m-f>'] = { 'snippet_forward' },
    ['<m-b>'] = { 'snippet_backward' },
    ['<tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    ['<s-tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    ['<down>'] = { 'select_next', 'fallback' },
    ['<up>'] = { 'select_prev', 'fallback' },
    ['<pagedown>'] = { 'scroll_documentation_down', 'fallback' },
    ['<pageup>'] = { 'scroll_documentation_up', 'fallback' },
    ['<cr>'] = { 'select_and_accept', 'fallback' },
  },
}
