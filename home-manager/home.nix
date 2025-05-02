{ pkgs, ... }:
{
  home.packages = [
    pkgs.hledger
    pkgs.rustup
    pkgs.gnumake
    pkgs.gcc
    pkgs.gleam
    pkgs.swi-prolog
    pkgs.rsync
  ];

  programs.bun.enable = true;
  programs.go = {
    enable = true;
    goPath = "go";
  };
}
