{ config, pkgs, ... }:

{
  users.users.unemployed.packages = with pkgs; [
    psmisc mlocate wget
    htop
    git
    stow
    
    arandr lxappearance

    pass
    gnupg

    firefox
    deluge
    mpv
    redshift
    calibre
    anki
    thunderbird
    discord
    
    rofi
    rofi-pass
  ];
}
