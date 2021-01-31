{ pkgs, ... }:

{
  enable = true;
  config = {
    "bar/top" = {
      background="\${colors.background}";
      border-color = "#00000000";
      border-size = 4;
      fixed-center = "false";
      font-0 = "misc fixed:pixelsize=15";
      foreground = "\${colors.foreground}";
      height = 27;
      line-color = "#f00";
      line-size = 3;
      module-margin-left = 1;
      module-margin-right = 2;
      modules-left = "bspwm";
      modules-right = "date";
      padding-left = 0;
      padding-right = 2;
      radius = "6.0";
      tray-padding = 2;
      tray-position = "right";
      width = "100%";
      wm-restack = "bspwm";
    };
    "module/bspwm" = {
      label-empty = "%index%";
      label-empty-foreground = "\${colors.foreground-alt}";
      label-empty-padding = 2;
      label-focused = "%index%";
      label-focused-background = "\${colors.background-alt}";
      label-focused-padding = 2;
      label-focused-underline = "\${colors.primary}";
      label-occupied = "%index%";
      label-occupied-padding=2;
      label-urgent="%index%!";
      label-urgent-background="\${colors.alert}";
      label-urgent-padding=2;
      type="internal/bspwm";
    };
    "module/date" = {
      date="%d.%m.%y";
      internal=5;
      label="%time%  %date%";
      time="%H:%M";
      type="internal/date";
    };
    "colors" = {
      alert = "#bd2c40";
      background = "#222";
      background-alt = "#444";
      foreground = "#dfdfdf";
      foreground-alt = "#555";
      primary = "#ffb52a";
      secondary = "#e60053";
    };
  };
  script = ''
    #!${pkgs.bash}/bin/bash
    systemctl --user daemon-reload
    polybar top &
  '';
}

