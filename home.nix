{ pkgs, config, lib, ... }: {
  home.username = "jmp";
  home.homeDirectory = "/Users/jmp";
  home.stateVersion = "25.11";  # check the current home-manager release

  home.packages = with pkgs; [
    bun
    nodejs

    # standard utilities
    htop
    ripgrep
    fd
    jq
    moreutils
    nmap
    neovim
    yt-dlp
    gh
    shellcheck

    # embedded development ccache
    cmake
    dfu-util
    ninja
    platformio

    # agentic coding
    lima
    vfkit
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Avoid a current Home Manager docs build warning under Determinate Nix.
  manual.manpages.enable = false;

  # Home Manager still emits `nix profile install`, which Determinate Nix warns
  # is a deprecated alias for `nix profile add`.
  home.activation.installPackages = lib.mkForce (lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    function nixReplaceProfile() {
      local oldNix="$(command -v nix)"

      nixProfileRemove 'home-manager-path'

      run $oldNix profile add $1
    }

    if [[ -e ${config.home.profileDirectory}/manifest.json ]] ; then
      INSTALL_CMD="nix profile add"
      INSTALL_CMD_ACTUAL="nixReplaceProfile"
      LIST_CMD="nix profile list"
      REMOVE_CMD_SYNTAX='nix profile remove {number | store path}'
    else
      INSTALL_CMD="nix-env -i"
      INSTALL_CMD_ACTUAL="run nix-env -i"
      LIST_CMD="nix-env -q"
      REMOVE_CMD_SYNTAX='nix-env -e {package name}'
    fi

    if ! $INSTALL_CMD_ACTUAL ${config.home.path} ; then
      echo
      _iError $'Oops, Nix failed to install your new Home Manager profile!\n\nPerhaps there is a conflict with a package that was installed using\n"%s"? Try running\n\n    %s\n\nand if there is a conflicting package you can remove it with\n\n    %s\n\nThen try activating your Home Manager configuration again.' "$INSTALL_CMD" "$LIST_CMD" "$REMOVE_CMD_SYNTAX"
      exit 1
    fi
    unset -f nixReplaceProfile
    unset INSTALL_CMD INSTALL_CMD_ACTUAL LIST_CMD REMOVE_CMD_SYNTAX
  '');

  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    initContent = ''
      [[ -r /Users/jmp/projects/agent-vm/completions/agent.zsh ]] && source /Users/jmp/projects/agent-vm/completions/agent.zsh
    '';

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      vim = "nvim";
      vi = "nvim";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ghostty = {
    enable = true;
    package = null;
    installVimSyntax = false;
    installBatSyntax = false;
    enableZshIntegration = true;
    settings = {
      # ...
    };
  };
}
