{
  description = "Main flake for all of my hosts [WIP]";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs
  }:
  {
    nixosModules.common = import ./common.nix;
  };
}