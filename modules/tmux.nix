# tmux.nix - NixOS Configuration for tmux
{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    
    # Mouse support
    mouse = true;
    
    # Base index configuration
    baseIndex = 1;
    
    # History limit
    historyLimit = 10000;
    
    # Default terminal
    terminal = "xterm-ghostty";
    
    # Key mode (vi bindings)
    keyMode = "vi";
    
    # Prefix key configuration (C-Space instead of C-b)
    shortcut = "Space";
    
    # Disable bell
    disableConfirmationPrompt = true;
    
    # Additional configuration
    extraConfig = ''
      # Set window and pane base index to 1
      set-window-option -g pane-base-index 1
      
      # VI mode key bindings for copy mode
      set-window-option -g mode-keys vi
      unbind -T copy-mode-vi Space
      unbind -T copy-mode-vi Enter
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard"
      
      # Reload config file
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded tmux.conf"
      
      # Navigation among panes (without prefix)
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R
      
      # Navigating windows
      bind -n M-, previous-window
      bind -n M-. next-window
      
      # Custom popup (scratch session)
      bind -n M-o display-popup -h 27 -w 110 -E "tmux new-session -A -s scratch"
      
      ##############
      ### DESIGN ###
      ##############
      
      # Pane borders
      set -g pane-border-style fg=black
      set -g pane-active-border-style fg=red
      
      # Status bar design
      set -g status-justify left
      set -g status-style fg=blue
      set -g status-interval 2
      
      # Messaging
      set -g message-command-style fg=blue,bg=black
      
      # Window mode
      setw -g mode-style bg=green,fg=black
      
      # Window status
      setw -g window-status-format " #F#I:#W#F "
      setw -g window-status-current-format " #F#I:#W#F "
      setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=white] #W "
      setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] #I #[fg=white]#[bg=cyan] #W "
      setw -g window-status-current-style bg=black,fg=yellow,dim
      setw -g window-status-style bg=green,fg=black,reverse
      
      # Visual settings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set-window-option -g monitor-activity off
      set -g bell-action none
      
      # Clock mode
      set-window-option -g clock-mode-colour red
      set-window-option -g mode-style fg=red,bg=black,bold
      
      # The panes
      set -g pane-border-style bg=black,fg=black
      set -g pane-active-border-style fg=blue,bg=black
      
      # The statusbar
      set -g status-position bottom
      set -g status-style bg=black,fg=yellow,dim
      set -g status-left ' #S '
      set -g status-right '#{?client_prefix,#[fg=brightwhite]#[bg=red]#[bold] - PREFIX - ,#[fg=brightwhite]#H}'
      set -g status-right-length 50
      set -g status-left-length 20
      
      # The window
      set-window-option -g window-status-current-style fg=red,bg=brightblack,bold
      set-window-option -g window-status-current-format ' #I#[fg=brightwhite]:#[fg=brightwhite]#W#[fg=blue]#F '
      set-window-option -g window-status-style fg=magenta,bg=black,none
      set-window-option -g window-status-format ' #I#[fg=colour251]:#[fg=colour251]#W#[fg=black]#F '
      set-window-option -g window-status-bell-style fg=white,bg=red,bold
      
      # The messages
      set -g message-style fg=white,bg=red,bold
    '';
  };
  
  # Make tmux available system-wide
  environment.systemPackages = with pkgs; [
    tmux
    xclip  # For clipboard integration
  ];
}
