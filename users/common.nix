{ pkgs, ... }:

{
  home.stateVersion = "21.05";
  programs.home-manager.enable = true;
  nixpkgs.config = {
    allowUnfree = true; # :(
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };
}
