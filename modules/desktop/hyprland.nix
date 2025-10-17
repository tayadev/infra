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
        ];

        services = {
          displayManager = {
            ly = {
              enable = true;
            };
          };
        };
      };

    homeManager.hyprland =
      {
        ...
      }:
      {
        programs.kitty.enable = true;
        wayland.windowManager.hyprland = {
          enable = true;
          settings = {
            "$mod" = "SUPER";
            bind = [
              "$mod, T, exec, kitty"
              "$mod, Space, exec, wofi --show drun"
              "$mod, W, killactive"
              "$mod, Shift+W, forcekillactive"

            ];
            bindm = [
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
            ];
            exec-once = [
              "kitty"
              "hyprctl setcursor Bibata-Modern-Amber 24"
            ];
          };
        };
      };
  };
}
