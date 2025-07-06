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
   
   amass
   assetfinder
   bind
   burpsuite
   dig
   dnsrecon
   ffuf
   findomain
   frida-tools
   gau
   ghauri
   gobuster
   gowitness
   httpx
   jadx
   jq
   massdns
   nmap
   pacu
   rustscan
   s3scanner
   sqlmap
   subfinder
   theharvester
   trufflehog
   uncover
   zgrab2

  ];

}
