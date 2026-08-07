{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 12;
    };
    settings = {
      force_ltr = "yes";

      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = "-1";
      cursor_trail = "1";
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = "2";

      scrollback_lines = "2000";

      remember_window_size = "yes";
      initial_window_width = "640";
      initial_window_height = "400";

      window_margin_width = "0";
      window_padding_width = "0 16";
      hide_window_decorations = "yes";
      resize_in_steps = "no";
      confirm_os_window_close = "0";

      background_opacity = "1.0";
      background_blur = "0";

      include = "/home/cherr/.config/kitty/themes/noctalia.conf";
    };
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
  };
}
