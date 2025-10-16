{
  flake.modules.nixos."hosts/workstation".boot =
    { pkgs, ... }:
    {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackagess = pkgs.linuxPackages_latest;
      kernelModules = [ "iwlwifi" ];
    };
}
