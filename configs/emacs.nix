# https://github.com/benkolera/nix/blob/master/home-manager/default.nix

{ pkgs, ... }:

{
  enable = true;
  extraPackages = epkgs: with epkgs; [
    use-package
    nix-mode
    all-the-icons
    doom-modeline
    doom-themes
    evil
    dashboard
    which-key
    evil-leader
    evil-collection
    helm
    helm-projectile
    treemacs
    treemacs-evil
    treemacs-projectile
  ];
}
