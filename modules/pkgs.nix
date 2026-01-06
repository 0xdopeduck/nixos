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
    package = pkgs.jdk25; # Or a newer version like pkgs.jdk17
  };

  environment.systemPackages = with pkgs; [
   # Programming

   ## Editor
   ### TUI
   neovim 
   tree-sitter
   ### GUI
   vscode
   zed-editor
   ## AI
   code-cursor

   ## Version-Control
   git
   lazygit

   ## Compiler & language server
   gcc
   go
   gopls
   nil
   rust-analyzer
   clang-tools
   yaml-language-server
   marksman
   python3
   glibc
   gnumake   
   binutils

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
   terraform

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
   openssl
   bat
   htop
   jless
   mission-center
   stow
   zathura
   imagemagick_light

   #Latex
   texliveSmall

   # Terminal
   ghostty
   tmux

   # Social
   discord

   # Office
   libreoffice-still

   # NixOS
   appimage-run
   cachix
   appimage-run

   #privacy
   bitwarden-desktop

  ];

}
