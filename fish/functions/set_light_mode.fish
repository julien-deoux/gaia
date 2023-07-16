function set_light_mode
    kitty @ set-colors --all ~/.config/kitty/colors/light.conf
    tmux source-file ~/.config/tmux/light.conf
end
