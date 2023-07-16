function set_dark_mode
    kitty @ set-colors --all ~/.config/kitty/colors/dark.conf
    tmux source-file ~/.config/tmux/dark.conf
end
