{ config, pkgs, lib, ... }:

let unstablePkgs = import <nixpkgs-unstable> { config = { allowUnfree = true; }; }; in {
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    # Development
    clang
    python3 # for emacs
    ripgrep
    shellcheck
    gnumake
    
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
    libreoffice
    anki
    vlc
    okular
    qtcurve
  ] ++ (with unstablePkgs; [
    logseq
  ]);

  programs.bash = import ../configs/bash.nix { inherit pkgs; };

  programs.git = import ../configs/git.nix {};
  
  programs.kitty = import ../configs/kitty.nix {};
  #xdg.configFile."kitty/theme.conf".source = ../bin/gruvbox_light.conf;
  
  programs.neovim = import ../configs/neovim.nix { inherit pkgs; };

  #programs.emacs = import ../configs/emacs.nix { inherit pkgs; };
  #home.file.".emacs.d" = { source =  ../bin/emacs.d; recursive = true;};
  #home.file.".doom.d" = { source = config.lib.file.mkOutOfStoreSymlink ../bin/doom.d; recursive = true;};

  programs.firefox = import ../configs/firefox.nix { inherit pkgs; };
  programs.chromium = import ../configs/chromium.nix {};

  fonts.fontconfig.enable = true;
  home.username = "joel";
  home.homeDirectory = "/home/joel";

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "org.kde.okular.desktop" "firefox.desktop" ];
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
