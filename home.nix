{ config, pkgs, ... }:

{
	home.username = "oxdopeduck";
	home.homeDirectory = "/home/oxdopeduck/";
	home.stateVersion = "24.11";

	programs.zsh = {
		enable = true;

		shellAliases = {
		  nin= "nix-env -iA";
		  nsearch="nix-env --query --available --attr-path";
		  nremove="nix-env --uninstall";
		};
	}
}
