{ config, pkgs, ... }:

{

	programs.zsh.enable = true;
	programs.zsh.enableAutosuggestions = true;
	programs.zsh.autocd = true;
	programs.zsh.history.share = true;
	programs.zsh.history.size = "1000";
	programs.zsh.enableCompletion = true;
	programs.zsh.dirHashes = {
		
		htb = "$HOME/HTB";
		seclists = "/usr/share/seclists";

	};
	programs.zsh.antidote.enable = true;
	programs.zsh.antidote.plugins = [
		"zdharma-continuum/fast-syntax-highlighting"
	];
		
}
