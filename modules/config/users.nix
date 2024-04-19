{ config, pkgs, ...}:

{
  # Define a user account
  users.defaultUserShell = pkgs.fish;
  users.users.fdiblen = {
   isNormalUser = true;
   description = "main user";
   initialPassword = "12345";
   shell = pkgs.fish;
   extraGroups = [ "networkmanager" "wheel" ];
   packages = with pkgs; [
    #  firefox
   ];
  };
}