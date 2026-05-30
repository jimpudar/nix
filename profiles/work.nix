{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Shared tools.
    bun
    fd
    lima
    nodejs
    ripgrep
    shellcheck

    # Work tools.
    awscli2
    azurite
    binutils
    colima
    coreutils-prefixed
    d2
    docker-client
    findutils
    fontconfig
    gnutar
    jwt-cli
    ncurses
    pandoc
    uv
    opentofu
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/bin"
  ];

  programs.git.settings = {
    user = {
      name = "Jim Pudar";
      email = "Jim.Pudar@riverbed.com";
    };
    init.defaultBranch = "main";
    pull.rebase = true;
    push.autoSetupRemote = true;
  };

  programs.rootcell = {
    enable = true;
    projectDir = "work/rootcell";
  };
}
