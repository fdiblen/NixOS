# profiles/minimal/configuration.nix

{ config, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ # Hardware config
      ../../hardware-configuration.nix # DO NOT remove this

      # ├── modules/apps
      #       ../../modules/apps/browsers.nix
      #       ../../modules/apps/development.nix
      # ├── modules/config
      #       ../../modules/config/bashrc
      ../../modules/config/users.nix
      # ├── modules/desktop
      #       ../../modules/desktop/fonts.nix
      ../../modules/desktop/locale_nl.nix
      # ../../modules/desktop/plasma.nix
      ../../modules/desktop/shells.nix
      # ├── modules/hardware
      #       ../../modules/hardware/bluetooth.nix
      ../../modules/hardware/firmware.nix
      #       ../../modules/hardware/nvidia.nix
      #       ../../modules/hardware/opengl.nix
      #       ../../modules/hardware/sound.nix
      #       ../../modules/hardware/touchpad.nix
      # ├── modules/services
      #       ../../modules/services/flatpak.nix
      ../../modules/services/network.nix
      #       ../../modules/services/power.nix
      #       ../../modules/services/printing.nix
      #       ../../modules/services/virtualisation.nix
    ];




  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Extra nix features
  nix.settings.experimental-features = [ "nix-command" "flakes"];


  # Boot configuration
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      #efiInstallAsRemovable = true;
      device = "nodev";
    };
    plymouth.enable = true;
  };


  # hostname
  networking.hostName = "jokerXPS15"; # Define your hostname.


  ## Configure keymap in X11
  #services.xserver = {
  #  xkb = {
  #    layout = "us";
  #    variant = "";
  #  }
  #};


  # home-manager = {
  #   # also pass inputs to home-manager modules
  #   extraSpecialArgs = { inherit inputs; };
  #   users = {
  #     "fdiblen" = import ./home.nix;
  #   };
  # };


  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wget
    curl
    rsync
    htop
    powertop
    vim
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # List services that you want to enable
  #

  system.stateVersion = "unstable"; # Did you read the comment?
}
