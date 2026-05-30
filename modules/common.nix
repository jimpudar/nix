{ ... }: {
  programs.home-manager.enable = true;

  # Avoid a current Home Manager docs build warning under Determinate Nix.
  manual.manpages.enable = false;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };
}
