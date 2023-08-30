{
  description = "Azuki's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    defaultPackage = self.flake;
    selfPkgs = import ./pkgs;
  in {
    nixosConfigurations = import ./core/default.nix {
      inherit self nixpkgs inputs;
    };
  };
}