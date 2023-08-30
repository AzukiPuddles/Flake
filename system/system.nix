{
  config,
  pkgs,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "23.05";
  virtualisation.virtualbox.guest = {
    enable = true;
    x11 = true;
  };
}