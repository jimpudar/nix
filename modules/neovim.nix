{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    git
  ];

  xdg.configFile = {
    "nvim/init.lua".source = ../nvim/init.lua;
    "nvim/lua/config/autocmds.lua".source = ../nvim/lua/config/autocmds.lua;
    "nvim/lua/config/keymaps.lua".source = ../nvim/lua/config/keymaps.lua;
    "nvim/lua/config/lazy.lua".source = ../nvim/lua/config/lazy.lua;
    "nvim/lua/config/options.lua".source = ../nvim/lua/config/options.lua;
    "nvim/lua/plugins/init.lua".source = ../nvim/lua/plugins/init.lua;
  };
}
