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
    # saveHist = 1000;

    setOptions = [
      "vi"
    ];

    # unsetOptions = [
    #   "beep"
    # ];

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
    '';

    loginShellInit = ''
        # Shell config
	source $HOME/.zshenv
    '';

    interactiveShellInit = ''
      # Source custom files
      source $HOME/.zshenv
      if command -v kubectl >/dev/null 2>&1; then
        mkdir -p "$HOME/.config/zsh"
        if [ ! -f "$HOME/.config/zsh/kube_completion.zsh" ]; then
          kubectl completion zsh > "$HOME/.config/zsh/kube_completion.zsh"
        fi
        source "$HOME/.config/zsh/kube_completion.zsh"
      fi

      fpath+=("${pkgs.pure-prompt}/share/zsh/site-functions")

      if command -v fzf >/dev/null 2>&1; then
        # Source FZF completion and key bindings if available
        if [ -f "${pkgs.fzf}/share/fzf/completion.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/completion.zsh"
        fi
        if [ -f "${pkgs.fzf}/share/fzf/key-bindings.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
        fi
      fi

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
  };

  users.users.oxdopeduck = {
    shell = pkgs.zsh;
  };
}

