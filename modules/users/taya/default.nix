{ config, ... }:
{
  flake.modules = {
    nixos.taya = {
      users.users.taya = {
        description = "Taya Crystals";
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        openssh.authorizedKeys.keys = [ ];
        initialPassword = "taya";
      };
    };

    homeManager.taya = {
      programs.mods = {
        enable = true;
        settings = ''
          {
            default-model = "openai/gpt-4o-mini";
            apis = {
              openrouter = {
                base-url = "https://openrouter.ai/api/v1";
                models = {
                "openai/gpt-4o-mini" = {max-input-chars=650000;}
                }
              }
            }
          }
        '';
      };
      programs.git = {
        enable = true;
        userName = "Taya Crystals";
        userEmail = "taya@taya.net";
      };
    };
  };
}
