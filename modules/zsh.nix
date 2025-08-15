{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
		pure-prompt
	];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histFile = "$HOME/.zsh_history";
    histSize = 1000;
    saveHist = 1000;

    setOptions = [
      "vi"
    ];

    unsetOptions = [
      "beep"
    ];

    shellInit = ''
	export FZF_DEFAULT_COMMAND='fd -L -H -t d -t l'
	export FZF_DEFAULT_OPTS="--height 60%  --border"
	export FZF_CTRL_R_OPTS="
	  --preview 'echo {}' --preview-window up:3:hidden:wrap
	  --bind 'ctrl-/:toggle-preview'
	  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
	  --color header:italic
	  --header 'Press CTRL-Y to copy command into clipboard'"
	export FZF_CTRL_T_OPTS="
	  --preview 'bat -n --color=always {}'
	  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
	export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
    '',

    loginShellInit = ''
        # Shell config
	source $HOME/.zshenv
    '';

    interactiveShellInit = ''
      # Source custom files
      source $HOME/.zshenv
      source $HOME/.config/zsh/kube_completion.zsh

      fpath+=("${pkgs.pure-prompt}/share/zsh/site-functions")

      eval "$(fzf --zsh)"
    '';


    promptInit = ''
          if [ "$TERM" != dumb ]; then
            autoload -U promptinit && promptinit && prompt pure
          fi
        '';
  };

  # Set Zsh as the default shell for a user (replace 'yourusername' with actual username)
  programs.zoxide = {
	enable = true;
	enableZshIntegration = true;
  }

  users.users.oxdopeduck = {
    shell = pkgs.zsh;
  };
}

