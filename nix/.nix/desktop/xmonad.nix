{ confif, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autorun = false;
    displayManager.startx.enable = true;
    # xmonad
    windowManager.default = "xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
        haskellPackages.xmobar
      ];
    };

    environment.systemPackages = with pkgs; [ xmobar ]

    # lightDM with mini greeter
    # NOTE: To change colors follow the comments in ``extraConfig``
    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "unemployed";
      extraConfig = ''
          [greeter]
          # Whether to show the password input's label.
          show-password-label = true
          # The text of the password input's label.
          password-label-text = Password:
          # The text shown when an invalid password is entered. May be blank.
          invalid-password-text = Invalid Password
          # Show a blinking cursor in the password input.
          show-input-cursor = false
          # The text alignment for the password input. Possible values are:
          # "left" or "right"
          password-alignment = right
          show-password-label = false


          [greeter-hotkeys]
          # The modifier key used to trigger hotkeys. Possible values are:
          # "alt", "control" or "meta"
          # meta is also known as the "Windows"/"Super" key
          mod-key = meta
          # Power management shortcuts (single-key, case-sensitive)
          shutdown-key = s
          restart-key = r
          hibernate-key = h
          suspend-key = u


          [greeter-theme]
          # A color from X11's `rgb.txt` file, a quoted hex string(`"#rrggbb"`) or a
          # RGB color(`rgb(r,g,b)`) are all acceptable formats.

          # The font to use for all text
          font = "Heck"
          # The font size to use for all text
          font-size = 12px
          # The default text color
          text-color = "#282828"
          # The color of the error text
          error-color = "#fb4934"
          # An absolute path to an optional background image.
          # The image will be displayed centered & unscaled.
          background-image = "/home/unemployed/.wallpaper"
          # The screen's background color.
          background-color = "#665c54"
          # The password window's background color
          window-color = "#fbf1c7"
          # The color of the password window's border
          border-color = "#d5c4a1"
          # The width of the password window's border.
          # A trailing `px` is required.
          border-width = 2px
          # The pixels of empty space around the password input.
          # Do not include a trailing `px`.
          layout-space = 15
          # The color of the text in the password input.
          password-color = "#282828"
          # The background color of the password input.
          password-background-color = "#fbf1c7"
          # The color of the password input's border.
          password-border-color = "#000000"
          # The width of the password input's border.
          password-border-width = 0
      '';
    };
  };
}
