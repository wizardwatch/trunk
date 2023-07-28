{ pkgs, config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    envExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
