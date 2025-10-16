{
  flake.modules.nixos.dev.git =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        git-lfs
      ];

      programs.git = {
        enable = true;
        config = {
          init.defaultBranch = "main";
        };
      };
    };
}
