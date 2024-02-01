{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland.enable = true;

	home.packages = with pkgs;
	[
		alacritty
		firefox
	];

}
