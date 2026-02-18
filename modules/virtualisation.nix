# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Start libvirtd service
  virtualisation = {
      libvirtd = {
        enable = true;
      };

      podman = {
        enable = true;
        dockerCompat = true;
      };

      waydroid = {
        enable = true;
      };

      lxc = {
        enable = true;
      };

    };

  services.dnsmasq.enable = false;


  # Waydroid service
    boot.kernelModules = [
    "binder_linux"
    "ashmem_linux"
    "br_netfilter"
  ];

  networking.firewall.trustedInterfaces = [ "waydroid0" ];
  networking.nftables.enable = true;


  #
  # # Enable IP forwarding for container networking
    boot.kernel.sysctl = {
    "net.ipv4.ip_forward"            = 1;
    "net.ipv4.conf.all.forwarding"   = 1;
    "net.ipv6.conf.all.forwarding"   = 1;
  };

  users.users.oxdopeduck = {
    extraGroups = [ "libvirt" "kvm" "libvirtd" "render" ];
  };

	environment.systemPackages = [
	  pkgs.spice-vdagent
	  pkgs.virglrenderer
	  pkgs.waydroid
      pkgs.iptables
      pkgs.iproute2
      pkgs.nftables          
	];


  # Install and enable virt-manager
  programs.virt-manager.enable = true;            

  # Enabling docker
  # virtualisation.docker.enable = true;          
  # virtualisation.docker.rootless.enable = true; 
  # users.extraGroups.docker.members = [ "oxdopeduck" ];


}
