{ config, pkgs, ... }:

{

	programs.tmux = {
		enable = true;
		baseIndex = 1;
		historyLimit = 10000;
		keyMode = "vi";
		prefix = "C-Space";
		shell = "${pkgs.zsh}/bin/zsh";
		terminal = "screen-256color";
		tmuxinator.enable = true;
		extraConfig = ''

			unbind -T copy-mode-vi Space; #Default for begin-selection
			unbind -T copy-mode-vi Enter; #Default for copy-selection
			
			bind -T copy-mode-vi v send-keys -X begin-selection
			bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"


		'';

	};
		
}
