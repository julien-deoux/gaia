{ ... }:
{
  programs.starship = {
    enable = true;
    settings.command_timeout = 1000;
    enableFishIntegration = true;
  };
}
