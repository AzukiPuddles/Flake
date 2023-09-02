{
  description = "Home Manager configuration of azuki";
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = github:the-argus/spicetify-nix;
  };
  outputs = { nixpkgs, home-manager, spicetify-nix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."azuki" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit spicetify-nix;};
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          ./spicetify.nix # file where you configure spicetify
          ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}