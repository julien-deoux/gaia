{ pkgs, ... }:
let
  gca = import ./pkgs/gca { pkgs = pkgs; };
  gmb = import ./pkgs/gmb { pkgs = pkgs; };
  gpsu = import ./pkgs/gpsu { pkgs = pkgs; };
  grb = import ./pkgs/grb { pkgs = pkgs; };
  gsb = import ./pkgs/gsb { pkgs = pkgs; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "julien";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    pkgs.hurl
    pkgs.lua-language-server
    pkgs.stylua
    pkgs.kanata
    gca
    gmb
    gpsu
    grb
    gsb

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/julien/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fd.enable = true;
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    settings.command_timeout = 1000;
    enableFishIntegration = true;
    enableNushellIntegration = false;
  };
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;
  programs.nushell.enable = true;
  programs.gpg.enable = true;
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = {
      settings = {
        idiomatic_version_file_enable_tools = [ "node" ];
      };
    };
  };
}
