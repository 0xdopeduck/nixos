# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.oxdopeduck = {
    extraGroups = [ "libvirt" "kvm" ];
  };
  # Start libvirtd service
  virtualisation.libvirtd.enable = true;          

  # Install and enable virt-manager
  programs.virt-manager.enable = true;            

  # Enabling docker
  virtualisation.docker.enable = true;          
  virtualisation.docker.rootless.enable = true; 
  users.extraGroups.docker.members = [ "oxdopeduck" ];

}
