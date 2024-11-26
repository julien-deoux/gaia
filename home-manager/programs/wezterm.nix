{ config, ... }:
{
  home.file."${config.xdg.configHome}/wezterm" = {
    source = ./../../wezterm;
    recursive = true;
  };
}
