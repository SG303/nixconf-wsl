{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  programs = {
    ssh = {
      enable = true;
      # The old home-manager defaults match OpenSSH's own defaults, so opting
      # out of them changes nothing and silences the deprecation warning.
      enableDefaultConfig = false;
      settings = {
        "github.com" = {
          IdentityFile = "~/.ssh/nixos_wsl_key";
        };
      };
    };
    git = {
      enable = true;
      settings = {
        core = {
          editor = "nvim";
        };
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
