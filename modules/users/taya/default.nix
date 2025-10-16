{ ... }:
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
        settings = {
          default-api = "openrouter";
          default-model = "openai/gpt-4o-mini";
          apis = {
            openrouter = {
              base-url = "https://openrouter.ai/api/v1";
              api-key = "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"; # YES I KNOW THIS IS A BAD IDEA
              models = {
                "openai/gpt-4o-mini" = {
                  max-input-chars = 650000;
                };
              };
            };
          };
        };
      };
      programs.git = {
        enable = true;
        userName = "Taya Crystals";
        userEmail = "taya@taya.net";
      };
    };
  };
}
