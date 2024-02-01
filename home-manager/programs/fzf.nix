{ config, pkgs, ... }:

{

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
		fileWidgetOptions = [ "--preview 'head {}'" ];
		defaultOptions = [  "--height 60%"  "--border" ];
		tmux.enableShellIntegration = true;
		tmux.shellIntegrationOptions = [ "-d 40%" ];
		changeDirWidgetCommand = "fd -L -H -t d -t l";
		fileWidgetCommand = "fd -L -H -t f -t l";
	};

}
