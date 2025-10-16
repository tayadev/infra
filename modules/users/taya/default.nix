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

    homeManager.taya =
      { pkgs }:
      {

        environment.systemPackages = with pkgs; [
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
