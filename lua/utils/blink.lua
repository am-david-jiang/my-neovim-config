---@module 'blink.cmp'
---@type blink.cmp.Config
local blink_config = {
  keymap = {
    preset = "enter",
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
}

return blink_config
