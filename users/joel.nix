{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    #../configs/sxhkd.nix
  ];
  home.packages = with pkgs; [ 
    firefox
    dmenu
    #sxhkd
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

  xdg.configFile."bspwm/bspwmrc".source = ../bin/bspwmrc;
  
  home.username = "joel";
  home.homeDirectory = "/home/joel";
}
