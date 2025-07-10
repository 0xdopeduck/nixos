# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    ghostty
    waybar
    rofi-wayland
    mako
    swww
    brightnessctl
    grimblast
    wl-clipboard
    thunar
    nwg-display
  ];

  # Enable Hyprland
  programs.hyprland.enable = true;

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.withUWSM = true;

  # Enable display manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
