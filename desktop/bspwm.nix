{ pkgs, ... }:

{
  xdg.configFile."bspwm/bspwmrc".source = ../bin/bspwmrc;
  services.sxhkd = import ../configs/sxhkd.nix { inherit pkgs; };
  services.picom.enable = true;
  services.polybar = import ../configs/polybar.nix { inherit pkgs; };
  programs.rofi = import ../configs/rofi.nix {};
}
