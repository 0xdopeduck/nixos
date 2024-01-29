{ config, ... }:

{
	imports = [
		./fzf.nix
		./tmux.nix
		./starship.nix
		./zsh.nix
	];
}
