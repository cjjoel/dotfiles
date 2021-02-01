{ ... }:

{
  home.stateVersion = "21.03";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true; # :(
}
