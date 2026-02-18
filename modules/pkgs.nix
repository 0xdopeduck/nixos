# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;

      Preferences = {
        # --- Telemetry ---
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";

        # --- Studies ---
        "app.shield.optoutstudies.enabled" = false;

        # --- Privacy ---
        "privacy.trackingprotection.enabled" = true;
        "privacy.firstparty.isolate" = true;

      };
    };
  };


  programs.java = {
    enable = true;
    package = pkgs.jdk25; # Or a newer version like pkgs.jdk17
  };

  environment.systemPackages = with pkgs; [

   ## Editor
   neovim 
   tree-sitter
   code-cursor

   ## Version-Control
   git
   lazygit

   # VM
   distrobox

   # Video player
   mpv

   ## Compiler & language server
   gcc
   go
   gopls
   nil
   rust-analyzer
   clang-tools
   yaml-language-server
   marksman
   python314
   glibc
   gnumake   
   binutils

   # kubernetes
   kubectl
   kind

   ## Support tools
   ripgrep
   fd
   fzf
   pipx

   # Browsers
   vivaldi

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
   openssl
   bat
   htop
   jless
   stow
   zathura
   imagemagick_light
   gvfs
   polkit_gnome

   #File Manager
   yazi
   lf
   ffmpegthumbnailer
   ffmpeg
   poppler-utils
   highlight
   mediainfo
   exiftool
   lsd
   pandoc
   lynx
   jq
   ueberzugpp
   file
   xdg-utils
   coreutils

   #Books manager
   calibre

   # Terminal
   ghostty
   tmux

   # Social
   discord

   # Office
   libreoffice-still
   
   # Notes
   obsidian

   # NixOS
   appimage-run
   cachix
   appimage-run

   #Security
   caido
   jadx
   httptoolkit
   httptoolkit-server
   # inputs.burpsuitepro.packages.${system}.default

  ];

}
