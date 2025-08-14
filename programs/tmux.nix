{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # Global tmux options
    extraConfig = ''
      # Enable mouse support
      set -g mouse on

      # Pane and window indexing starts at 1
      set -g base-index 1
      set-window-option -g pane-base-index 1

      # Vi bindings in copy mode
      set-window-option -g mode-keys vi
      unbind -T copy-mode-vi Space
      unbind -T copy-mode-vi Enter
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard"

      # Terminal and history
      set -g default-terminal 'xterm-ghostty'
      set -g history-limit 10000

      # Status line colors
      set -g status-style fg=yellow,bg=black
      set -g status-justify left
      set -g status-interval 2

      # Change prefix to Ctrl-Space and reload binding
      unbind C-b
      set -g prefix C-Space
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \\; display "Reloaded tmux.conf"

      # Pane navigation with Ctrl-hjkl
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      # Window navigation with Alt-, and Alt-.
      bind -n M-, previous-window
      bind -n M-. next-window

      # Scratch pane popup on Alt-o
      bind -n M-o display-popup -h 27 -w 110 -E "tmux new-session -A -s scratch"

      # Pane border styling
      set -g pane-border-style fg=black,bg=black
      set -g pane-active-border-style fg=blue,bg=black

      # Message and mode styling
      set -g message-style fg=white,bg=red,bold
      set -g message-command-style fg=blue,bg=black
      setw -g mode-style bg=green,fg=black
      set-window-option -g mode-style fg=red,bg=black,bold

      # Window status formatting
      setw -g window-status-format  "#[fg=colour251]#[bg=black] #I #[bg=cyan]#[fg=white] #W "
      setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] #I #[fg=white]#[bg=cyan] #W "
      setw -g window-status-style fg=magenta,bg=black
      setw -g window-status-current-style fg=red,bg=brightblack,bold
      setw -g window-status-bell-style fg=white,bg=red,bold

      # Disable visual and bell notifications
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set-window-option -g monitor-activity off
      set -g bell-action none

      # Status bar left/right
      set -g status-position bottom
      set -g status-left-length 20
      set -g status-right-length 50
      set -g status-left ' #S '
      set -g status-right '#{?client_prefix,#[fg=brightwhite]#[bg=red]#[bold] - PREFIX - ,#[fg=brightwhite]#H}'
    '';
  };

  # Ensure xclip is available for copy-pipe
  home.packages = with pkgs; [
    xclip
  ];
}
