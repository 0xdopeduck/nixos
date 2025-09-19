# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Start libvirtd service
  virtualisation.libvirtd = {
	enable = true;
	qemu.ovmf.enable = true;
	qemu.swtpm.enable = true;
  };

  users.users.oxdopeduck = {
    extraGroups = [ "libvirt" "kvm" "libvirtd" "render" ];
  };

	environment.systemPackages = [
	  pkgs.spice-vdagent
	  pkgs.virglrenderer
	];


  # Install and enable virt-manager
  programs.virt-manager.enable = true;            

  # Enabling docker
  virtualisation.docker.enable = true;          
  virtualisation.docker.rootless.enable = true; 
  users.extraGroups.docker.members = [ "oxdopeduck" ];


}
