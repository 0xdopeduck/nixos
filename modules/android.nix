# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.oxdopeduck = {
    extraGroups = [ "adbuser" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable ADB udev rules
  # services.udev.packages = [ pkgs.android-udev-rules ];

  # Enable adb daemon service
  # programs.adb.enable = true;                   

  # nixpkgs.config.android_sdk.accept_license = true;

  environment.systemPackages = with pkgs; [

   # Tools and Packages
   # android-studio
   android-tools

   #Security

  ];

}
