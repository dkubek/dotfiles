{ config, pkgs, ... }:

{
  users.users.unemployed.packages = with pkgs; [
    psmisc mlocate wget unzip 
    ncdu bmon htop
    git
    stow
    vim_configurable

    arandr lxappearance-gtk3

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
    zathura
    octave
    scrot
    
    tree
    
    rxvt_unicode-with-plugins
    feh
    ranger
    rofi
    rofi-pass

    adapta-gtk-theme
    adapta-kde-theme
    gtk-engine-murrine
    numix-gtk-theme
    papirus-icon-theme
    bibata-cursors

    clang

    # Haskell platform
    stack
    cabal2nix

    (
    let
      my-python-packages = python-packages: with python-packages; [
        requests
        pip
        jedi
        matplotlib numpy networkx pandas
        notebook
        ]; 
      python-with-my-packages = python3.withPackages my-python-packages;
    in
      python-with-my-packages
    )
  ];

  fonts.fonts = with pkgs; [ noto-fonts noto-fonts-emoji hack-font font-awesome_5 hack-font];

  # Enable ZSH with oh-my-zsh framework
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "common-aliases" "compleat" "gitfast" "pylint" "python" "man" "pass" "wd" ];
    theme = "agnoster";
  };

  programs.ssh.startAgent = true;
  programs.gnupg.agent.enable = true;

  virtualisation.docker.enable = true;
}
