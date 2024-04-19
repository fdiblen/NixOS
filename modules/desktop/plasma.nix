{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma 6
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable automatic login for the user
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "fdiblen";


  # List packages installed in system profile.
  environment.systemPackages = with pkgs.kdePackages; [
    discover
    sddm-kcm
    flatpak-kcm
    plasma-firewall
    bluedevil
    plasma-thunderbolt
    print-manager
    kdeconnect-kde
    xdg-desktop-portal-kde
    plasma-workspace-wallpapers
    partitionmanager
    kde-gtk-config
    kde-cli-tools
    dolphin-plugins
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    elisa
  ];

}