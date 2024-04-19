{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    microsoft-edge
    google-chrome
  ];
};