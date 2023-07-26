{
  description = "Main flake for all of my hosts [WIP]";
  inputs = rec {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #hyprland.url = "github:hyprwm/Hyprland";
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
      nixosModules.common = import ./common.nix;
      options.user.willow = {
        password = lib.mkOption {
          type = lib.types.str;
          default = "";
        };
      };
      nixosModules.userWillow = {
        users.users.willow = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          password = "";
        };
      };
      nixosModules.userZshStarship = {
        lib.home-manager = import ./desktopComponents/other/starshipZsh.nix;
      };
      nixosModules.userHyprland = {
        lib.home-manager = import ./desktopComponents/wayland/hyprland.nix;
      };
    };
}
