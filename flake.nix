{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      homeConfigurations = {
	archwood = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./desktop.nix
	    ./archwood.nix
	  ];
	};

        stickpad = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./desktop.nix
	    ./email.nix
	    ./music.nix
	  ];
	};

	treepad =  home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./desktop.nix
	    ./email.nix
	    ./music.nix
	  ];
	};
      };
    };
}
