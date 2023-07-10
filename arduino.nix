{ config, pkgs, cfg, lib, ...}:
{
    environment.systemPackages = lib.mkIf (cfg.enable) [pkgs.arduino];
}
