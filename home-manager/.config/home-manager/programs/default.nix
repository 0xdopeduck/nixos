{ config, ... }:

{
	imports = [
		./fzf.nix
		./tmux.nix
		./starship.nix
		./zsh.nix
		./yazi.nix
		./commands.nix
		./zoxide.nix
		#./alacritty.nix
	];
}
