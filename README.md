# NixOS-config

This is my personal NiOS config. It is not guaranteed that it will work on your system.

**Use at your own risk!**

## Usage

### 1. Clone this repository

```shell
git clone https://github.com/fdiblen/NixOS-config.git
```

### 2. Partition your system

Automated partitioning is achived by using disko ([https://github.com/nix-community/disko](https://github.com/nix-community/disko)).

```shell
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./NixOS-config/modules/partitioning/luks-btrfs.nix
```

### 3. Rebuild the system

Rebuild using the **worklaptop** configuration (hosts/worklaptop):

```shell
sudo nixos-rebuild switch --flake ./NixOS-config#worklaptop
```

## Notes and tips

### Bootloader

Re-installing the bootloader from a running system

```shell
sudo nixos-rebuild --install-bootloader boot
```

## Useful links

see [LINKS.md](LINKS.md)
