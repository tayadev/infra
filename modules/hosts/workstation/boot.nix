{
  flake.modules.nixos."hosts/workstation".boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "iwlwifi" ];
  };
}
