{ config, lib, ...}:

{
	programs.starship.enable = true;
	programs.starship.enableZshIntegration = true;
	programs.starship.settings = {

		format = lib.concatStrings ["[┌─<<](bold fg:33)" "$username" "@" "$hostname" "[>>](bold fg:33) " "$status" "$directory" "$git_branch" "$git_status" "$nix_shell" "\n" "[└─](bold fg:33)" "$character" ];

		scan_timeout = 10;
		add_newline = false;
		character = {
			success_symbol = "[>](bold fg:33)";
			error_symbol = "[e><](bold fg:9)";
			vicmd_symbol = "[><](bold fg:33)";
		};
		username = {
			style_user = "bold fg:206";
			format = "[$user]($style)";
			show_always = true;
			disabled = false;
		};
		hostname = {
			ssh_only = false;
			style = "italic dimmed fg:93";
			format = "[$hostname]($style)";
			disabled = false;
		};
		directory = {
			truncation_length = 3;
			truncate_to_repo = true;
			read_only = "[R]";
			read_only_style = "bold fg:160";
			home_symbol="~";
			style = "bold fg:76";
			format = "[$path]($style)[$read_only](read_only_style)";
			disabled = false;
		};
			
	};
}
