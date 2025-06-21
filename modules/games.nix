# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vulkan-tools
    steam
    steam-run
    mangohud
    protonup-qt
  ];

  programs.gamemode.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.steam = {
    enable = true;
  };

}
