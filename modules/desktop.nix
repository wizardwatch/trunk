{ config, pkgs, lib, ... }:

let
  cfg = config.systems.dev;

in
with pkgs.lib;
{

  config = {
    environment.systemPackages = with pkgs; [ 
      alacritty
      hunspell
      hunspellDicts.en_US-large
      firefox
    ];
  };
}
