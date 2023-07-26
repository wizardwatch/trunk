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

  outputs = { self, nixpkgs, trunk, home-manager }: {
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules =

        [
          home-manager.nixosModules.home-manager
          (trunk.nixosModules.common)
          (trunk.nixosModules.userWillow)
          {

            config.systems.dev.enable = true;
            options.systems.hyprland.enable = true;
          }
          ({ pkgs, lib, ... }: {
            environment = {
              systemPackages = with nixpkgs; [
                home-manager
              ];
              sessionVariables = {
                HOME = "/home/willow/";
                XDG_CONFIG_HOME = "/home/willow/.config";
              };
            };
            home-manager = {
              useUserPackages = true;
              users.willow = pkgs.lib.mkMerge [
                (trunk.nixosModules.userZshStarship.lib.home-manager)
                (trunk.nixosModules.userHyprland.lib.home-manager)
                (import ./home.nix)
              ];
            };
            users.extraUsers.root.password = "";
            virtualisation.vmVariant = {
              virtualisation = {
                memorySize = 16192;
                cores = 4;
              };

              virtualisation.qemu.options =
                [ "-device virtio-vga-gl" "-display sdl,gl=on,show-cursor=off" "-full-screen" ];

              environment.sessionVariables = {
                WLR_NO_HARDWARE_CURSORS = "1";
              };
            };
          })
        ];
    };

  };
}
