{
  inputs,
  withSystem,
  ...
}:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfreePredicate = _pkg: true;
        };
      };
    };

  flake = {
    overlays.default =
      _final: prev:
      withSystem prev.stdenv.hostPlatform.system (
        { config, ... }:
        {
          local = config.packages;
        }
      );
  };
}