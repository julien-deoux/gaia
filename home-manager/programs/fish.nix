{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      v = "nvim";
      t = "nvim ~/todo.md";
    };
    shellInit = ''
      set -gx PNPM_HOME $HOME/Library/pnpm
      set -gx BUN_INSTALL $HOME/.bun
      set -gx PATH $BUN_INSTALL/bin $PATH
      set -gx PATH $HOME/go/bin/ $PATH
    '';
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
