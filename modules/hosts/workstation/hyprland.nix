{ config, ... }:
{
  flake.modules = {
    homeManager."hosts/workstation/hyprland" =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        wayland.windowManager.hyprland.settings = {
          # Monitor configuration for triple monitor setup
          monitor = [
            # Left monitor: BenQ T2200HD 1920x1080 60Hz rotated 90 degrees (portrait)
            "DP-1,1920x1080@60,0x0,1,transform,1"
            # Middle monitor: HP OMEN 25 1920x1080 144Hz (primary)
            "HDMI-A-1,1920x1080@144,1080x0,1"
            # Right monitor: Dell P2213 1680x1050 60Hz
            "DP-2,1680x1050@60,3000x0,1"
          ];
        };
      };
  };
}
