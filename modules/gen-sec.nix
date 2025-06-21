# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk17; # Or a newer version like pkgs.jdk17
  };

  environment.systemPackages = with pkgs; [

   dnsrecon
   dig
   nmap
   rustscan
   uncover
   gau
   sqlmap
   ghauri
   subfinder
   findomain
   assetfinder
   theharvester
   massdns
   gobuster
   ffuf
   httpx
   pacu
   burpsuite

   #android
   jadx
   frida-tools


  ];


}
