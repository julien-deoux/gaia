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
    let
      macosCfg = {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        extraSpecialArgs = {
          copyToClipboard = "pbcopy";
        };
      };
      linuxCfg = {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = {
          copyToClipboard = "xclip -selection clipboard -i";
        };
      };

    in
    {
      packages."aarch64-darwin".default = home-manager.packages."aarch64-darwin".default;
      packages."x86_64-linux".default = home-manager.packages."x86_64-linux".default;

      homeConfigurations = {
        "home-macos" = home-manager.lib.homeManagerConfiguration (
          macosCfg
          // {
            modules = [
              ./base.nix
              ./macos.nix
              ./home.nix
              ./programs
            ];
          }
        );
        "home-linux" = home-manager.lib.homeManagerConfiguration (
          linuxCfg
          // {
            modules = [
              ./base.nix
              ./linux.nix
              ./home.nix
              ./programs
            ];
          }
        );
      };
    };
}
