{ ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "Julien Déoux";
    settings.user.email = "juliendeoux@gmail.com";
    ignores = [
      ".DS_Store"
      ".ignore"
    ];
    settings.alias = {
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
    settings.core.editor = "nvim";
    settings.advice.addIgnoredFile = false;
    settings.pull.rebase = true;
    settings.fetch.prune = true;
    settings.rerere.enabled = true;
  };
}
