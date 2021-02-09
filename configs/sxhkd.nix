{ pkgs, ... }:

{
  enable = true;
  keybindings = {
    "super + Return" = "${pkgs.kitty}/bin/kitty";
    "super + space" = "${pkgs.rofi}/bin/rofi -show combi -combi-modi \"drun,run\" -modi combi";
    "super + {_,shift + }w" = "${pkgs.bspwm}/bin/bspc node -{c,k}";
    "super + {_,shift + }{1-9,0}" = "${pkgs.bspwm}/bin/bspc {desktop -f,node -d} '^{1-9,10}'";
    "super + alt + {q,r}" = "${pkgs.bspwm}/bin/bspc {quit,wm -r}";
    
    "XF86AudioRaiseVolume" = "${pkgs.pulseaudio}/bin/pactl set-sink-volume 0 +5%";
    "XF86AudioLowerVolume" = "${pkgs.pulseaudio}/bin/pactl set-sink-volume 0 -5%";
    "XF86AudioMute" = "${pkgs.pulseaudio}/bin/pactl set-sink-mute 0 toggle";
  };
}
