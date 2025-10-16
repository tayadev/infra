{ inputs, ... }:
{
  flake.modules = {
    nixos.hyprland =
    { pkgs, ... }:
    {

      programs.hyprland.enable = true;

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
            bind =
              [
                "$mod, T, exec, kitty"
              ];
            exec-once = [
              "kitty"
            ];
        };
      };
    };
  };
}
