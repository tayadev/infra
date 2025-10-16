{
  flake.modules.nixos.nvidia = {
     hardware.graphics.enable = true;
     services.xserver.videoDrivers = [ "nvidia" ];
     hardware.nvidia = {
       modesetting.enable = true;
       open = true;
     };
  };
}
