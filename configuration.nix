# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.asusd = {
  	enable = true;
	};

  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway
  hardware.nvidia.modesetting.enable = true;

  networking.hostName = "mainframe";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Configuring Nix package manager
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	videoDrivers = [ "nvidia" "amdgpu" ];
  	layout = "us";
	
	libinput = {
		enable = true;
		touchpad = {
		naturalScrolling = false;
		tapping = true;
		};
	};

  	# services.xserver.xkbOptions = {
  	#   "eurosign:e";
  	#   "caps:escape" # map caps to escape.
  	# };

   	desktopManager = {
   	     xterm.enable = false;
   	};

   	displayManager = {
   	     defaultSession = "none+i3";
   	};

   	windowManager.i3 = {
   	     package = pkgs.i3-gaps;
   	     enable = true;
   	     extraPackages = with pkgs; [
   	     	dmenu
   	     	i3status
   	     	i3lock
   	     	i3blocks
   	     ];
   	};
  };


  # Configure keymap in X11
  environment.pathsToLink = [ "/libexec" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oxdopeduck = {
     isNormalUser = true;
     password = "test123";
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       alacritty
       arandr
       mpv
       dracula-theme
       dracual-icon-theme
       flameshot
       xfce.thunar
       xfce.thunar-volman
       xfce.thunar-archive-plugin
       lxappearance
       rofi
       feh
       picom
       autocutsel
       discord
       networkmanagerapplet
       brave
       obsidian
     ];
   };

  users.defaultUserShell = pkgs.zsh;

  # Configuring Nix Package Manager
  nix.settings.auto-optimise-store = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     neovim
     wget
     curl
     git
     tmux
     stow
     lf
     ranger
     fzf
     starship
     zsh
     asusctl
   ];

   fonts.fonts = with pkgs; [
	noto-fonts
	noto-fonts-emoji
	proggyfonts
	liberation_ttf
	jetbrains-mono
   ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs = {
  	gnupg.agent = {
    		enable = true;
    		enableSSHSupport = true;
		};
	zsh.enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
