{
  description = "Main flake for all of my hosts [WIP]";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = {
    self,
    nixpkgs,
    hyprland,
    ...
  }:
  {
    nixosModules.common = import ./common.nix;
    nixosModules.hyprland = hyprland.nixosModules.default; 
  };
}
