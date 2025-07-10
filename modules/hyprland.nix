# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  programs.hyprland = {
      enable = true;
      # Enable XWayland for running X11 applications
      xwayland.enable = true;
      withUWSM = true;
    };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
   waybar
   swww
   rofi
  ];

  # Hint to Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

}
