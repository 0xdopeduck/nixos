# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  networking.hostName = "bladerunner";

  # Enabling asusctl
  services.asusd = {
      enable = true;
      enableUserService = true;
  };

  # Add supergfxd to manager the GPU
  services.supergfxd.enable = true;
  
  systemd.services."nvidia-powerd.service".enable = false;

  # Disabling kernerl modules and parameters that are not required
  boot.kernelModules = [ "i2c_nvidia_gpu" ];
  boot.blacklistedKernelModules = [ 
  	"ucsi_ccg" 
	"iTCO_wdt" 
	"sp5100_tco"
 	"nouveau" 
	"nvidia"
	"nvidia_drm"
	"nvidia_modeset"
	"nvidia_uvm"
  ];

  # boot.kernelParams = [ "amdgpu.dc=0" ];
  boot.kernelParams = [ "quiet" ];

  # Setup Latest opensource Nvidia Drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {

    # Enable opensource drivers
    open = true;

    modesetting.enable = true;
    nvidiaSettings = true;

    # Hybrid GPU switching
    prime = {
      offload.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:4:0:0";
    };


    # For proper battery management and suspend
    powerManagement = {
	  enable = true;
	  finegrained = true;
	};
  };


  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # For better battery management
  services.power-profiles-daemon.enable = true;

}
