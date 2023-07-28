{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    trunk = {
      url = "path:../";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  /*
  Due to limitations of home-manager, window managers configured with
  home-manager must also have an associated NixOS module imported. Due to the
  simplicity of doing so, trunk does not provide this prepackaged. An example
  for hyprland is below. If someone knows an ergonomic way to work around this
  issue, please file an issue. For now, the relevant part is importing the
  hyprland module, and enabling hyprland in ./main.nix
  */
  /*
  While I attempt to maintain sane defaults for trunk, highly tailored for my
  personal use, some things are ultimatly very specfic for each system. For
  example, the monitor config of a window manager. Of course this test can not
  provide an example of a monitor setup, so instead demonstraits how to
  override trunk's defaults by changing hyprlands configuration. The relevant
  file is ./home.nix
  */
  outputs = { self, nixpkgs, trunk, home-manager }: {
    nixosConfigurations.container = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules =
        [
          home-manager.nixosModules.home-manager
          (trunk.nixosModules.common)
          (import ./main.nix)
          (import ./hardware.nix)
          ({ pkgs, lib, ... }: {
            home-manager = {
              useUserPackages = true;
              users.willow = pkgs.lib.mkMerge [
                (trunk.nixosModules.userZshStarship)
                (trunk.nixosModules.userHyprland (import ./overrides/hyprland.nix))
                (import ./home.nix)
              ];
            };
          })
        ];
    };
  };
}
