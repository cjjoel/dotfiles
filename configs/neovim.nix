{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;
  plugins = with pkgs.vimPlugins; [
    vim-nix
    lightline-vim
  ];
  extraConfig = ''
    filetype plugin indent on
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set relativenumber
    set number
    set nohlsearch
    set hidden
    set scrolloff=8
  '';
}
