# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk17; # Or a newer version like pkgs.jdk17
  };

  environment.systemPackages = with pkgs; [
   # Programming
   ## Editor
   neovim 
   vscode
   code-cursor

   ## Version-Control
   git

   ## Compiler
   libgcc
   libgccjit
   gnumake
   go
   python3Full

   ## Support tools
   ripgrep
   fd
   fzf
   virtualenv
   pipx

   ## Cloud
   awscli2
   google-cloud-sdk
   azure-cli

   ## NPM Manager
   fnm

   # Browsers
   brave
   google-chrome

   # GPU monitoring
   inxi
   pciutils

   # Misc
   wget
   curl
   unzip
   gzip
   starship
   zoxide
   ranger
   lf
   lsd

   # Terminal
   ghostty

   # Fonts
   nerd-fonts.fantasque-sans-mono
   nerd-fonts.jetbrains-mono

   # Social
   discord


  ];


}
