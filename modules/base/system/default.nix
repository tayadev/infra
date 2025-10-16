{
  flake.modules =
    let
      stateVersion = "25.05";
    in
    {
      homeManager.base = {
        home = {
          home-manager = {
            backupFileExtension = ".hm-backup";
          };
          inherit stateVersion;
        };
      };

      nixos.base = {
        system = {
          inherit stateVersion;
        };
      };
    };
}
