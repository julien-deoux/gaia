{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      v = "nvim";
      t = "nvim ~/todo.md";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
