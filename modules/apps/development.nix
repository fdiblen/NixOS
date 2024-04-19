{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    root
    geant4

    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    cudaPackages.cuda_nvcc

    python312
    python312Packages.pip
    python312Packages.virtualenv

    nodejs-slim
  ];
}