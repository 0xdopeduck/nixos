# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./modules/common.nix
      ./modules/gnome.nix
      ./modules/pkgs.nix
      ./modules/virtualisation.nix
      ./modules/network.nix
      ./modules/users.nix
      ./modules/games.nix
      ./modules/nixos.nix
      ./modules/sec-tools.nix
      # ./modules/android.nix
      ./hosts/asus.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  system.stateVersion = "25.05"; # Did you read the comment?

}
