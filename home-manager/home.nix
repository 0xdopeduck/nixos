{ config, pkgs, lib, ... }:

{
	imports = [
		./common.nix
		./modules/cybersec.nix
	];

}
