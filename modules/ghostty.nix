{ config, pkgs, lib, ... }:

let
  cfg = config.services.ghostty;  # if you wrap this as a module
in
{
  # Install the ghostty terminal emulator
  environment.systemPackages = with pkgs; [
    ghostty
  ];

  # Deploy a declarative Ghostty config at /etc/ghostty/config.toml
  environment.etc."ghostty/config.toml".text = lib.concatStringsSep "\n" (lib.filter (line: line != "") [
    "## Ghostty Configuration (managed by NixOS)"
    ""
    "## Theme Settings"
    # Use a single theme; to use light/dark variants, uncomment below
    "theme = \"tokyonight\""
    # "theme = \"light:tokyonight-day,dark:tokyonight\""
    ""
    "## Font Settings"
    "font-family = \"NerdFonts Fantasque Sans Mono\""
    "font-size = 14"
    ""
    "# Optional font adjustments"
    "adjust-cell-width = 0"
    "adjust-cell-height = 2"
    "font-feature = \"-dlig\""
    ""
    "## Window and Visuals"
    "window-padding-x = 10"
    "window-padding-y = 10"
    "background-opacity = 0.95"
    ""
    "## Cursor Settings"
    "cursor-style = \"block\""
    "cursor-style-blink = true"
    "cursor-invert-fg-bg = true"
  ]);

}

