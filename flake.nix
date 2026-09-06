{
  description = "t14 gen 2 flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    stylix.url = "github:nix-community/stylix/release-26.05";
    concord.url = "github:chojs23/concord";
  };

  outputs = { self, nixpkgs, stylix, concord, ... }@inputs: 
      let
	lib = nixpkgs.lib;
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
      in {
	  nixosConfigurations = {
	      penrose = lib.nixosSystem {
		  inherit system;
		  specialArgs = { inherit inputs; };
		  modules = [ 
		  stylix.nixosModules.stylix
		  ./configuration.nix
		  ];
	      };
	  };
	  };
}
