{ pkgs, ... }:

let
  dark-notify = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "dark-notify";
    version = "unstable-2024-11-01";
    src = pkgs.fetchFromGitHub {
      owner = "erikw";
      repo = "tmux-dark-notify";
      rev = "dfa2b45b3edab2fbd6961bdb40b2a7c50fc17060";
      sha256 = "naOIotyAgUHZ2qSPmvLMkxGeU0/vfQYrFPjO7Coig0g=";
    };
  };
in

{
  home.file = {
    ".config/tmux/light.conf".text = ''
      set -g status-justify centre
      set -g status-left-length 20
      set -g status-style 'bg=#f4f0d9 fg=#5c6a72'
      set -g status-right '#[fg=#92b259,bg=#f4f0d9]#[fg=#fdf6e3,bg=#92b259,bold] #{pane_current_path} '
      set -g status-left '#[fg=#fdf6e3,bg=#92b259,bold] #S #[fg=#92b259,bg=#f4f0d9]'
      setw -g window-status-current-format '#[fg=#e5e2cc,bg=#f4f0d9]#[fg=#829181,bg=#e5e2cc,bold] #I #W #[fg=#e5e2cc,bg=#f4f0d9]'
      setw -g window-status-format '  #I #W  '
    '';
    ".config/tmux/dark.conf".text = ''
      set -g status-justify centre
      set -g status-left-length 20
      set -g status-style 'bg=#343f44 fg=#849289'
      set -g status-right '#[fg=#a7c080,bg=#343f44]#[fg=#2e353b,bg=#a7c080,bold] #{pane_current_path} '
      set -g status-left '#[fg=#2e353b,bg=#a7c080,bold] #S #[fg=#a7c080,bg=#343f44]'
      setw -g window-status-current-format '#[fg=#475258,bg=#343f44]#[fg=#9da9a0,bg=#475258,bold] #I #W #[fg=#475258,bg=#343f44]'
      setw -g window-status-format '  #I #W  '
    '';
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "screen-256color";
    baseIndex = 1;
    mouse = true;
    sensibleOnTop = false;
    plugins = [
      # Navigate panes and nvim with Ctrl-hjkl
      pkgs.tmuxPlugins.vim-tmux-navigator
      # Copy with Y
      pkgs.tmuxPlugins.yank
      # Light/Dark mode
      dark-notify
    ];
    extraConfig = ''
      # Better colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Address vim mode switching delay (http://superuser.com/a/252717/65504)
      set -s escape-time 0
      # Increase scrollback buffer size from 2000 to 50000 lines
      set -g history-limit 50000
      # Increase tmux messages display duration from 750ms to 4s
      set -g display-time 4000
      # Refresh 'status-left' and 'status-right' more often, from every 15s to 5s
      set -g status-interval 5

      set-option -g status-position top
      # Split panes
      unbind %
      bind v split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind s split-window -v -c "#{pane_current_path}"
      # Reload configuration
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      # Window navigation
      bind -r l next-window
      bind -r h previous-window
      # Session navigation
      bind -r j switch-client -n
      bind -r k switch-client -p

      # start selecting text with "v"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      # rectangle selection
      bind-key -T copy-mode-vi v send-keys -X rectangle-toggle
      # copy text with "y"
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      # don't exit copy mode after dragging with mouse
      unbind -T copy-mode-vi MouseDragEnd1Pane

      set -g @dark-notify-theme-path-light ~/.config/tmux/light.conf
      set -g @dark-notify-theme-path-dark ~/.config/tmux/dark.conf
      if-shell "test -e ~/.local/state/tmux/tmux-dark-notify-theme.conf" \
          "source-file ~/.local/state/tmux/tmux-dark-notify-theme.conf"
    '';
  };
}
