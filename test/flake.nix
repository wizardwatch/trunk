{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    trunk ={
      url = "path:../";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, trunk}: {

    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        
        [ 
          (trunk.nixosModules.common)
          (trunk.nixosModules.hyprland) 
          {config.systems.dev.enable = true;}
          ({ pkgs,... }: {
            boot.isContainer = true;
            programs.hyprland.enable = true;
            # Let 'nixos-version --json' know about the Git revision
            # of this flake.

            # Network configuration.
            networking.useDHCP = false;
            networking.firewall.allowedTCPPorts = [ 80 ];

            # Enable a web server.
            services.httpd = {
              enable = true;
              adminAddr = "morty@example.org";
            };
          })
        ];
    };

  };
}
