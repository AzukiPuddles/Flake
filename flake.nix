{
  description = "Azuki's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs:
  nixosConfigurations = import ./system/core.nix {
    inherit self nixpkgs inputs;
  };
}