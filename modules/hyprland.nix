{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Required for Wayland compositors
  security.polkit.enable = true;
  services.dbus.enable = true;

  services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
         qt6.qtbase
         qt6.qtmultimedia
         qt6.qtdeclarative
         qt6.qtwayland
      ];
      theme = "sddm-astronaut-theme";
  };

  environment.systemPackages = with pkgs; [
    waybar                      # status bar
    swaynotificationcenter      # notification
    networkmanagerapplet
    bibata-cursors
    rofi                        # app launcher
    grim slurp swappy
    wl-clipboard                # clipboard
    hyprpaper                   # wallpaper
    xdg-desktop-portal-hyprland
    hyprlock
    hypridle
    wf-recorder
    brightnessctl
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-vcs-plugin
    xfce.thunar-archive-plugin
    sddm-astronaut
    tokyonight-gtk-theme
    dracula-icon-theme
    nwg-look
    wlogout
    pavucontrol
    blueman
  ];

  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
  };

  services.blueman.enable = true;

  programs.ssh.startAgent = true;

  # This ensures that screensharing, file pickes, Flatpak does not break
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}

