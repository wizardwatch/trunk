{ config, pkgs, lib, useOptionalModule, ...}:
with lib;                      
let
  cfg = config.custom.isDev;
in 
{
    options.custom.isDev = {
        enable = mkEnableOption "If this machine is used for software development";
    };
    lib.mkIf (config.custom.isDev.enable) {
        imports = ./arduino.nix;
    };
}