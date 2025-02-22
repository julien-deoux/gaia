{ pkgs, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hledger
    pkgs.rustup
    pkgs.gnumake
    pkgs.gcc
    pkgs.gleam
    pkgs.swi-prolog
  ];

  programs.bun.enable = true;
  programs.go = {
    enable = true;
    goPath = "go";
  };
}
