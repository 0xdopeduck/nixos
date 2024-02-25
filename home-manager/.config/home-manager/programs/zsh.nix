{ config, pkgs, ... }:

{

	programs.zsh = {
		enable = true;

		antidote.enable = true;
		antidote.plugins = [
			"Aloxaf/fzf-tab"
			"Aloxaf/gencomp"
			"MichaelAquilina/zsh-autoswitch-virtualenv"
			"zdharma-continuum/fast-syntax-highlighting"
			"zsh-users/zsh-autosuggestions"
			"zsh-users/zsh-completions"
		];

		autocd = true;
		history.share = true;
		history.size = 1000;
		enableCompletion = true;
		#environment.pathsToLink = [ "/share/zsh" ];

		initExtra = "
				zstyle ':fzf-tab:complete:_zlua:*' query-string input
				zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
				zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
				zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
				zstyle ':fzf-tab:*' switch-group ',' '.'
				zstyle ':completion:*:git-checkout:*' sort false
			";

	};
		
}
