{ config, pkgs, lib, home-manager, ... }:
{
  home = {
    stateVersion = "23.11";
    username = "willow";
    homeDirectory = lib.mkForce "/home/willow/";
  };
  programs.wezterm = { enable = true; };
   }
