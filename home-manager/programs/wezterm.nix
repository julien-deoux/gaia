{ config, ... }:
{
  home.file."${config.xdg.configHome}/wezterm" = {
    source = ./../../wezterm;
    recursive = true;
  };
  programs.wezterm = {
    enable = true;
  };
}
