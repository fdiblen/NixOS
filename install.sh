#!/bin/sh

# prepare
nix-env -f '<nixpkgs>' -iA git rsync curl
#nix-env -f '<nixpkgs>' -iA git rsync curl qemu
# sudo nix-store --gc

# clone the config
if [ $# -gt 0 ]
  then
    SCRIPT_DIR=$1
  else
    SCRIPT_DIR=~/.nixos-config
fi

nix-shell -p git --command "git clone https://github.com/fdiblen/nixos-config $SCRIPT_DIR"

# generate hardware config
sudo nixos-generate-config --no-filesystems --show-hardware-config > $SCRIPT_DIR/hardware-configuration.nix

## install

# sudo nixos-generate-config --no-filesystems --show-hardware-config > /home/nixos/nixos-flake-install/hardware-configuration.nix

# sudo nix --experimental-features "nix-command flakes" \
#     run "github:nix-community/disko#disko-install" -- --write-efi-boot-entries \
#     --flake "/home/nixos/nixos-flake-install/#minimal" \
#     --disk main /dev/sda

sudo nix --experimental-features "nix-command flakes" \
    run "github:nix-community/disko#disko-install" -- --write-efi-boot-entries \
    --flake "$SCRIPT_DIR/#minimal" \
    --disk main /dev/sda
