{
  flake.modules =
    let
      stateVersion = "25.05";
    in
    {
      homeManager.base = {
        backupFileExtension = ".hm-backup";
        home = {
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
