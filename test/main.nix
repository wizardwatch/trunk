{ config, pkgs, lib, trunk, home-manager, ... }:
{
  users.users.willow = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "";
  };
  environment = {
    sessionVariables = {
      HOME = "/home/willow/";
      XDG_CONFIG_HOME = "/home/willow/.config";
    };
  };
  programs = {
    hyprland.enable = true;
  };


}
