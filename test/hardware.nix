{ config, pkgs, lib, home-manager, ... }:
{
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
}
