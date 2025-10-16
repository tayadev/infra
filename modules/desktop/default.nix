{ inputs, ... }:
{
  flake.modules = {
    nixos.desktop =
      { pkgs, ... }:
      {
        xdg = {
          portal = {
            enable = true;
            config.common.default = "kde";
            extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
          };
        };

        networking.networkmanager.enable = true;

        services = {
          gnome.gnome-keyring.enable = true;
          xserver = {
            enable = true;
          };
        };
      };

    homeManager.desktop =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [
            inputs.self.overlays.default
          ];
        };

        services.gnome-keyring = {
          enable = true;
          components = [
            "secrets"
            "ssh"
          ];
        };

        home = {
          packages = with pkgs; [
            gnome.gnome-keyring
          ];
        };
      };
  };
}
