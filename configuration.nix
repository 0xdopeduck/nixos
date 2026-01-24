# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./modules/common.nix
      ./modules/gnome.nix
      # ./modules/hyprland.nix
      ./modules/font.nix
      ./modules/pkgs.nix
      ./modules/virtualisation.nix
      ./modules/network.nix
      ./modules/users.nix
      ./modules/games.nix
      ./modules/nixos.nix
      ./modules/android.nix
      ./modules/amd_pstate.nix
      ./modules/amd_zenpower.nix
      ./modules/ssd.nix
      ./modules/swap.nix
      ./modules/zsh.nix
      ./hosts/asus.nix
      ./hardware-configuration.nix
      ./cachix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  system.stateVersion = "25.05"; # Did you read the comment?

}
