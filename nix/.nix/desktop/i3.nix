{ confif, pkgs, ... }:

{
  # Override variables in polybar build to build it with i3 and pulse support.
  nixpkgs.overlays = [
    (self: super: {
      my-polybar = super.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
    })
  ];

  services.xserver = {
    enable = true;
    autorun = false;
    layout = "us";
    xkbOptions = "eurosign:e";

    displayManager.defaultSession = "none+i3";
    desktopManager.xterm.enable = true;
    displayManager.startx.enable = true;

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [ 
        i3status i3lock 
        my-polybar
        dunst
        xdotool
        compton
      ];
    };
  };
}
