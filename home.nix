{ pkgs, config, ... }: {
  home.username = "jmp";
  home.homeDirectory = "/Users/jmp";
  home.stateVersion = "25.11";  # check the current home-manager release

  home.packages = with pkgs; [
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

    # embedded development ccache
    cmake
    dfu-util
    ninja
    platformio

    # agentic coding
    lima
  ];

  programs.home-manager.enable = true;

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
