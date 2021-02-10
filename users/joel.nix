{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    # Development
    clang
    python3 # for emacs
    
    # Social
    tdesktop

    # Fonts
    font-awesome_4
    
    # CLI tools
    fd
    tree

    # Others
    mpv
    obsidian
    firefox
    chromium
    libreoffice
  ]; 

  programs.bash = import ../configs/bash.nix { inherit pkgs; };

  programs.git = import ../configs/git.nix {};
  
  programs.kitty = import ../configs/kitty.nix {};
  
  programs.neovim = import ../configs/neovim.nix { inherit pkgs; };

  programs.emacs = import ../configs/emacs.nix { inherit pkgs; };
  home.file.".emacs.d" = { source = ../bin/emacs.d; recursive = true;};

  xdg.configFile."bspwm/bspwmrc".source = ../bin/bspwmrc;
  services.sxhkd = import ../configs/sxhkd.nix { inherit pkgs; };
  services.picom.enable = true;
  services.polybar = import ../configs/polybar.nix { inherit pkgs; };
  programs.rofi.enable = true;

  fonts.fontconfig.enable = true;
  home.username = "joel";
  home.homeDirectory = "/home/joel";
}
