{ pkgs, config, lib, options, ... }:
let
  cfghypr = config.systems.hyprland;
in
{
  options.systems.hyprland = {
    enable = lib.mkOption {
      description = "Use the default multi system config";
      type = lib.types.bool;
      default = true;
    };
  };
  imports =
    #[] ++ lib.optionals (cfghypr.enable)
    [ ./hyprland.nix ];
}
