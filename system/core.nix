{
  inputs,
  nixpkgs,
  self,
  ...
}: {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    system = "x86_64-linux";
    modules = [
      ./../hosts/nixos/configuration.nix
      ./bootloader.nix
      ./desktop.nix
      ./network.nix
      ./sound.nix
      ./programs.nix
      ./system.nix
      ./users.nix
    ];
  };
}