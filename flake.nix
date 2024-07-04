{
  description = "Main flake for all of my hosts [WIP]";
  inputs = rec {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    }@inputs:
    rec {
      lib = nixpkgs.lib;
      # NixOS Modules
      nixosModules.common           = import ./modules/common.nix;
      nixosModules.desktop          = import ./modules/desktop.nix;
      # Homemanager Modules
      nixosModules.userZshStarship  = import ./home/other/starshipZsh.nix;
      nixosModules.userHyprland     = import ./home/wayland/hyprland.nix;
      nixosModules.userAnomalous    = import ./home/anomalous.nix;
    };
}
