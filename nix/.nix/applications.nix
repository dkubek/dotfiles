{ config, pkgs, ... }:

{
  users.users.unemployed.packages = with pkgs; [
    # Basic system utilities
    psmisc mlocate wget unzip pciutils
    ncdu bmon htop file wicd tree
    git
    stow

    manpages
    (vimHugeX.override { python = python3; })

    arandr lxappearance xorg.xev

    pass
    gnupg

    firefox
    deluge
    discord
    mpv
    redshift
    calibre
    anki
    thunderbird
    discord
    zathura
    octave
    scrot
    texlive.combined.scheme-full
    
    
    rxvt_unicode-with-plugins
    feh
    ranger
    rofi
    rofi-pass
    wireguard
    openvpn

    adapta-gtk-theme
    adapta-kde-theme
    gtk-engine-murrine
    numix-gtk-theme
    papirus-icon-theme
    bibata-cursors

    clang
    gcc
    ctags

    # Haskell platform
    stack
    cabal2nix

    # I'm sorry
    nodejs

    (
    let
      my-python-packages = python-packages: with python-packages; [
        setuptools
        pip
        virtualenv

        pynvim
        flake8 pylint yapf
        jedi
        ]; 
      python-with-my-packages = python37.withPackages my-python-packages;
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

  documentation.dev.enable = true;

  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
}
