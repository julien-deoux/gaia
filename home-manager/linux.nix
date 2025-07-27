{ pkgs, config, ... }:
{
  home.homeDirectory = "/home/julien";
  home.packages = [
    pkgs.xclip
  ];
  home.file."${config.xdg.configHome}/kanata/kanata.kbd" = {
    source = ./../kanata/linux.lisp;
  };
}
