# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   
   amass
   assetfinder
   bind
   caido
   dig
   dnsrecon
   ffuf
   # findomain
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
