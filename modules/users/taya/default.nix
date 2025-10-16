{ config, ... }:
{
  flake.modules = {
    nixos.taya = {
      users.users.taya = {
        description = "Taya Crystals";
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        openssh.authorizedKeys.keys = [ ];
        initialPassword = "taya";
      };
    };

    homeManager.taya = {

      environment.systemPackages = with config.nixpkgs; [
        mods
      ];

      programs.git = {
        enable = true;
        userName = "Taya Crystals";
        userEmail = "taya@taya.net";
      };
    };
  };
}
