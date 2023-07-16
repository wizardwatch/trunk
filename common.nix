{ config, pkgs, lib, ...}:
          
let
  cfg = config.systems.dev;
  
in
with pkgs.lib; 
{
    options.systems.dev = {
        enable = mkOption { 
            description = "If this machine is used for software development";
            type = types.bool;
            default = false;
        };
    };
    config = {
        environment.systemPackages = [ ] ++ (lib.optionals cfg.enable) 
        [pkgs.arduino];
    };
}
