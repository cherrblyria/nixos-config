{
  environment.variables = {
    # Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };
}
