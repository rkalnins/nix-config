{ config, pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

  home.username = "rmk";
  home.homeDirectory = "/home/rmk";

  home.packages = [
    pkgs.git
    pkgs.starship
    pkgs.tmux
    pkgs.zsh
  ];

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "rkalnins";
    userEmail = "rkalnins@umich.edu";
    aliases = {
      st = "status";
      cm = "checkout master";
      co = "checkout";
      cd = "checkout develop";
    };
    ignores = [ "*.swp" ];
  };


  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      l = "ls -la";
      gst = "git status";
      gc = "git commit -m";
      gco = "git checkout";
      gcm = "git checkout master";
      gcd = "git checkout develop";
      gaa = "git add --all";
    };
  
    oh-my-zsh = {
      enable = true;
    };

  };

}
