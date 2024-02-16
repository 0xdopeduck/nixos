{ config, pkgs, lib, ... }:

{
  imports = [
	./programs
	./modules
  ];

  home.username = lib.mkDefault "oxdopeduck";
  home.homeDirectory = "/home/${config.home.username}";

  home.stateVersion = "23.11"; # Do not change value before reading release notes.

  home.packages = with pkgs;
  [
    # # Adds the "hello" command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don"t forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command "my-hello" to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ""
    #   echo "Hello, ${config.home.username}!"
    # "")

    	python3
	pipx
	##gcc

     	(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

	binutils
	openvpn
	openssh
	neovim
	xclip

	fzf
	fd
	htop
	tmux
	zellij
	yazi
	git
	ripgrep
	ranger
	flameshot
	gnugrep
	gawk
	gnused
	less
	lsd
	stow
	starship

  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
    LANG = "en_US.UTF-8";
  };

  home.shellAliases = {

	#Debian
	up = "sudo apt update && sudo apt upgrade";
	"in" = "sudo apt install";
	search = "apt search";
	remove = "sudo apt purge";
	apt-clean = "sudo apt autoremove";
	
	#NixOS
	nin = "nix-env -iA ";
	nsearch = "nix-env -qaPbs";
	nremove = "nix-env --uninstall ";
	hms = "home-manager switch";

	#general
	ls = "lsd -1";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
