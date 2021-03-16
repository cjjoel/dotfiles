{ config, pkgs, ... }:

{
  imports = [ 
    desktop/bspwm.nix
    users/joel.nix
  ];
}
