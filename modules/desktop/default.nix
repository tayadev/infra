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
        networking.wireless.enable = true;

        services = {
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

        home = {
          packages = with pkgs; [
            kdePackages.akonadi-search
            kdePackages.akregator
            kdePackages.ark
            kdePackages.filelight
            kdePackages.kate
            kdePackages.kcalc
            kdePackages.kdialog
            kdePackages.kgpg
            kdePackages.kpipewire
            kdePackages.krdc
            kdePackages.krfb
            kdePackages.ksystemlog
            kdePackages.kweather
            kdePackages.okular
            kdePackages.plasma-browser-integration
            kdePackages.sddm-kcm
            kdePackages.spectacle
            kdePackages.xdg-desktop-portal-kde
            kdePackages.yakuake
            krita
            vlc
            zotero
          ];
        };
      };
  };
}
