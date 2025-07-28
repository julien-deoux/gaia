{ pkgs, ... }:
{
  home.packages = [
    pkgs.hledger
    pkgs.gnumake
    pkgs.gcc
    pkgs.rsync
  ];
}
