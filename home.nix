{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";


  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        "github.com" = {
	  identityFile = "~/.ssh/nixos_wsl_key";
        };
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
