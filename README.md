# NixOS-config - WIP (work in progress)

## **Use at your own risk!**

This is my personal NixOS config. It is not guaranteed that it will work on your system.

## Usage

### 1. Preparation

Install the required tools

```shell
nix-env -f '<nixpkgs>' -iA git rsync curl
```

Clone this repository

```shell
git clone https://github.com/fdiblen/NixOS-config.git
```

### 2. Partition your disk

Automated partitioning is achived using disko ([https://github.com/nix-community/disko](https://github.com/nix-community/disko)).

Uncomment the device in `NixOS-config/modules/partitioning/luks-btrfs.nix`

```shell
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./NixOS-config/modules/partitioning/luks-btrfs.nix
```

### 3. Generate config

```shell
sudo nixos-generate-config --no-filesystems --root /mnt
```

### 4. Install

```shell
sudo nixos-install --impure --flake ./NixOS-config#worklaptop --root /mnt
```

### Rebuild the system

Rebuild using the **worklaptop** configuration (hosts/worklaptop):

```shell
sudo nixos-rebuild switch --flake ./NixOS-config#worklaptop
```

## TODO

- Make configuration.nix more modular
- Add dotfiles to home-manager
- System hardening
- Set the firewall rules
- Configure the user shell
- Automate the partitioning step
- Add zram?

## Notes and tips

### Check the flakes

inspect:

```shell
nix --extra-experimental-features "nix-command flakes" flake show
```

check:

```shell
nix --extra-experimental-features "nix-command flakes" flake check
```


nix repl:
```shell
nix --experimental-features "nix-command flakes" repl
Welcome to Nix 2.18.2. Type :? for help.

nix-repl> :lf .
warning: Git tree '/home/fdiblen/Desktop/NixOS-config' is dirty
Added 12 variables.

nix-repl> outputs.nixosConfigurations.worklaptop.config.fileSystems."/"

nix-repl> outputs.nixosConfigurations.worklaptop.config.fileSystems."/boot"
```

### Install dependencies

```shell
sudo nix --experimental-features "nix-command flakes" run  github:fdiblen/NixOS-config
```

### Bootloader

Re-installing the bootloader from a running system

```shell
sudo nixos-rebuild --install-bootloader boot
```

## Useful links

see [LINKS.md](LINKS.md)
