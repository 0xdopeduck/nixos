{ inputs, config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Required for Wayland compositors
  security.polkit.enable = true;
  services.dbus.enable = true;

  # Required for power management
  services.upower.enable = true;

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

  environment.pathsToLink = [
      "/libexec"
    ];

  environment.systemPackages = with pkgs; [
    waybar                      # status bar
    swaynotificationcenter      # notification
    networkmanagerapplet
    brightnessctl
    wev
    bibata-cursors
    imagemagick_light
    polkit_gnome
    wlsunset
    sxiv
    rofi                        # app launcher
    grim slurp swappy
    wl-clipboard                # clipboard
    swww                   # wallpaper
    xdg-desktop-portal-hyprland
    hyprlock
    hypridle
    wf-recorder
    brightnessctl
    thunar
    thunar-volman
    thunar-vcs-plugin
    thunar-archive-plugin
    sddm-astronaut
    tokyonight-gtk-theme
    dracula-icon-theme
    nwg-look
    wlogout
    pavucontrol
    blueman

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    upower
    upower-notify
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
    "image/png" = "sxiv.desktop";
    "image/jpeg" = "sxiv.desktop";
    "video/mp4" = "mpv.desktop";
  };

  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
  };

  services.blueman.enable = true;

  # Required for automount
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.ssh.startAgent = true;

  # This ensures that screensharing, file pickes, Flatpak does not break
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}

