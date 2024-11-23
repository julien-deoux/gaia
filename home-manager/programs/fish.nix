{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      v = "nvim";
      t = "nvim ~/todo.md";
      home = "home-manager switch --flake";
      rebuild = "darwin-rebuild switch --flake";
    };
    interactiveShellInit = ''
      set -gx PNPM_HOME $HOME/Library/pnpm
      set -gx BUN_INSTALL $HOME/.bun
      set -gx PATH $BUN_INSTALL/bin $PATH
      set -gx PATH $HOME/go/bin $PATH
      set fish_greeting
    '';
    plugins = [
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
          hash = "sha256-RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
        };
      }
    ];
  };
}
