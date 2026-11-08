# nixconf-wsl

My NixOS configuration for WSL (Windows Subsystem for Linux): a flake with
[NixOS-WSL](https://github.com/nix-community/NixOS-WSL) and
[home-manager](https://github.com/nix-community/home-manager), set up as a
network engineering workstation (nmap, tcpdump, tshark, iperf, mtr, …),
Docker, zsh and Neovim.

| File | Content |
| --- | --- |
| `flake.nix` | Inputs (nixpkgs and home-manager release 26.05, NixOS-WSL) and the system `nixos-wsl` |
| `configuration.nix` | System: WSL settings, DNS, packages, Docker, zsh, Neovim |
| `home.nix` | User `nixos`: SSH and Git configuration |

## Apply

Inside a NixOS-WSL instance, from a clone of this repo:

```sh
sudo nixos-rebuild switch --flake .#nixos-wsl
```

## Update

```sh
nix flake update                                   # newer package versions
sudo nixos-rebuild switch --flake .#nixos-wsl
```

Moving to a new NixOS release means changing the release in the `nixpkgs` and
`home-manager` URLs in `flake.nix` before `nix flake update`.

## Development

```sh
nix flake check --no-build   # evaluates the configuration
nix fmt                      # formats all .nix files (nixfmt)
```

## License

[MIT](LICENSE).
