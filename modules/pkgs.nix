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
   binutils

   ## Version-Control
   git

   ## Compiler
   gcc
   go
   gopls
   python3Full
   glibc
   gnumake   # Often required for build scripts

   # kubernetes
   kubectl
   cri-tools
   etcd
   kind

   ## Support tools
   ripgrep
   fd
   fzf
   # virtualenv
   pipx

   ## Cloud
   awscli2
   google-cloud-sdk
   azure-cli

   ## NPM Manager
   nodejs_24

   # Browsers
   brave
   google-chrome

   # GPU monitoring
   inxi
   pciutils

   # Misc
   wget
   curl
   xclip
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

   # Note-taking
   obsidian

   # Office
   libreoffice-still

   # NixOS
   appimage-run
   cachix



  ];


}
