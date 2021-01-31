{ pkgs, ... }:

{
  enable = true;
  config = {
    "bar/top" = {
      background="\${colors.background}";
      foreground = "\${colors.foreground}";
      border-size = 4;
      fixed-center = "false";
      line-color = "#f00";
      line-size = 3;
      
      height = 27;
      width = "100%";
      radius = "6.0";
      padding-left = 1;
      padding-right = 1;

      # font-0 = "misc fixed:pixelsize=15;2";
      font-0 = "Monospace:style=Regular:size=14;2";
      font-1 = "FontAwesome:size=14;2";
      
      module-margin-left = 1;
      module-margin-right = 2;
      modules-left = "bspwm";
      modules-right = "pulseaudio battery date";
      
      tray-padding = 2;
      tray-position = "right";
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

    "module/battery" = {
      type = "internal/battery";
      battery = "BAT1";
      adapter = "ACAD";
      full-at = 98;
      format-charging = "<ramp-capacity> <label-charging>";
          
      format-discharging = "<ramp-capacity> <label-discharging>";
      format-discharging-underline = "#FF0000";
          
      format-full-prefix = " ";
      format-full-prefix-foreground = "\${colors.foreground}";
          
      ramp-capacity-0 = " ";
      ramp-capacity-1 = " ";
      ramp-capacity-2 = " ";
    };

    "module/date" = {
      format-prefix = " ";
      date-alt=" %d-%m-%Y";
      internal=5;
      label="%time%  %date%";
      time="%I:%M";
      time-alt="%I:%M:%S";
      type="internal/date";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";
      # sink = "alsa_output.pci-0000_12_00.3.analog-stereo";
      use-ui-max = "true";
      interval = 5;
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

