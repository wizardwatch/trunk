{ config, pkgs, lib, useOptionalModule, ...}:
with lib;                      
let
  cfg = config.custom.isDev;
in 
{
    options.custom.isDev = {
        imports = ./arduino.nix;
    };
}