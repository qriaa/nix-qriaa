{
  description = "qriaa's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      hostname = "qriaa-T440s";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix ];
      };
    };
}
