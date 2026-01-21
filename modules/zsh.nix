{ config, pkgs, ... }:

{

	#  environment.systemPackages = with pkgs; [
	# 	pure-prompt
	# ];

  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    # autosuggestions.enable = true;
    # syntaxHighlighting.enable = true;
    #
    # histFile = "$HOME/.zsh_history";
    # histSize = 1000;
    # # saveHist = 1000;
    #
    # setOptions = [
    #   "vi"
    # ];

    # unsetOptions = [
    #   "beep"
    # ];

    shellInit = "";

	#    loginShellInit = ''
	#        # Shell config
	# source $HOME/.zshenv
	#    '';
    loginShellInit = ""; 

	#    interactiveShellInit = ''
	#      # Source custom files
	#      if command -v kubectl >/dev/null 2>&1; then
	#        mkdir -p "$HOME/.config/zsh"
	#        if [ ! -f "$HOME/.config/zsh/kube_completion.zsh" ]; then
	#          kubectl completion zsh > "$HOME/.config/zsh/kube_completion.zsh"
	#        fi
	#        source "$HOME/.config/zsh/kube_completion.zsh"
	#      fi
	#
	#      fpath+=("${pkgs.pure-prompt}/share/zsh/site-functions")
	#
	#      if command -v fzf >/dev/null 2>&1; then
	#        # Source FZF completion and key bindings if available
	#        if [ -f "${pkgs.fzf}/share/fzf/completion.zsh" ]; then
	#          source "${pkgs.fzf}/share/fzf/completion.zsh"
	#        fi
	#        if [ -f "${pkgs.fzf}/share/fzf/key-bindings.zsh" ]; then
	#          source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
	#        fi
	#      fi
	#
	# export FZF_DEFAULT_COMMAND='fd -L -H -t d -t l'
	# export FZF_DEFAULT_OPTS="--height 60%  --border"
	#    export NIXPKGS_ALLOW_UNFREE=1
	# export FZF_CTRL_R_OPTS="
	#   --preview 'echo {}' --preview-window up:3:hidden:wrap
	#   --bind 'ctrl-/:toggle-preview'
	#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
	#   --color header:italic
	#   --header 'Press CTRL-Y to copy command into clipboard'"
	# export FZF_CTRL_T_OPTS="
	#   --preview 'bat -n --color=always {}'
	#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
	# export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
	#
	#        autoload -U +X bashcompinit && bashcompinit
	#        complete -o nospace -C ${pkgs.terraform}/bin/terraform terraform
	#    '';
	#
	#
	#    promptInit = ''
	#          if [ "$TERM" != dumb ]; then
	#            autoload -U promptinit && promptinit && prompt pure
	#          fi
	#        '';
	#
	#     shellAliases = {
	# ls = "lsd";
	# nin = "nix-env -iA";
	# rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
	# cat = "bat";
	# k= "kubectl ";
	# tmux = "tmux -2u";
	# tf = "terraform";
	# ngc = "sudo nix-collect-garbage --delete-old";
	# };
	#  };
	#
	#  # Set Zsh as the default shell for a user (replace 'yourusername' with actual username)
	#  programs.zoxide = {
	# enable = true;
	# enableZshIntegration = true;
	# flags = [
	# 	"--cmd cd"
	# ];
	#  };

  users.users.oxdopeduck = {
    shell = pkgs.zsh;
  };

  # system.userActivationScripts.cleanZshEnv = ''
  #   if [ -f ~oxdopeduck/.zshenv ]; then
  #     rm ~oxdopeduck/.zshenv
  #   fi
  # '';
}

