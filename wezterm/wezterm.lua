local wezterm = require('wezterm')

return {
  font = wezterm.font("Andale Mono", {
    weight = "Regular",
    stretch = 'UltraExpanded',
  }),
  freetype_load_target = "Light",
  font_size = 12,
  line_height = 1.2,
  -- cell_width = 1,
  color_scheme = 'Dracula (base16)',

  -- use_fancy_tab_bar = false,
  window_frame = {
    active_titlebar_bg = '#ffffff',
  },
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = .90,
}
