{ pkgs, ... }:

{
  enable = true;
  shellAliases = {
    doom = "$HOME/.emacs.d/bin/doom";
  };
}
