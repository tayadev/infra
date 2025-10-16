{ inputs, ... }:
{
  flake.modules = {
    nixos.hyprland =
      { pkgs, ... }:
      {

        programs.hyprland.enable = true;
        environment.systemPackages = [ pkgs.rofi ];

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
        pkgs,
        lib,
        config,
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
              "$mod, Space, exec, rofi -show drun"
            ];
            exec-once = [
              "kitty"
            ];
          };
        };
      };
  };
}
