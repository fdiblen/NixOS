{ config, pkgs, ...}:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
in
{

  programs.bash = {
    # enable = true;
    # historySize = 1000000;
    # historyFileSize = 1000000;
    # shellAliases = myAliases;
    enableLsColors = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

}