# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, disko, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {

    nixosConfigurations = {
      minimal = nixpkgs.lib.nixosSystem {
        modules = [
          ./profiles/minimal/configuration.nix
          inputs.disko.nixosModules.disko
          ./profiles/minimal/disko.nix
        ];
      };
    };

  };
}
