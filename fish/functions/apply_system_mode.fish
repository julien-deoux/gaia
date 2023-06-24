function apply_system_mode
    set --local apple_mode (defaults read -g AppleInterfaceStyle 2> /dev/null | tr -d '\n')
    if [ "$apple_mode" = Dark ]
        set_dark_mode
    else
        set_light_mode
    end
end
