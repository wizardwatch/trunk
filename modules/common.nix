{ config, pkgs, lib, ... }:

let
  cfg = config.systems.dev;

in
with pkgs.lib;
{

  config = {
    environment.systemPackages = with pkgs; [ 
      ## source control; linus style
      git
      ## download the web right to your own computer!
      wget
      ## monitor all the things, except gpu usage.
      htop
      ## faster grep
      ripgrep
      ## god I hate java
      jdk17
      ## those videos aren't going to download themselves!
      youtube-dl
      ## the prefered way to install rust
      rustup
      ## Yet another windows compatibility layer
      unzip
      ## Life is short. Too short for man pages!
      tldr
      ## For when you don't want to open the computers case and look inside
      pciutils
      ## For when you need more terminal for your terminal
      zellij
    ];
  };
}
