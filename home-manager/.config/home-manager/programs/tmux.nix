{ config, pkgs, ... }:

{

	programs.tmux = {
		enable = true;
		baseIndex = 1;
		historyLimit = 10000;
		keyMode = "vi";
		prefix = "C-Space";
		shell = "${pkgs.zsh}/bin/zsh";
		terminal = "alacritty";
		tmuxinator.enable = true;
		extraConfig = ''

	set -g default-terminal 'screen-256color'

	unbind -T copy-mode-vi Space; #Default for begin-selection
	unbind -T copy-mode-vi Enter; #Default for copy-selection
	
	bind -T copy-mode-vi v send-keys -X begin-selection
	bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i --selection clipboard"

	bind -n C-h select-pane -L
	bind -n C-j select-pane -D
	bind -n C-k select-pane -U
	bind -n C-l select-pane -R

	##############
	### DESIGN ###
	##############

	# panes
	set -g pane-border-style fg=black
	set -g pane-active-border-style fg=red

	## Status bar design
	# status line
	set -g status-justify left
	#set -g status-bg default
	set -g status-style fg=blue
	set -g status-interval 2

	# messaging
	set -g message-command-style fg=blue,bg=black

	# window mode
	setw -g mode-style bg=green,fg=black

	# window status
	setw -g window-status-format " #F#I:#W#F "
	setw -g window-status-current-format " #F#I:#W#F "
	setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=white] #W "
	setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] #I #[fg=white]#[bg=cyan] #W "
	setw -g window-status-current-style bg=black,fg=yellow,dim
	setw -g window-status-style bg=green,fg=black,reverse

	# loud or quiet?
	set -g visual-activity off
	set -g visual-bell off
	set -g visual-silence off
	set-window-option -g monitor-activity off
	set -g bell-action none

	# The modes
	set-window-option -g clock-mode-colour red
	set-window-option -g mode-style fg=red,bg=black,bold

	# The panes
	set -g pane-border-style bg=black,fg=black
	set -g pane-active-border-style fg=blue,bg=black

	# The statusbar
	set -g status-position bottom
	set -g status-style bg=black,fg=yellow,dim
	set -g status-left " #S "
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
		
}
