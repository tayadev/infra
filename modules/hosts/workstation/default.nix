{ config, pkgs, ... }:
{
  flake.modules.nixos."hosts/workstation".imports =
    with config.flake.modules.nixos;
    [
      {
        nixpkgs.hostPlatform = "x86_64-linux";
        networking.hostName = "workstation";
        hardware.firmware = with pkgs; [
          linux-firmware
        ];
      }

      # Modules
      base
      nvidia
      hyprland
      desktop
      internet

      # Users
      root
      taya
    ]
    # Specific Home-Manager modules
    ++ [
      {
        home-manager.users.taya.imports = with config.flake.modules.homeManager; [
          base
          hyprland
          taya
          dev
        ];
      }
    ];
}
