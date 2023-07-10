{ config, pkgs, lib, useOptionalModule, ...}:

{
    imports = lib.optional useOptionalModule ./arduino.nix;
}