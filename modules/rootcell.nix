{ config, lib, ... }:

let
  cfg = config.programs.rootcell;
in {
  options.programs.rootcell = {
    enable = lib.mkEnableOption "rootcell";

    projectDir = lib.mkOption {
      type = lib.types.str;
      description = "Rootcell project path relative to the home directory.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.initContent = ''
      _load_rootcell() {
        local rootcell_bin="$HOME/${cfg.projectDir}/rootcell"
        local rootcell_completion

        [[ -x "$rootcell_bin" ]] || return

        rootcell() {
          "$HOME/${cfg.projectDir}/rootcell" "$@"
        }

        if rootcell_completion="$("$rootcell_bin" completion 2>/dev/null)" && [[ -n "$rootcell_completion" ]]; then
          eval "$rootcell_completion"
        fi
      }

      _load_rootcell
      unset -f _load_rootcell
    '';
  };
}
