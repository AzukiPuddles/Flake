{pkgs, ...}: {
  home.packages = with pkgs; [
    home-manager
    btop
    git
    neofetch
    kwrite
  ];
}