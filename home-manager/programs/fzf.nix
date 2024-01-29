{ config, pkgs, ... }:

{

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
		fileWidgetOptions = [ "--preview 'head {}'" ];
		defaultOptions = [  "--height 60%"  "--border" ];
		tmux.enableShellIntegration = true;
		tmux.shellIntegrationOptions = [ "-d 40%" ];
		changeDirWidgetCommand = "fd -H -t d";
		fileWidgetCommand = "fd -H -t f";
	};

}
