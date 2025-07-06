# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   # GUI tools
   burpsuite
   jadx
   jdk17         
   dnsrecon         
   massdns
   bind             
   nmap             
   rustscan         
   uncover          
   gau              
   sqlmap           
   ghauri           
   subfinder        
   assetfinder      
   theharvester     
   massdns          
   gobuster         
   ffuf             
   httpx            
   pacu             
   frida-tools      
   trufflehog
   s3scanner
   gowitness
   amass
   zgrab2
   massdns
   jq
   assetfinder
   amass
  ];

}
