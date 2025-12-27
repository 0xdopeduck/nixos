{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Required for Wayland compositors
  security.polkit.enable = true;
  services.dbus.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar           # status bar
    dunst            # notifications
    rofi-wayland     # app launcher
    grim slurp       # screenshots
    wl-clipboard     # clipboard
    hyprpaper        # wallpaper
    xdg-desktop-portal-hyprland
    hyprlock
    hypridle
    wf-recorder
    brightnessctl
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-vcs-plugin
    xfce.thunar-archive-plugin

  ];

  # This ensures that screensharing, file pickes, Flatpak does not break
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}

