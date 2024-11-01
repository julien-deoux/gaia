{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Julien Déoux";
    userEmail = "juliendeoux@gmail.com";
    ignores = [
      ".DS_Store"
      ".ignore"
    ];
    aliases = {
      cf = "config";
      a = "add";
      ci = "commit";
      ps = "push";
      pf = "push --force-with-lease";
      s = "status";
      cl = "clone";
      co = "checkout";
      pl = "pull";
      st = "stash";
      rb = "rebase";
      f = "fetch";
      br = "branch";
      l = "log";
      ro = "restore";
      rs = "reset";
      m = "merge";
      cp = "cherry-pick";
    };
    extraConfig = {
      core.editor = "nvim";
      advice.addIgnoredFile = false;
      pull.rebase = true;
      fetch.prune = true;
      rerere.enabled = true;
    };
  };
}
