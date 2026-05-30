{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    ripgrep
    shellcheck
    htop
    jq
    moreutils
    nmap
    gh

    yt-dlp

    bun
    nodejs
    lima
    opentofu

    cmake
    dfu-util
    ninja
    platformio
  ];

  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
  ];

  programs.git.settings = {
    user = {
      name = "Jim Pudar";
      email = "jim@pudar.com";
    };
    init.defaultBranch = "main";
    pull.rebase = true;
    push.autoSetupRemote = true;
  };
}
