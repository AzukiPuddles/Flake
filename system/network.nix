{
  systemd.network.wait-online.enable = false;
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["192.168.1.200" "1.1.1.1"];
  };
}