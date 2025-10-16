{
  flake.modules.nixos.internet =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vivaldi
      ];
    };
}
