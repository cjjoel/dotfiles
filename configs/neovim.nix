{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;
  plugins = with pkgs.vimPlugins; [
    vim-nix
    lightline-vim
  ];
  extraConfig = ''
    set number
  '';
}
