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
              "kitty"
              "hyprctl setcursor Bibata-Modern-Amber 24"
            ];
          };
        };
      };
  };
}
