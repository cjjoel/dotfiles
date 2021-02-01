{ pkgs, ... }:

{
  enable = true;
  keybindings = {
    "super + Return" = "${pkgs.kitty}/bin/kitty";
    "super + space" = "${pkgs.dmenu}/bin/dmenu_run";
    "super + {_,shift + }w" = "${pkgs.bspwm}/bin/bspc node -{c,k}";
    "super + {_,shift + }{1-9,0}" = "${pkgs.bspwm}/bin/bspc {desktop -f,node -d} '^{1-9,10}'";
    "super + alt + {q,r}" = "${pkgs.bspwm}/bin/bspc {quit,wm -r}";
  };
}
