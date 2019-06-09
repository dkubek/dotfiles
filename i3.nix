{ confif, pkgs, ... }:

{
  imports = [ ./applications.nix ];

  fonts.fonts = with pkgs; [ noto-fonts noto-fonts-emoji ];

  programs.ssh.startAgent = true;
  programs.gnupg.agent.enable = true;
}
