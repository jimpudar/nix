{
  description = "Home Manager environments for my macOS accounts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      mkHome = { username, homeDirectory, modules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
              home.stateVersion = "26.05";
            }
            ./modules/common.nix
            ./modules/git.nix
            ./modules/neovim.nix
            ./modules/rootcell.nix
            ./modules/zsh.nix
            ./modules/ghostty.nix
          ] ++ modules;
        };
    in {
      homeConfigurations = {
        jmp = mkHome {
          username = "jmp";
          homeDirectory = "/Users/jmp";
          modules = [ ./profiles/jmp.nix ];
        };

        work = mkHome {
          username = "jpudar-rvbd";
          homeDirectory = "/Users/jpudar-rvbd";
          modules = [ ./profiles/work.nix ];
        };
      };
    };
}
