{ config, pkgs, ... }:

{

	programs.tmux.enable = true;
	programs.tmux.baseIndex = 1;
	programs.tmux.historyLimit = 10000;
	programs.tmux.keyMode = "vi";
	programs.tmux.prefix = "C-Space";
	programs.tmux.shell = "\$(pkgs.zsh}/bin/zsh";
	programs.tmux.terminal = "screen-256color";
	programs.tmux.tmuxinator.enable = true;
	programs.tmux.extraConfig = "";
		
}
