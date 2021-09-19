{ config, pkgs, ... }:

{
  services.openvpn.servers =  {
    openvpn = { 
      config = "/etc/openvpn/ovpn_tcp/cz83.nordvpn.com.tcp.ovpn";
      autoStart = true;
    };
  };
}
