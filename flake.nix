{
  description = "A dev environment for PHP with Neovim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    phps.url = "github:fossar/nix-phps";
  };

  outputs = { self, nixpkgs, flake-utils, phps, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_21
            pkgs.neovim
            phps.packages.${system}.php74
            pkgs.ripgrep
            pkgs.perl
            pkgs.lua5_1
            pkgs.unzip
            pkgs.quicktype
            (pkgs.callPackage ./composer.nix {
              inherit (pkgs) fetchurl makeWrapper unzip lib;
              mkDerivation = pkgs.stdenv.mkDerivation;
              php = phps.packages.${system}.php74;
            })
            (pkgs.callPackage ./phpunit.nix {
              inherit (pkgs) fetchurl makeWrapper unzip lib;
              mkDerivation = pkgs.stdenv.mkDerivation;
              php = phps.packages.${system}.php74;
            })
          ];

          shellHook = ''
            # Setup environment variables if needed
          '';
        };
      });
}

