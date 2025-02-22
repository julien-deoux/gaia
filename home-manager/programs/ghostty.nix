{ config, ... }:
{
  home.file."${config.xdg.configHome}/ghostty" = {
    source = ./../../ghostty;
    recursive = true;
  };
}
