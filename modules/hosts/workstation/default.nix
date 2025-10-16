{ config, ... }:
{
  flake.modules.nixos."hosts/workstation".imports =
    with config.flake.modules.nixos;
    [
      {
        nixpkgs.hostPlatform = "x86_64-linux";
        networking.hostName = "workstation";
      }

      # Modules
      base
      nvidia
      hyprland
      desktop

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
