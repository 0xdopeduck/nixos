{ config, pkgs, ... } :

let
  pure = pkgs.fetchFromGitHub {
    owner = "sindresorhus";
    repo = "pure";
    rev = "v1.0.0";
    sha256 = "sha256-PLJiUV/ByoOBFGrkIgZbNNknbOxjQKVuUqIYxtA0v0I=";
  };
in

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";

    history = {
      size      = 10000;
      save      = 10000;
      path      = "${config.home.homeDirectory}/.zsh_history";
      extended  = true;
      ignoreDups   = true;
      ignoreSpace  = true;
      share        = true;
    };

    enableCompletion       = true;
    autosuggestion.enable  = true;
    syntaxHighlighting.enable = true;

    completionInit = ''
      autoload -Uz compinit
      compinit -d ${config.home.homeDirectory}/.zcompdump
    '';

    sessionVariables = {
      KEYTIMEOUT     = "5";
      PROMPT_EOL_MARK = "";
    };


    plugins = [
      {
        name = "pure";
        src  = pure;
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo  = "fzf-tab";
          rev   = "v1.1.2";
          sha256 = "sha256-Qv8zAiMtrr67CbLRrFjGaPzFZcOiMVEFLg1Z+N6VMhg=";
        };
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo  = "fast-syntax-highlighting";
          rev   = "v1.55";
          sha256 = "sha256-DWVFBoICroKaKgByLmDEo4O+xo6eA8YO792g8t8R7kA=";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo  = "zsh-autosuggestions";
          rev   = "v0.7.0";
          sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo  = "zsh-completions";
          rev   = "0.35.0";
          sha256 = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
        };
      }
    ];

    initExtraBeforeCompInit = ''
      [[ -f $HOME/.zshenv ]] && source $HOME/.zshenv
      [[ -f $HOME/.config/zsh/kube_completion.zsh ]] && source $HOME/.config/zsh/kube_completion.zsh
    '';

    initExtra = ''
      autoload -U promptinit; promptinit
      prompt pure
      eval "$(zoxide init --cmd cd zsh)"
    '';

    shellAliases = {
      nin= "nix-env -iA";
      nsearch="nix-env --query --available --attr-path";
      nremove="nix-env --uninstall";
    };
  };

  programs.fzf = {
    enable               = true;
    enableZshIntegration = true;

    defaultCommand       = "fd --type f --hidden --exclude .git";

    fileWidgetCommand    = "fd --type f --hidden --exclude .git";
    fileWidgetOptions    = [
      "--height \$\{FZF_TMUX_HEIGHT:-40%\}"
      "--reverse"
      "--scheme=path"
      "--bind=ctrl-z:ignore"
      "--preview 'bat --style=numbers --color=always {} | head -200'"
    ];

    changeDirWidgetCommand = "fd --type d --hidden --exclude .git";
    changeDirWidgetOptions = [
      "--height \${FZF_TMUX_HEIGHT:-40%}"
      "--reverse"
      "--scheme=path"
      "--bind=ctrl-z:ignore"
      "--preview 'tree -C {} | head -200'"
    ];

    historyWidgetOptions = [
      "--height \${FZF_TMUX_HEIGHT:-40%}"
      "--reverse"
      "--scheme=history"
      "--preview 'echo {}' --preview-window up:3:hidden:wrap"
      "--bind 'ctrl-/:toggle-preview'"
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
      "--color header:italic"
      "--header 'Press CTRL-Y to copy command into clipboard'"

    ];

    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--info=inline"
    ];

    tmux = {
      enableShellIntegration = true;
    };
  };

  programs.zoxide = {
    enable               = true;
    enableZshIntegration = true;
  };

   home.packages = with pkgs; [
     starship    # Modern shell prompt
     zoxide      # Smarter cd command
     fzf         # Fuzzy finder
     fd          # Better find alternative
     bat         # Better cat alternative
     lsd         # Better ls alternative
   ];

	  home.file = {
	    ".zshenv" = {
	      text = ''
	        # ZSH environment variables
		 export XDG_CONFIG_HOME="$HOME/.config"
		 export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
		 export LC_ALL=en_IN.UTF-8
		 export LANG=en_IN.UTF-8
		 PROMPT_EOL_MARK=""
	      '';
	    };
	    ".config/zsh/kube_completion.zsh" = {
	      text = ''
	        if command -v kubectl >/dev/null 2>&1; then
	          source <(kubectl completion zsh)
	        fi
	      '';
	    };
	  };
	
}

