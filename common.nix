{ config, pkgs, useOptionalModule, ...}:

{
    imports = lib.optional useOptionalModule ./arduino.nix;
}