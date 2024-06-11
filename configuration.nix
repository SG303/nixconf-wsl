{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.wslConf.network.generateResolvConf = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.nameservers = [ "9.9.9.9" "1.1.1.1" ];
  networking.hostName = "nixos-wsl";

  time.timeZone = "Europe/Zurich";

  users.users.nixos.extraGroups = [ "docker" ];

  users.defaultUserShell = pkgs.zsh;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    du-dust
    zsh
    curl
    nmap
    iperf
    iperf2
    tcpdump
    ipcalc
    pwncat
    dnsutils
    iptraf-ng
    arp-scan
    hping
    mtr
    iftop
    whois
    fping
    tshark
    arping
    tcptrack
    slurm
    ethtool
    inetutils
    ngrep
    bmon
    darkstat
    jnettop
    dstat
    nikto
    speedtest-cli
    xclip
  ];
  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;
      configure = {
        customRC = ''
        set number relativenumber
        inoremap jj <Esc>
        set bg=dark
      '';
      }; 
    };
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "history"
          "colored-man-pages"
          ];
      };
    };
  };

  system.stateVersion = "23.11";
}
