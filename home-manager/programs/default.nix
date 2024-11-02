{ ... }:
{
  imports = [
    ./git.nix
    ./tmux.nix
    ./fish.nix
    ./nvim.nix
  ];

  programs.bun.enable = true;
  programs.fd.enable = true;
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    settings.command_timeout = 1000;
    enableFishIntegration = true;
  };
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
}
