# nixconf-wsl

My NixOS configuration for WSL as a flake (NixOS-WSL + home-manager),
set up as a network engineering workstation. Public repo.

Follows the SG303 baseline v1 (`sgstack/global/AGENTS.md`,
`sgstack/baseline/tools.md`). If you cannot read those: work on a branch,
open a PR, merge only with green checks (squash); never commit secrets or
personal data; English for everything in the repo; talk to me in German.

## Commands

Nix is not installed on this host; use the `nixos/nix` image:
`docker run --rm -v "$PWD":/w -w /w nixos/nix sh -c 'git config --global --add safe.directory /w; NIX_CONFIG="experimental-features = nix-command flakes" nix flake check --no-build'`

- Evaluate: `nix flake check --no-build`
- Format: `nix fmt` (check only: `nix fmt -- --ci`)
- Apply (on the WSL instance only, by me): `sudo nixos-rebuild switch --flake .#nixos-wsl`

## Release

No releases or tags. I apply `main` on my WSL instance.

## Conventions

- The system is `nixosConfigurations.nixos-wsl` (x86_64-linux), user `nixos`.
- nixpkgs and home-manager follow the same NixOS release branch (currently
  26.05); upgrade both together and before the release reaches end of life.
  `home.stateVersion` and `system.stateVersion` stay unchanged on upgrades.
- Never commit secrets, SSH keys or real hostnames/IPs; `home.nix` only names
  the key file, the key stays on the machine.
- Run `nix fmt` before committing.

## Deviations from baseline

- `dependabot`: Dependabot cannot update Nix flake inputs; I update them with
  `nix flake update`. Dependabot only covers GitHub Actions.
