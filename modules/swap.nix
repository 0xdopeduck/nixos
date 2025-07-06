# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

	zramSwap.enable     = true;
  	zramSwap.memoryPercent = 50;
  	swapDevices = [{ device = "/swapfile"; size = 32768; }];
  	boot.kernel.sysctl."vm.swappiness" = 20;

}
