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
    heroic
  ];

  programs.gamemode.enable = true;
  programs.gamemode.settings.general.inhibit_screensaver = 0;
  users.users.oxdopeduck.extraGroups = [ "gamemode" ];

  programs.steam.gamescopeSession.enable = true;
  programs.steam = {
    enable = true;
  };

}
