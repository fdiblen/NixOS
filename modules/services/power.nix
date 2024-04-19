{ pkgs, ... }:

{
  # Enable powertop auto-tune
  powerManagement.powertop.enable = true;
}