{
  description = "Base home-manager flake -- Julien Déoux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    {
      packages."aarch64-darwin".default = home-manager.packages."aarch64-darwin".default;

      homeConfigurations = {
        "julien" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          modules = [
            ./home.nix
            ./programs
          ];
        };
      };
    };
}
