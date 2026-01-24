{ config, pkgs, ... }:

{

  programs.zsh = {
    shellInit = "";
    loginShellInit = ""; 
  };

  users.users.oxdopeduck = {
    shell = pkgs.zsh;
  };

}

