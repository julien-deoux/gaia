function setmode
    set --local mode $argv[1]
    if not set -q mode
        return
    end

    # Vim
    echo "require \"core.color.$mode\"" > ~/.config/nvim/lua/core/color/theme.lua

    # Kitty
    if [ $mode = "dark" ]
        set kitty_theme "Everforest Dark Medium"
    end
    if [ $mode = "light" ]
        set kitty_theme "Everforest Light Medium"
    end
    kitty +kitten themes --reload-in=all $kitty_theme
end

