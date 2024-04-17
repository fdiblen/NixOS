# NixOS-config/flake.nix

{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
  nixosConfigurations = {

      # worklaptop configuration
      worklaptop = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/worklaptop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

    };
  };
}
