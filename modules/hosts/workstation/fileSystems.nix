{
  flake.modules.nixos."hosts/workstation" = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/35d8178a-1e3c-4ef8-953f-4f94c1ee0f4f";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/BD9C-34BC";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
}
