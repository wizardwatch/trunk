{ config, pkgs, lib, useOptionalModule, ...}:

{
    options.custom.isDev = {
        imports = ./arduino.nix;
    };
}