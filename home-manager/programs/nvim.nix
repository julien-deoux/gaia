{ config, ... }:
{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./../../nvim;
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
