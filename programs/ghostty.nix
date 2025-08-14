{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
	theme = "tokyonight";
	
	font-family = "NerdFonts Fantasque Sans Mono";
	font-size = 14;
	
	adjust-cell-width = 0;
	adjust-cell-height = 2;
	
	
	window-padding-x = 10;
	window-padding-y = 10;
	
	background-opacity = 0.95;
	
	cursor-style-blink = true;
	cursor-invert-fg-bg = true;
	};
  };

}
