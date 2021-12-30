{ config, pkgs, ... }:
let
  pluginWithConfig = plugin: {
    plugin = plugin;
    config = ''
      lua require 'rmk.${builtins.replaceStrings ["."] ["-"] plugin.pname}'
    '';
  };

  plugins = pkgs.vimPlugins;

  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
    tree-sitter-comment
    tree-sitter-cpp
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-lua
    tree-sitter-make
    tree-sitter-nix
    tree-sitter-python
    tree-sitter-regex
    tree-sitter-toml
  ]);

  vimPlugins = with plugins; [
    cmp_luasnip
    cmp-nvim-lsp
    cmp-buffer
    gruvbox
    kommentary
    luasnip
    telescope-fzf-native-nvim
    vim-nix
  ];

  vimPluginsWithConfig = with pkgs.vimPlugins;
    map pluginWithConfig [
      nvim-lspconfig
      nvim-cmp
      treesitter
      telescope-nvim
      which-key-nvim
    ];
in
{
  xdg.configFile."nvim/lua".source = ./lua;

  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua require('init')
    '';
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    plugins = vimPluginsWithConfig ++ vimPlugins;
    extraPackages = with pkgs; [
      black
      gcc
      nodePackages.pyright
      rnix-lsp
      tree-sitter
    ];
  };
}
