{ config, pkgs, ... }:
let
  plugins = pkgs.vimPlugins;

  vimPlugins = with plugins; [
    vim-nix
  ];
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    plugins = vimPlugins;
    extraPackages = with pkgs; [
      black
      gcc
      tree-sitter
    ];
  };
}
