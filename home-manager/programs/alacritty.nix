{ config, pkgs, ... }:
let
  format = pkgs.formats.yaml { };
in
{
  home.file."${config.xdg.configHome}/alacritty/alacritty.yaml" = {
    source = format.generate "alacritty.yaml" {
      font.size = 9;
    };
  };
}
