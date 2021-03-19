{ config, pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    # Development
    clang
    python3 # for emacs
    ripgrep
    shellcheck
    
    # Social
    tdesktop
    discord

    # Fonts
    font-awesome_4
    
    # CLI tools
    fd
    tree
    wget

    # Others
    pcmanfm
    mpv
    obsidian
    chromium
    libreoffice
    anki
  ]; 

  programs.bash = import ../configs/bash.nix { inherit pkgs; };

  programs.git = import ../configs/git.nix {};
  
  programs.kitty = import ../configs/kitty.nix {};
  #xdg.configFile."kitty/theme.conf".source = ../bin/gruvbox_light.conf;
  
  programs.neovim = import ../configs/neovim.nix { inherit pkgs; };

  #programs.emacs = import ../configs/emacs.nix { inherit pkgs; };
  #home.file.".emacs.d" = { source =  ../bin/emacs.d; recursive = true;};
  #home.file.".doom.d" = { source = config.lib.file.mkOutOfStoreSymlink ../bin/doom.d; recursive = true;};

  programs.firefox = import ../configs/firefox.nix { inherit pkgs; };

  fonts.fontconfig.enable = true;
  home.username = "joel";
  home.homeDirectory = "/home/joel";
}
