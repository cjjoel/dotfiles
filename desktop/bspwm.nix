{ pkgs, ... }:

{
  home.packages = with pkgs; [
    betterlockscreen
    sxhkd
  ]; 
  xdg.configFile."bspwm/bspwmrc".source = ../bin/bspwmrc;
  xdg.configFile."sxhkd/sxhkdrc".source = ../bin/sxhkdrc;
  services.picom.enable = true;
  services.polybar = import ../configs/polybar.nix { inherit pkgs; };
  programs.rofi = import ../configs/rofi.nix {};
}
