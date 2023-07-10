{ config, pkgs, useOptionalModule, ...}:

{
  environment.systemPackages = with pkgs; {
    arduino
  };
}
