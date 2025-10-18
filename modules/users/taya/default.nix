{ ... }:
{
  flake.modules = {
    nixos.taya =
      { pkgs, ... }:
      {
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

        fonts.packages = with pkgs; [
          jetbrains-mono
        ];
      };

    homeManager.taya =
      { pkgs, ... }:
      {
        programs.git = {
          enable = true;
          userName = "Taya Crystals";
          userEmail = "taya@taya.net";
        };

        programs.kitty = {
          enable = true;
          font = {
            name = "JetBrains Mono";
            package = pkgs.jetbrains-mono;
            size = 12.0;
          };
        };
      };
  };
}
