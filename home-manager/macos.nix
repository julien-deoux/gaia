{ pkgs, ... }:
let
  dark-notify = import ./pkgs/dark-notify { pkgs = pkgs; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.homeDirectory = "/Users/julien";

  home.packages = [
    dark-notify
  ];

  home.sessionPath = [
    "/run/current-system/sw/bin"
    "/opt/homebrew/bin"
  ];
}
