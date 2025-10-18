{ ... }:
{
  flake.modules = {
    nixos.hyprland =
      { pkgs, ... }:
      {

        programs.hyprland.enable = true;
        environment.systemPackages = with pkgs; [
          wofi
          bibata-cursors
          hyprpaper
        ];

        services = {
          displayManager = {
            ly = {
              enable = true;
            };
          };
        };
      };

    homeManager.hyprland = {
      programs.kitty.enable = true;
      services.hyprpaper = {
        enable = true;
        settings = {
          ipc = "on";
          splash = false;
          splash_offset = 2.0;

          preload = [
            "~/wallpaper.jpg"
          ];

          wallpaper = [
            ",~/wallpaper.jpg"
          ];
        };
      };
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$mod" = "SUPER";
          general = {
            border_size = 0;
          };
          bind = [
            "$mod, T, exec, kitty"
            "$mod, W, killactive"
            "$mod, Shift+W, forcekillactive"
          ];
          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];
          bindr = [
            "SUPER, SUPER_L, exec, wofi --show drun"
          ];
          exec-once = [
            "hyprctl setcursor Bibata-Modern-Amber 24"
            "hyprpaper"
          ];
        };
      };
    };
  };
}
