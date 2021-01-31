{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [ 
    firefox
    dmenu
    font-awesome_4
    python3
  ];

  services.picom.enable = true;

  services.polybar = import ../configs/polybar.nix {
    inherit pkgs;
  };

  services.sxhkd = import ../configs/sxhkd.nix {
    inherit pkgs;
  };

  programs.neovim = import ../configs/neovim.nix {
    inherit pkgs;
  };

  programs.emacs = import ../configs/emacs.nix {
    inherit pkgs;
  };
  home.file.".emacs.d" = { source = ../bin/emacs.d; recursive = true;};

  xdg.configFile."bspwm/bspwmrc".source = ../bin/bspwmrc;

  fonts.fontconfig.enable = true;
  home.username = "joel";
  home.homeDirectory = "/home/joel";
}
