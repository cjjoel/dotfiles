{ pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.bspwm = {
    enable = true;
    monitors =  { eDP1 = [ "I" "II" "III" "IV" "V" ]; };
    startupPrograms = [ "sxhkd" "feh --bg-fill ~/.wallpaper" ];
  };

  home.packages = with pkgs; [
    betterlockscreen
    sxhkd
    feh
  ]; 

  xdg.configFile."sxhkd/sxhkdrc".source = ../bin/sxhkdrc;
  services.picom.enable = true;
  services.polybar = import ../configs/polybar.nix { inherit pkgs; };
  programs.rofi = import ../configs/rofi.nix {};
}
