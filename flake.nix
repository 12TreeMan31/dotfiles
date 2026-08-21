{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      homeConfigurations = {
	archwood = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./archwood.nix
	    ./desktop.nix
	    nixvim.homeManagerModules.nixvim
            ./nixvim.nix
	  ];
	};

        stickpad = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./stickpad.nix
	    ./desktop.nix
	    ./email.nix
	    ./music.nix
	    nixvim.homeManagerModules.nixvim
            ./nixvim.nix
	  ];
	};

	treepad =  home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;	
	  
	  modules = [
	    ./treepad.nix
	    ./desktop.nix
	    ./email.nix
	    ./music.nix
	    nixvim.homeManagerModules.nixvim
            ./nixvim.nix
	  ];
	};
      };
    };
}
