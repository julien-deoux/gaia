{ pkgs, ... }:
{
  home.packages = [
    pkgs.hledger
    pkgs.gnumake
    pkgs.gcc
    pkgs.rsync
  ];
  programs.mise.globalConfig.tools = {
    bun = "latest";
    node = "latest";
  };
}
