{ confif, pkgs, ... }:

{
  imports = [
    # i3 configuration
    ./desktop/i3.nix

    # xmonad configuration
    #./desktop/xmonad.nix
  ];
}
