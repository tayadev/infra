{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vim
        curl
        wget
        htop
      ];
    };
}
