{
  flake.modules.nixos."hosts/workstation" =
    { pkgs, ... }:
    {
      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
        kernelPackagess = pkgs.linuxPackages_latest;
        kernelModules = [ "iwlwifi" ];
      };
    };
}
