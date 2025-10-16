{ config, ... }:
{
  flake.modules.nixos."hosts/workstation".imports =
    with config.flake.modules.nixos;
    [
      {
        nixpkgs.hostPlatform = "x86_64-linux";
        networking.hostName = "workstation";
        hardware.enableAllFirmware = true;
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

      # Host-specific modules
      ./hyprland.nix
    ]
    # Specific Home-Manager modules
    ++ [
      {
        home-manager.users.taya.imports = with config.flake.modules.homeManager; [
          base
          desktop
          hyprland
          "hosts/workstation/hyprland"
          taya
          dev
        ];
      }
    ];
}
