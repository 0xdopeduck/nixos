{ config, lib, ...}:

{
	programs.alacritty = {
		enable = true;
		settings = {
			font = {
				normal.family = "JetBrainsMono";
				bold.family = "JetBrainsMono";
				italic = {
					family = "JetBrainsMono";
					style = "Italic";
					};
				bold_italic = {
					family = "JetBrainsMono";
					style = "Bold Italic";
					};
				size = 20;
			};
			window.opacity = 0.7;
			cursor.style = { 
				shape = "Block"; 
				blinking = "Always";
			};

			# Purify
			colors = {
				  # Selection colors
				  selection = {
					    text = "#1c1c1c";
					    background = "#d0d0d0";
					};

				  # Normal colors
				  primary = {
					    background = "#1c1c1c";
					    foreground = "#d0d0d0"; 
					};
				  normal= {
					    black =   "#1c1c1c";
					    red =     "#af005f";
					    green =   "#5faf00";
					    yellow =  "#d7af5f";
					    blue =    "#5fafd7";
					    magenta = "#808080";
					    cyan =    "#d7875f";
					    white =   "#d0d0d0";
				    };

				  # Bright colors
				  bright= {
				    black =   "#585858";
				    red =     "#5faf5f";
				    green =   "#afd700";
				    yellow =  "#af87d7";
				    blue =    "#ffaf00";
				    magenta = "#ff5faf";
				    cyan =    "#00afaf";
				    white =   "#5f8787";
				    };
				};

		};
	};

}
