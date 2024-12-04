{ pkgs, ... }:
{
  home.homeDirectory = "/home/julien";
  home.packages = [
    pkgs.xclip
  ];
}
