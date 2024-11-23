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
      packages."x86_64-linux".default = home-manager.packages."x86_64-linux".default;

      homeConfigurations = {
        "julien-macos" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          modules = [
            ./base.nix
            ./macos.nix
            ./programs
          ];
        };
        "julien-linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [
            ./base.nix
            ./linux.nix
            ./programs
          ];
        };
      };
    };
}
