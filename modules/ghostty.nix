{ ... }: {
  programs.ghostty = {
    enable = true;
    package = null;
    installVimSyntax = false;
    installBatSyntax = false;
    enableZshIntegration = true;
    settings = {
      shell-integration-features = "cursor,no-sudo,title,ssh-env,ssh-terminfo,path";
      clipboard-read = "allow";
      theme = "3024 Night";
      palette-harmonious = true;
      background = "#090300";
      foreground = "#a5a2a2";
      selection-background = "#4a4543";
      selection-foreground = "#a5a2a2";
      cursor-color = "#a5a2a2";
      cursor-text = "#090300";
      palette = [
        "0=#090300"
        "1=#db2d20"
        "2=#01a252"
        "3=#fded02"
        "4=#01a0e4"
        "5=#a16a94"
        "6=#b5e4f4"
        "7=#a5a2a2"
        "8=#5c5855"
        "9=#e8bbd0"
        "10=#47413f"
        "11=#4a4543"
        "12=#807d7c"
        "13=#d6d5d4"
        "14=#cdab53"
        "15=#f7f7f7"
      ];
      font-size = 16;
      font-family = "SauceCodePro Nerd Font Mono";
      keybind = [
        "alt+backspace=text:\\x1b\\x7f"
        "shift+enter=text:\\n"
      ];
      macos-icon = "retro";
    };
  };
}
