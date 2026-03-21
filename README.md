# dot-stubs

Public stub flakes for private NixOS/Darwin module interfaces.

Each subdirectory is a standalone flake that declares the **option interface** of a
private project (e.g. `vantage`). By default, the main
[dot](https://github.com/GDR/dot) flake points here. At deploy time, hosts that
need the real implementation override the input:

```bash
nixos-rebuild switch --flake .#nix-oldstar \
  --override-input vantage github:GDR/vantage
```

## Structure

```
vantage/flake.nix   — stubs for github:GDR/vantage NixOS/Darwin modules
```
